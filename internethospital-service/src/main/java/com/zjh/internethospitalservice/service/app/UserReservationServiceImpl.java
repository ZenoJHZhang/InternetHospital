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
import com.zjh.internethospitalapi.service.app.*;
import com.zjh.internethospitalapi.service.img.ImgService;
import com.zjh.internethospitalservice.mapper.*;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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

    @Autowired
    public UserReservationServiceImpl(PatientService patientService, UserReservationImgMapper userReservationImgMapper,
                                      UserReservationMapper userReservationMapper, ScheduleDoctorMapper scheduleDoctorMapper,
                                      SeasonTimeService seasonTimeService, ScheduleDepartmentMapper scheduleDepartmentMapper, ImgService imgService, ScheduleDoctorService scheduleDoctorService, UserReservationStatusMapper userReservationStatusMapper) {
        this.patientService = patientService;
        this.userReservationImgMapper = userReservationImgMapper;
        this.userReservationMapper = userReservationMapper;
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.seasonTimeService = seasonTimeService;
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
        this.imgService = imgService;
        this.scheduleDoctorService = scheduleDoctorService;
        this.userReservationStatusMapper = userReservationStatusMapper;
    }


    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer insertNormalUserReservation(UserReservationDto userReservationDto) {
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

        //更新排班表
        updateScheduleAppointmentNumber(dispensingDoctorDto, userReservationDto.getScheduleDepartmentId());

        userReservation.setDoctorId(dispensingDoctorDto.getDoctorId());
        userReservation.setScheduleDoctorId(dispensingDoctorDto.getScheduleDoctorId());
        userReservation.setDoctorName(dispensingDoctorDto.getDoctorName());
        userReservation.setRegNo(dispensingDoctorDto.getDoctorAppointmentNumber());
        return commonGenerateUserReservation(userReservationDto, userReservation);
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public Integer insertExpertUserReservation(UserReservationDto userReservationDto) {
        UserReservation userReservation = new UserReservation();
        BeanUtils.copyProperties(userReservationDto, userReservation);

        userReservation.setType(3);
        appointmentExpert(userReservation);
        return commonGenerateUserReservation(userReservationDto, userReservation);
    }

    @Override
    public UserReservation getUserReservationDetail(String userReservationUUId,Integer userId) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId",userReservationUUId)
                .andEqualTo("userId",userId);
        UserReservation userReservation = userReservationMapper.selectOneByExample(example);
        if (userReservation == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        Patient patient = patientService.selectPatientById(userReservation.getPatientId(),userId);
        userReservation.setPatient(patient);
        Integer scheduleDoctorId = userReservation.getScheduleDoctorId();
        Integer callNo ;
        switch (userReservation.getTimeInterval()) {
            case Constants.MORNING:
                callNo = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId).getMorningCallNo();
                break;
            case Constants.AFTERNOON:
                callNo = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId).getAfternoonCallNo();
                break;
            default:
                callNo = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId).getNightCallNo();
                break;
        }
        if (patient == null || callNo == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        userReservation.setCallNo(callNo);
        return userReservation;
    }

    @Override
    public List<UserReservation> getUserReservationByUserIdIsNotEnd(Integer userId) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("userId", userId).andEqualTo("isEnd", 0);
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
        }
        return new PageInfo<>(userReservationList);
    }

    @Override
    public void updateUserReservationSelective(UserReservation userReservation) {
        userReservation.setUpdateTime(new Date());
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId",userReservation.getUuId());
        int i = userReservationMapper.updateByExampleSelective(userReservation,example);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_USER_RESERVATION_FAIL);
        }
    }

    @Override
    public UserReservation getUserReservationByUuId(String uuid) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId",uuid);
        UserReservation userReservation = userReservationMapper.selectOneByExample(example);
        if(userReservation == null){
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        else {
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

        //根据时间段选取医生，构建待分配号源医生列表
        if (timeInterval.equals(Constants.MORNING)) {
            example.and().andEqualTo("doctorMorningHas", 1);
            scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
            for (ScheduleDoctor scheduleDoctor : scheduleDoctorList
                    ) {
                DispensingDoctorDto dispensingDoctorDto = new DispensingDoctorDto();
                dispensingDoctorDto.setDoctorAppointmentNumber(scheduleDoctor.getDoctorMorningNumber());
                dispensingDoctorDto.setDoctorTotalAppointmentNumber(scheduleDoctor.getDoctorMorningTotalNumber());
                dispensingDoctorDto.setDoctorId(scheduleDoctor.getDoctorId());
                dispensingDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                dispensingDoctorDto.setDoctorName(scheduleDoctor.getDoctorName());
                dispensingDoctorDto.setTimeInterval(timeInterval);
                dispensingDoctorDtoList.add(dispensingDoctorDto);
            }
        } else if (timeInterval.equals(Constants.AFTERNOON)) {
            example.and().andEqualTo("doctorAfternoonHas", 1);
            scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
            for (ScheduleDoctor scheduleDoctor : scheduleDoctorList
                    ) {
                DispensingDoctorDto dispensingDoctorDto = new DispensingDoctorDto();
                dispensingDoctorDto.setDoctorAppointmentNumber(scheduleDoctor.getDoctorAfternoonNumber());
                dispensingDoctorDto.setDoctorTotalAppointmentNumber(scheduleDoctor.getDoctorAfternoonTotalNumber());
                dispensingDoctorDto.setDoctorId(scheduleDoctor.getDoctorId());
                dispensingDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                dispensingDoctorDto.setDoctorName(scheduleDoctor.getDoctorName());
                dispensingDoctorDto.setTimeInterval(timeInterval);
                dispensingDoctorDtoList.add(dispensingDoctorDto);
            }
        } else if (timeInterval.equals(Constants.NIGHT)) {
            example.and().andEqualTo("doctorNightHas", 1);
            scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
            for (ScheduleDoctor scheduleDoctor : scheduleDoctorList
                    ) {
                DispensingDoctorDto dispensingDoctorDto = new DispensingDoctorDto();
                dispensingDoctorDto.setDoctorAppointmentNumber(scheduleDoctor.getDoctorNightNumber());
                dispensingDoctorDto.setDoctorTotalAppointmentNumber(scheduleDoctor.getDoctorNightTotalNumber());
                dispensingDoctorDto.setDoctorId(scheduleDoctor.getDoctorId());
                dispensingDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                dispensingDoctorDto.setDoctorName(scheduleDoctor.getDoctorName());
                dispensingDoctorDto.setTimeInterval(timeInterval);
                dispensingDoctorDtoList.add(dispensingDoctorDto);
            }
        }

        //所有可分配号源医生中，已挂号源最少的医生,需要初始化数值，防止null exception
        DispensingDoctorDto minDispensingDoctorDto = dispensingDoctorDtoList.get(0);

        for (DispensingDoctorDto dispensingDoctorDto : dispensingDoctorDtoList
                ) {
            //当医生已挂号源小于总号源，即可再挂一个号
            if (dispensingDoctorDto.getDoctorAppointmentNumber() < dispensingDoctorDto.getDoctorTotalAppointmentNumber()) {
                //选取最少号源医生
                if (minDispensingDoctorDto.getDoctorAppointmentNumber() > dispensingDoctorDto.getDoctorAppointmentNumber()) {
                    BeanUtils.copyProperties(dispensingDoctorDto, minDispensingDoctorDto);
                }
            }
        }

        return minDispensingDoctorDto;
    }

    /**
     * 普通科室
     * 更新 scheduleDoctor 以及 scheduleDepartment 表，对应时刻号源数
     *
     * @param dispensingDoctorDto
     * @return
     */
    private void updateScheduleAppointmentNumber(DispensingDoctorDto dispensingDoctorDto, Integer scheduleDepartmentId) {
        Integer scheduleDoctorId = dispensingDoctorDto.getScheduleDoctorId();
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId);
        ScheduleDepartment scheduleDepartment = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartmentId);
        if (dispensingDoctorDto.getTimeInterval().equals(Constants.MORNING)) {
            scheduleDoctor.setDoctorMorningNumber(scheduleDoctor.getDoctorMorningNumber() + 1);
            scheduleDepartment.setMorningNumber(scheduleDepartment.getMorningNumber() + 1);
        } else if (dispensingDoctorDto.getTimeInterval().equals(Constants.AFTERNOON)) {
            scheduleDoctor.setDoctorAfternoonNumber(scheduleDoctor.getDoctorAfternoonNumber() + 1);
            scheduleDepartment.setAfternoonNumber(scheduleDepartment.getAfternoonNumber() + 1);
        } else if (dispensingDoctorDto.getTimeInterval().equals(Constants.NIGHT)) {
            scheduleDoctor.setDoctorNightNumber(scheduleDoctor.getDoctorNightNumber() + 1);
            scheduleDepartment.setNightNumber(scheduleDepartment.getNightNumber() + 1);
        }
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDepartment.setUpdateTime(new Date());
        int result = scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
        int result2 = scheduleDepartmentMapper.updateByPrimaryKeySelective(scheduleDepartment);
        if (result != 1 || result2 != 1) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
    }

    /**
     * 专家预约
     * 排班更新，号源更新
     *
     * @param userReservation
     * @return
     */
    private UserReservation appointmentExpert(UserReservation userReservation) {
        String timeInterval = userReservation.getTimeInterval();
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(userReservation.getScheduleDoctorId());
        //区分时间段
        if (timeInterval.equals(Constants.MORNING)) {
            scheduleDoctor.setDoctorMorningNumber(scheduleDoctor.getDoctorMorningNumber() + 1);
            userReservation.setRegNo(scheduleDoctor.getDoctorMorningNumber());
        } else if (timeInterval.equals(Constants.AFTERNOON)) {
            scheduleDoctor.setDoctorAfternoonNumber(scheduleDoctor.getDoctorAfternoonNumber() + 1);
            userReservation.setRegNo(scheduleDoctor.getDoctorAfternoonNumber());
        } else if (timeInterval.equals(Constants.NIGHT)) {
            scheduleDoctor.setDoctorNightNumber(scheduleDoctor.getDoctorNightNumber() + 1);
            userReservation.setRegNo(scheduleDoctor.getDoctorNightNumber());
        }
        scheduleDoctor.setUpdateTime(new Date());
        int result = scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
        if (result != 1) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
        return userReservation;
    }

    private Integer commonGenerateUserReservation(UserReservationDto userReservationDto, UserReservation userReservation) {
        userReservation.setPatientName(patientService.selectPatientById(userReservation.getPatientId(),userReservationDto.getUserId()).getRealName());
        userReservation.setConditionDesc(userReservationDto.getAccentDetail());
        userReservation.setClinicPrice(userReservationDto.getPrice());
        //就诊时间
        JSONObject object = seasonTimeService.getSeasonTimeByTimeInterval(
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
        return userReservationId;
    }
}
