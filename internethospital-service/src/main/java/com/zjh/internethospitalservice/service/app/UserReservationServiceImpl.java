package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.DiagnoseConstants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.dto.DispensingDoctorDto;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.*;
import com.zjh.internethospitalapi.service.app.PatientService;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalapi.service.app.SeasonTimeService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalapi.service.doc.DocRecipeService;
import com.zjh.internethospitalapi.service.img.ImgService;
import com.zjh.internethospitalservice.mapper.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.util.*;
import java.util.concurrent.TimeUnit;
import java.util.stream.Collectors;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:29
 */
@Service("userReservationService")
public class UserReservationServiceImpl implements UserReservationService {
    private final PatientService patientService;
    private final UserReservationImgMapper userReservationImgMapper;
    private final UserReservationMapper userReservationMapper;
    private final ScheduleDoctorMapper scheduleDoctorMapper;
    private final SeasonTimeService seasonTimeService;
    private final ScheduleDepartmentMapper scheduleDepartmentMapper;
    private final ImgService imgService;
    private final ScheduleDoctorService scheduleDoctorService;
    private final UserReservationStatusMapper userReservationStatusMapper;
    private final DiagnoseMapper diagnoseMapper;
    private final DocRecipeService docRecipeService;
    private final DoctorMapper doctorMapper;
    private final StringRedisTemplate stringRedisTemplate;
    private final OrderDetailMapper orderDetailMapper;
    private final RefundMapper refundMapper;

    @Autowired
    public UserReservationServiceImpl(PatientService patientService, UserReservationImgMapper userReservationImgMapper,
                                      UserReservationMapper userReservationMapper, ScheduleDoctorMapper scheduleDoctorMapper,
                                      SeasonTimeService seasonTimeService, ScheduleDepartmentMapper scheduleDepartmentMapper, ImgService imgService, ScheduleDoctorService scheduleDoctorService, UserReservationStatusMapper userReservationStatusMapper, DiagnoseMapper diagnoseMapper,
                                      DocRecipeService docRecipeService, DoctorMapper doctorMapper, StringRedisTemplate stringRedisTemplate, OrderDetailMapper orderDetailMapper, RefundMapper refundMapper) {
        this.patientService = patientService;
        this.userReservationImgMapper = userReservationImgMapper;
        this.userReservationMapper = userReservationMapper;
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.seasonTimeService = seasonTimeService;
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
        this.imgService = imgService;
        this.scheduleDoctorService = scheduleDoctorService;
        this.userReservationStatusMapper = userReservationStatusMapper;
        this.diagnoseMapper = diagnoseMapper;
        this.docRecipeService = docRecipeService;
        this.doctorMapper = doctorMapper;
        this.stringRedisTemplate = stringRedisTemplate;
        this.orderDetailMapper = orderDetailMapper;
        this.refundMapper = refundMapper;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertNormalUserReservation(UserReservationDto userReservationDto) {
        UserReservation userReservation = new UserReservation();
        BeanUtils.copyProperties(userReservationDto, userReservation);


        /**
         * 如果scheduleTime为今天，是普通挂号，否则是预约挂号
         * 普通挂号 1 预约挂号 2
         * */
        if (LocalDate.now().toString().equals(userReservationDto.getScheduleTime())) {
            userReservation.setType(1);
        } else {
            userReservation.setType(2);
        }

        DispensingDoctorDto dispensingDoctorDto = dispensingDoctor(userReservationDto);
        userReservation.setDoctorId(dispensingDoctorDto.getDoctorId());
        userReservation.setScheduleDoctorId(dispensingDoctorDto.getScheduleDoctorId());
        userReservation.setDoctorName(dispensingDoctorDto.getDoctorName());
        commonGenerateUserReservation(userReservationDto, userReservation);

        //就诊超时判断
        makeTimeOutFlag(userReservation);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void insertExpertUserReservation(UserReservationDto userReservationDto) {
        UserReservation userReservation = new UserReservation();
        BeanUtils.copyProperties(userReservationDto, userReservation);
        userReservation.setType(3);
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(userReservation.getScheduleDoctorId());
        String timeInterval = userReservation.getTimeInterval();
        if(timeInterval.equals(Constants.MORNING))
        {
            scheduleDoctor.setIsMorningStart(1);
        }
        else if(timeInterval.equals(Constants.AFTERNOON)){
            scheduleDoctor.setIsAfternoonStart(1);
        }
        else if(timeInterval.equals(Constants.NIGHT)){
            scheduleDoctor.setIsNightStart(1);
        }
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
        commonGenerateUserReservation(userReservationDto, userReservation);

        //就诊超时判断
        makeTimeOutFlag(userReservation);
    }

    @Override
    public void giveStar(Integer doctorId, Integer starRate, String userReservationUuId) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("doctorId", doctorId)
                .andEqualTo("isDelete", 0)
                .andEqualTo("status", 18);
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        Doctor doctor = doctorMapper.selectByPrimaryKey(doctorId);
        BigDecimal beforeRate = new BigDecimal(doctor.getStarLevel());
        beforeRate = beforeRate.add(new BigDecimal(starRate));
        BigDecimal nowRate = beforeRate.divide(new BigDecimal(userReservationList.size() + 1), 2, RoundingMode.HALF_UP);
        doctor.setStarLevel(nowRate.toString());
        doctor.setUpdateTime(new Date());
        doctorMapper.updateByPrimaryKeySelective(doctor);
        UserReservation userReservation = getUserReservationByUuId(userReservationUuId);
        userReservation.setStatus(18);
        userReservation.setIsEvaluate("1");
        userReservation.setEvaluateStar(starRate.toString());
        userReservation.setUpdateTime(new Date());
        userReservationMapper.updateByPrimaryKeySelective(userReservation);
    }

    @Override
    public UserReservation getAllDetailByUuId(String uuid, boolean adminFlag) {
        //就诊基本信息
        UserReservation userReservation = getUserReservationDetail(uuid);
        Diagnose diagnose = new Diagnose();
        diagnose.setUserReservationUuId(uuid);
        diagnose.setIsDelete(0);
        diagnose = diagnoseMapper.selectOne(diagnose);
        userReservation.setDiagnose(diagnose);
        //管理员和医生可以看到未审核通过的药方
        if (adminFlag) {
            List<Medical> recipeMedicalList = docRecipeService.getRecipeDetailListByUserReservationUuid(uuid);
            userReservation.setMedicalList(recipeMedicalList);
        }
        //用户只能看到审核通过的药方
        if (!adminFlag && Constants.TWO.equals(userReservation.getAuditStatus())
                && Constants.ONE.equals(userReservation.getIsAudit())) {
            List<Medical> recipeMedicalList = docRecipeService.getRecipeDetailListByUserReservationUuid(uuid);
            userReservation.setMedicalList(recipeMedicalList);
        }
        return userReservation;
    }

    @Override
    public UserReservation getUserReservationDetail(String userReservationUUId) {
        UserReservation userReservation = getUserReservationByUuId(userReservationUUId);
        Patient patient = patientService.selectPatientById(userReservation.getPatientId(), userReservation.getUserId());
        userReservation.setPatient(patient);
        Integer scheduleDoctorId = userReservation.getScheduleDoctorId();
        Integer callNo = null;
        UserReservation beforeUserReservation = getBeforeUserReservation(scheduleDoctorId, userReservation.getTimeInterval());
        if (beforeUserReservation == null && userReservation.getStatus().equals(11)) {
            //-1表示就诊中
            callNo = -1;
        } else if (beforeUserReservation == null && !userReservation.getStatus().equals(11)) {
            //未开始叫号
            callNo = 0;
        } else if (beforeUserReservation != null && !userReservation.getStatus().equals(11)) {
            //正在就诊前一个的号
            callNo = beforeUserReservation.getRegNo();
        }
        if (patient == null || callNo == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        userReservation.setCallNo(callNo);

        //用户就诊图片构造
        List<Img> imgList = imgService.listUserReservationImg(userReservation.getUuId());
        List<String> imgPathList = new LinkedList<>();
        for (Img img : imgList
        ) {
            imgPathList.add(img.getPath());
        }
        userReservation.setImgPathList(imgPathList);

        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setUserReservationUuId(userReservationUUId);
        orderDetail.setIsDelete(0);
        orderDetail = orderDetailMapper.selectOne(orderDetail);
        if (orderDetail != null) {
            userReservation.setOutTradeNo(orderDetail.getOutTradeNo());
        } else {
            userReservation.setOutTradeNo("-1");
        }
        return userReservation;
    }

    @Override
    public List<UserReservation> getUserReservationByUserIdIsNotEnd(Integer userId) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("userId", userId);
        return userReservationMapper.selectByExample(example);
    }

    @Override
    public PageInfo<UserReservation> listUserReservationOfUserInPage(Integer userId, Integer pageNo, Integer pageSize) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("userId", userId);
        PageHelper.startPage(pageNo, pageSize);
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        for (UserReservation userReservation : userReservationList
        ) {
            String stateName = userReservationStatusMapper.selectByPrimaryKey(userReservation.getStatus()).getStateName();
            userReservation.setPayStateDescription(stateName);
            //获取用户就诊列表时，处于审方通过状态的，变为待评价状态
            if (userReservation.getStatus() == 14) {
                userReservation.setStatus(17);
                userReservation.setUpdateTime(new Date());
                userReservationMapper.updateByPrimaryKeySelective(userReservation);
            }

        }
        return new PageInfo<>(userReservationList);
    }

    @Override
    public void updateUserReservationSelective(UserReservation userReservation) {
        userReservation.setUpdateTime(new Date());
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId", userReservation.getUuId());
        int i = userReservationMapper.updateByExampleSelective(userReservation, example);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_USER_RESERVATION_FAIL);
        }
    }

    @Override
    public UserReservation getUserReservationByUuId(String uuid) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId", uuid).andEqualTo("isDelete", 0);
        UserReservation userReservation = userReservationMapper.selectOneByExample(example);
        if (userReservation == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        } else {
            return userReservation;
        }
    }

    /**
     * 向数据库内添加对应 userReservationImg
     */
    private void generateUserReservationImg(List<Integer> imgIdList, int userReservationId) {
        int result = 0;
        for (Integer imgId : imgIdList
        ) {
            UserReservationImg userReservationImg = new UserReservationImg();
            userReservationImg.setImgId(imgId);
            userReservationImg.setUserReservationId(userReservationId);
            userReservationImg.setCreateTime(new Date());
            userReservationImg.setUpdateTime(new Date());
            result += userReservationImgMapper.insert(userReservationImg);
        }
        if (result != imgIdList.size()) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
    }

    /**
     * 普通科室
     * 预约医生
     * 普通科室用户就诊,平均该时段上班的医生
     *
     * @param userReservationDto
     * @return DispensingDoctorDto
     */
    private DispensingDoctorDto dispensingDoctor(UserReservationDto userReservationDto) {
        List<DispensingDoctorDto> dispensingDoctorDtoList = new ArrayList<>();
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("scheduleDepartmentId", userReservationDto.getScheduleDepartmentId());
        List<ScheduleDoctor> scheduleDoctorList;
        String timeInterval = userReservationDto.getTimeInterval();
        ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
        scheduleDepartment.setId(userReservationDto.getScheduleDepartmentId());
        scheduleDepartment = scheduleDepartmentMapper.selectOne(scheduleDepartment);
        //根据时间段选取医生，构建待分配号源医生列表
        switch (timeInterval) {
            case Constants.MORNING: {
                //判断是否还有号源
                int timeExistNumber = scheduleDepartment.getMorningTotalNumber() - scheduleDepartment.getMorningNumber();
                if (timeExistNumber <= 0) {
                    throw new InternetHospitalException(ExceptionConstants.HAS_NO_CLINIC_NUMBER);
                }
                example.and().andEqualTo("doctorMorningHas", 1);
                scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
                for (ScheduleDoctor scheduleDoctor : scheduleDoctorList
                ) {
                    DispensingDoctorDto dispensingDoctorDto = new DispensingDoctorDto();
                    dispensingDoctorDto.setDoctorAppointmentNumber(scheduleDoctor.getDoctorMorningNumber() + 1);
                    dispensingDoctorDto.setDoctorTotalAppointmentNumber(scheduleDoctor.getDoctorMorningTotalNumber());
                    dispensingDoctorDto.setDoctorId(scheduleDoctor.getDoctorId());
                    dispensingDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                    dispensingDoctorDto.setDoctorName(scheduleDoctor.getDoctorName());
                    dispensingDoctorDto.setTimeInterval(timeInterval);
                    dispensingDoctorDtoList.add(dispensingDoctorDto);

                    //开始上午医生排班
                    scheduleDoctor.setIsMorningStart(1);
                    scheduleDoctor.setUpdateTime(new Date());
                    scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
                }

                //开始上午科室排班
                scheduleDepartment.setIsMorningStart(1);

                break;
            }
            case Constants.AFTERNOON: {
                int timeExistNumber = scheduleDepartment.getAfternoonTotalNumber() - scheduleDepartment.getAfternoonNumber();
                if (timeExistNumber <= 0) {
                    throw new InternetHospitalException(ExceptionConstants.HAS_NO_CLINIC_NUMBER);
                }
                example.and().andEqualTo("doctorAfternoonHas", 1);
                scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
                for (ScheduleDoctor scheduleDoctor : scheduleDoctorList
                ) {
                    DispensingDoctorDto dispensingDoctorDto = new DispensingDoctorDto();
                    dispensingDoctorDto.setDoctorAppointmentNumber(scheduleDoctor.getDoctorAfternoonNumber() + 1);
                    dispensingDoctorDto.setDoctorTotalAppointmentNumber(scheduleDoctor.getDoctorAfternoonTotalNumber());
                    dispensingDoctorDto.setDoctorId(scheduleDoctor.getDoctorId());
                    dispensingDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                    dispensingDoctorDto.setDoctorName(scheduleDoctor.getDoctorName());
                    dispensingDoctorDto.setTimeInterval(timeInterval);
                    dispensingDoctorDtoList.add(dispensingDoctorDto);

                    //开始下午医生排班
                    scheduleDoctor.setIsAfternoonStart(1);
                    scheduleDoctor.setUpdateTime(new Date());
                    scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
                }

                //开始下午排班
                scheduleDepartment.setIsAfternoonStart(1);

                break;
            }
            case Constants.NIGHT: {
                int timeExistNumber = scheduleDepartment.getNightTotalNumber() - scheduleDepartment.getNightNumber();
                if (timeExistNumber <= 0) {
                    throw new InternetHospitalException(ExceptionConstants.HAS_NO_CLINIC_NUMBER);
                }
                example.and().andEqualTo("doctorNightHas", 1);
                scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
                for (ScheduleDoctor scheduleDoctor : scheduleDoctorList
                ) {
                    DispensingDoctorDto dispensingDoctorDto = new DispensingDoctorDto();
                    dispensingDoctorDto.setDoctorAppointmentNumber(scheduleDoctor.getDoctorNightNumber() + 1);
                    dispensingDoctorDto.setDoctorTotalAppointmentNumber(scheduleDoctor.getDoctorNightTotalNumber());
                    dispensingDoctorDto.setDoctorId(scheduleDoctor.getDoctorId());
                    dispensingDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                    dispensingDoctorDto.setDoctorName(scheduleDoctor.getDoctorName());
                    dispensingDoctorDto.setTimeInterval(timeInterval);
                    dispensingDoctorDtoList.add(dispensingDoctorDto);

                    //开始晚上医生排班
                    scheduleDoctor.setIsNightStart(1);
                    scheduleDoctor.setUpdateTime(new Date());
                    scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
                }

                //开始晚上排班
                scheduleDepartment.setIsNightStart(1);

                break;
            }
        }


        scheduleDepartment.setUpdateTime(new Date());
        scheduleDepartmentMapper.updateByPrimaryKeySelective(scheduleDepartment);

        //所有可分配号源医生中，已挂号源最少的医生,需要初始化数值，防止null exception
        dispensingDoctorDtoList = dispensingDoctorDtoList.stream()
                .filter(t1 -> t1.getDoctorAppointmentNumber() <= t1.getDoctorTotalAppointmentNumber())
                .sorted(Comparator.comparingInt(DispensingDoctorDto::getDoctorAppointmentNumber)).collect(Collectors.toList());
        return dispensingDoctorDtoList.get(0);
    }


    @Override
    public void appointmentNormal(UserReservation userReservation, Integer scheduleDepartmentId) {
        Integer scheduleDoctorId = userReservation.getScheduleDoctorId();
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId);
        ScheduleDepartment scheduleDepartment = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartmentId);
        switch (userReservation.getTimeInterval()) {
            case Constants.MORNING:
                scheduleDoctor.setDoctorMorningNumber(scheduleDoctor.getDoctorMorningNumber() + 1);
                scheduleDepartment.setMorningNumber(scheduleDepartment.getMorningNumber() + 1);
                userReservation.setRegNo(scheduleDoctor.getDoctorMorningNumber());
                break;
            case Constants.AFTERNOON:
                scheduleDoctor.setDoctorAfternoonNumber(scheduleDoctor.getDoctorAfternoonNumber() + 1);
                scheduleDepartment.setAfternoonNumber(scheduleDepartment.getAfternoonNumber() + 1);
                userReservation.setRegNo(scheduleDoctor.getDoctorAfternoonNumber());
                break;
            case Constants.NIGHT:
                scheduleDoctor.setDoctorNightNumber(scheduleDoctor.getDoctorNightNumber() + 1);
                scheduleDepartment.setNightNumber(scheduleDepartment.getNightNumber() + 1);
                userReservation.setRegNo(scheduleDoctor.getDoctorNightNumber());
                break;
        }
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDepartment.setUpdateTime(new Date());
        int result = scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
        int result2 = scheduleDepartmentMapper.updateByPrimaryKeySelective(scheduleDepartment);
        if (result != 1 || result2 != 1) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
    }

    @Override
    public void appointmentExpert(UserReservation userReservation) {
        String timeInterval = userReservation.getTimeInterval();
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(userReservation.getScheduleDoctorId());
        //区分时间段
        switch (timeInterval) {
            case Constants.MORNING: {
                int timeExistNumber = scheduleDoctor.getDoctorMorningTotalNumber() - scheduleDoctor.getDoctorMorningNumber();
                if (timeExistNumber <= 0) {
                    throw new InternetHospitalException(ExceptionConstants.HAS_NO_CLINIC_NUMBER);
                }
                scheduleDoctor.setDoctorMorningNumber(scheduleDoctor.getDoctorMorningNumber() + 1);
                userReservation.setRegNo(scheduleDoctor.getDoctorMorningNumber());
                break;
            }
            case Constants.AFTERNOON: {
                int timeExistNumber = scheduleDoctor.getDoctorAfternoonTotalNumber() - scheduleDoctor.getDoctorAfternoonNumber();
                if (timeExistNumber <= 0) {
                    throw new InternetHospitalException(ExceptionConstants.HAS_NO_CLINIC_NUMBER);
                }
                scheduleDoctor.setDoctorAfternoonNumber(scheduleDoctor.getDoctorAfternoonNumber() + 1);
                userReservation.setRegNo(scheduleDoctor.getDoctorAfternoonNumber());
                break;
            }
            case Constants.NIGHT: {
                int timeExistNumber = scheduleDoctor.getDoctorNightTotalNumber() - scheduleDoctor.getDoctorNightNumber();
                if (timeExistNumber <= 0) {
                    throw new InternetHospitalException(ExceptionConstants.HAS_NO_CLINIC_NUMBER);
                }
                scheduleDoctor.setDoctorNightNumber(scheduleDoctor.getDoctorNightNumber() + 1);
                userReservation.setRegNo(scheduleDoctor.getDoctorNightNumber());
                break;
            }
        }
        scheduleDoctor.setUpdateTime(new Date());
        int result = scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
        if (result != 1) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
    }

    @Override
    public UserReservation getBeforeUserReservation(Integer scheduleDoctorId, String timeInterval) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("scheduleDoctorId", scheduleDoctorId)
                .andEqualTo("timeInterval", timeInterval)
                .andEqualTo("isDelete", 1)
                .andEqualTo("isCalled", 1);
        example.orderBy("regNo").desc();
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        if (userReservationList.size() == 0) {
            return null;
        } else {
            return userReservationList.get(0);
        }
    }

    @Override
    public void applyRefund(String userReservationUuId,String reason,String refundAmount) {
        UserReservation userReservation = getUserReservationByUuId(userReservationUuId);
        if (userReservation.getStatus().equals(4) || userReservation.getStatus().equals(5)){
            Integer doctorId = userReservation.getDoctorId();
            String doctorName = userReservation.getDoctorName();
            String departmentName = userReservation.getDepartmentName();
            String patientName = userReservation.getPatientName();
            String clinicDate = userReservation.getClinicDate();
            String clinicTime = userReservation.getClinicTime();
            String timeInterval = userReservation.getTimeInterval();

            Refund refund = new Refund();
            refund.setPrice(refundAmount);
            refund.setReason(reason);
            refund.setDoctorId(doctorId);
            refund.setDeptName(departmentName);
            refund.setDoctorName(doctorName);
            refund.setPatientName(patientName);
            refund.setClinicDate(clinicDate);
            refund.setClinicTime(clinicTime);
            refund.setTimeInterval(timeInterval);
            refund.setUserReservationUuId(userReservationUuId);
            refund.setIsDelete(0);
            refund.setUpdateTime(new Date());
            refund.setCreateTime(new Date());
            refundMapper.insertSelective(refund);

            userReservation.setStatus(6);
            userReservation.setUpdateTime(new Date());
            updateUserReservationSelective(userReservation);
        }
        else {
            throw new InternetHospitalException(ExceptionConstants.NOT_REFUND_STATUS);
        }
    }

    private void commonGenerateUserReservation(UserReservationDto userReservationDto, UserReservation userReservation) {
        userReservation.setPatientName(patientService.selectPatientById(userReservation.getPatientId(), userReservationDto.getUserId()).getRealName());
        userReservation.setConditionDesc(userReservationDto.getAccentDetail());
        userReservation.setClinicPrice(userReservationDto.getPrice());
        //就诊时间
        JSONObject object = seasonTimeService.getSeasonTimeByTimeInterval(userReservationDto.getScheduleTime(),
                userReservation.getTimeInterval());
        userReservation.setClinicTime(object.get("start") + "-" + object.get("end"));
        //就诊日期
        userReservation.setClinicDate(userReservationDto.getScheduleTime());
        //初诊复诊
        if (userReservationDto.getAccentVisit().equals(DiagnoseConstants.FIRST_VISIT)) {
            userReservation.setIsReturnVisit("0");
        } else if (userReservationDto.getAccentVisit().equals(DiagnoseConstants.RETURN_VISIT)) {
            userReservation.setIsReturnVisit("1");
        }
        userReservation.setCreateTime(new Date());
        userReservation.setUpdateTime(new Date());

        int result = userReservationMapper.insertSelective(userReservation);
        if (result != 1) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
        int userReservationId = userReservation.getId();
        //更新 userReservation <=> img 对应关系
        generateUserReservationImg(userReservationDto.getImgIdList(), userReservationId);
    }

    /**
     * 就诊超时
     */
    private void makeTimeOutFlag(UserReservation userReservation) {
        //就诊超时判断
        //当天，存入redis内key为 当天挂号+uuId，时效30分钟，判断key存在性
        if (userReservation.getType().equals(1)) {
            stringRedisTemplate.opsForValue()
                    .set("当天挂号" + userReservation.getUuId(), userReservation.getClinicDate(), 30, TimeUnit.MINUTES);
        }
        //预约，存入redis内key为 预约+uuId，value 为预约日期，判断支付日期是否为预约日期前一天
        else {
            stringRedisTemplate.opsForValue().set("预约" + userReservation.getUuId(), userReservation.getClinicDate());
        }
    }
}
