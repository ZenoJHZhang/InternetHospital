package com.zjh.internethospitalservice.service.doc;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.*;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalapi.service.doc.DocUserReservationService;
import com.zjh.internethospitalapi.service.img.ImgService;
import com.zjh.internethospitalservice.mapper.PatientMapper;
import com.zjh.internethospitalservice.mapper.UserReservationImgMapper;
import com.zjh.internethospitalservice.mapper.UserReservationMapper;
import com.zjh.internethospitalservice.mapper.UserReservationStatusMapper;
import com.zjh.internethospitalservice.util.AgeUtil;
import com.zjh.internethospitalservice.util.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/2/14 10:36
 */
@Service("/docUserReservationService")
public class DocUserReservationServiceImpl implements DocUserReservationService {

    private final UserReservationMapper userReservationMapper;
    private final PatientMapper patientMapper;
    private final UserReservationImgMapper userReservationImgMapper;
    private final ImgService imgService;
    private final UserReservationStatusMapper userReservationStatusMapper;
    private final ScheduleDoctorService scheduleDoctorService;

    @Autowired
    public DocUserReservationServiceImpl(UserReservationMapper userReservationMapper, PatientMapper patientMapper, UserReservationImgMapper userReservationImgMapper, ImgService imgService, UserReservationStatusMapper userReservationStatusMapper, ScheduleDoctorService scheduleDoctorService) {
        this.userReservationMapper = userReservationMapper;
        this.patientMapper = patientMapper;
        this.userReservationImgMapper = userReservationImgMapper;
        this.imgService = imgService;
        this.userReservationStatusMapper = userReservationStatusMapper;
        this.scheduleDoctorService = scheduleDoctorService;
    }

    @Override
    public void beginOrFinishClinic(String uuId, Integer flag) {
       UserReservation userReservation  = getUserReservationByUuid(uuId);
        if (flag.equals(0)) {
            userReservation.setStartTime(new Date());
            //就诊中
            userReservation.setStatus(11);
            userReservation.setUpdateTime(new Date());
        } else if (flag.equals(1)) {
            userReservation.setFinishTime(new Date());
            //就诊结束 进入视频完毕待诊断状态
            userReservation.setStatus(12);
            userReservation.setUpdateTime(new Date());
        }
        userReservationMapper.updateByPrimaryKeySelective(userReservation);
    }

    @Override
    public PageInfo<UserReservation> getUserReservationByDoctorId(Integer doctorId, Integer status, String startScheduleTime,
                                                 String endScheduleTime, String patientName,
                                                 Integer pageNumber, Integer pageSize) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("doctorId", doctorId).
        andEqualTo("isDelete", 0);

        //先找出该医生所有的就诊记录，根据挂号状态更新对于就诊状态
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        for (UserReservation u:userReservationList
             ) {
            Integer clinicStatus = judgeUserReservationClinicStatusBeforeCall(u, null);
            //挂号状态为1，就诊记录状态更新为5
            if (clinicStatus.equals(1)){
                u.setStatus(5);
                u.setUpdateTime(new Date());
                userReservationMapper.updateByPrimaryKeySelective(u);
            }
        }

        //再根据入参就诊状态筛选
        example.and().andEqualTo("status", status);
        //起始时间不为空，则说明需要筛选时间段
        if (startScheduleTime != null && endScheduleTime != null &&
                !startScheduleTime.equals("") && !endScheduleTime.equals("")) {
            if (startScheduleTime.equals(endScheduleTime)) {
                example.and().andEqualTo("clinicDate", startScheduleTime);
            } else {
                example.and().andBetween("clinicDate", startScheduleTime, endScheduleTime);
            }
        }
        if (patientName != null && !patientName.equals("")) {
            example.and().andLike("patientName", "%" + patientName + "%");
        }
        PageHelper.startPage(pageNumber, pageSize);
        List<UserReservation> realUserReservationList = userReservationMapper.selectByExample(example);
        for (UserReservation userReservation : realUserReservationList
        ) {

            List<String> imgPathList = new LinkedList<>();

            //设置患者信息
            Patient patient = patientMapper.selectByPrimaryKey(userReservation.getPatientId());
            patient.setAge(AgeUtil.getAgeFromBirth(patient.getBirth()));
            if(patient.getSex().equals(0)){
                userReservation.setPatientSex("女");
            }
            else {
                userReservation.setPatientSex("男");
            }
            userReservation.setPatient(patient);

            //设置病情描述图片
            Example example1 = new Example(UserReservationImg.class);
            example1.createCriteria().andEqualTo("userReservationId",userReservation.getId());
            List<UserReservationImg> userReservationImgList = userReservationImgMapper.selectByExample(example1);
            for (UserReservationImg userReservationImg:userReservationImgList
                 ) {
                Img img = imgService.selectImgById(userReservationImg.getImgId());
                String imgPath = ImgUtil.imgPathGenerate(img);
                imgPathList.add(imgPath);
            }
            userReservation.setImgPathList(imgPathList);

            //设置状态描述
            String stateName = userReservationStatusMapper.selectByPrimaryKey(status).getStateName();
            userReservation.setStatusDescription(stateName);
        }
        return new PageInfo<>(realUserReservationList);
    }

    @Override
    public void confirmUserReservation(String userReservationUuid) {
        UserReservation userReservation = getUserReservationByUuid(userReservationUuid);
        //未审方状态
        userReservation.setStatus(13);
        userReservation.setUpdateTime(new Date());
        userReservationMapper.updateByPrimaryKeySelective(userReservation);
    }


    @Override
    public UserReservation getUserReservationByUuid(String userReservationUuid ){
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId", userReservationUuid);
        example.and().andEqualTo("isDelete",0);
        UserReservation userReservation = userReservationMapper.selectOneByExample(example);
        if (userReservation == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        return userReservation;
    }

    @Override
    public void passUserReservation(String userReservationUuId, String passReason) {
        UserReservation userReservation = new UserReservation();
        userReservation.setUuId(userReservationUuId);
        userReservation = userReservationMapper.selectOne(userReservation);
        userReservation.setSkipReason(passReason);
        userReservation.setStatus(5);
        userReservation.setUpdateTime(new Date());
        userReservationMapper.updateByPrimaryKeySelective(userReservation);
    }

    @Override
    public Integer judgeUserReservationClinicStatusBeforeCall(UserReservation userReservation, Integer doctorCallRegNo) {
        ScheduleDoctor scheduleDoctor = scheduleDoctorService.getScheduleDoctor(userReservation.getScheduleDoctorId());
        //医生叫到几号，一开始是0
        Integer callNo;
        //用户就诊序号
        Integer regNo = userReservation.getRegNo();
        String timeInterval = userReservation.getTimeInterval();
        if (timeInterval.equals(Constants.MORNING)) {
            callNo = scheduleDoctor.getMorningCallNo();
        } else if (timeInterval.equals(Constants.AFTERNOON)) {
            callNo = scheduleDoctor.getAfternoonCallNo();
        } else {
            callNo = scheduleDoctor.getNightCallNo();
        }

        //判断前一个视频就诊是否结束，未结束不得叫下一个号
        UserReservation passOne = new UserReservation();
        passOne.setRegNo(callNo);
        passOne.setScheduleDoctorId(scheduleDoctor.getId());
        passOne.setTimeInterval(timeInterval);
        passOne = userReservationMapper.select(passOne).get(0);
        if (passOne.getStatus()< 13){
            return 3;
        }

        //callNo+1 即为医生准备叫的号
        //判断医生准备叫的号与医生已叫的号 => 医生是否过号叫人
        if (doctorCallRegNo != null){
            if (doctorCallRegNo > callNo + 1){
                return  2;
            }
        }

        //医生准备叫的号>自己的号 说明自己被过号了;
        if (userReservation.getStatus().equals(4)){
            if ((callNo + 1) > regNo){
                userReservation.setStatus(5);
                return 1;
            }
            else if((callNo + 1) == regNo){
                return 0;
            }else {
                return -1;
            }
        }
        else  if(userReservation.getStatus().equals(5)){
            return 1;
        }
        else {
            return 0;
        }
    }
}
