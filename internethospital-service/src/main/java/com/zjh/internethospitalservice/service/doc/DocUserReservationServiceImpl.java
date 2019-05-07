package com.zjh.internethospitalservice.service.doc;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.*;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
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
    private final UserReservationService userReservationService;

    @Autowired
    public DocUserReservationServiceImpl(UserReservationMapper userReservationMapper, PatientMapper patientMapper, UserReservationImgMapper userReservationImgMapper, ImgService imgService, UserReservationStatusMapper userReservationStatusMapper, ScheduleDoctorService scheduleDoctorService, UserReservationService userReservationService) {
        this.userReservationMapper = userReservationMapper;
        this.patientMapper = patientMapper;
        this.userReservationImgMapper = userReservationImgMapper;
        this.imgService = imgService;
        this.userReservationStatusMapper = userReservationStatusMapper;
        this.scheduleDoctorService = scheduleDoctorService;
        this.userReservationService = userReservationService;
    }

    @Override
    public void beginOrFinishClinic(String uuId, Integer flag) {
        UserReservation userReservation = getUserReservationByUuid(uuId);
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
                andEqualTo("isDelete", 0)
                .andEqualTo("status", status);
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
        example.orderBy("clinicTime").desc().orderBy("regNo").asc();
        PageHelper.startPage(pageNumber, pageSize);
        List<UserReservation> realUserReservationList = userReservationMapper.selectByExample(example);
        for (UserReservation userReservation : realUserReservationList
        ) {

            List<String> imgPathList = new LinkedList<>();

            //设置患者信息
            Patient patient = patientMapper.selectByPrimaryKey(userReservation.getPatientId());
            patient.setAge(AgeUtil.getAgeFromBirth(patient.getBirth()));
            if (patient.getSex().equals(0)) {
                userReservation.setPatientSex("女");
            } else {
                userReservation.setPatientSex("男");
            }
            userReservation.setPatient(patient);

            //设置病情描述图片
            Example example1 = new Example(UserReservationImg.class);
            example1.createCriteria().andEqualTo("userReservationId", userReservation.getId());
            List<UserReservationImg> userReservationImgList = userReservationImgMapper.selectByExample(example1);
            for (UserReservationImg userReservationImg : userReservationImgList
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
    public UserReservation getUserReservationByUuid(String userReservationUuid) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId", userReservationUuid);
        example.and().andEqualTo("isDelete", 0);
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
    public boolean judgeBeforeUserReservationStatus(UserReservation userReservation) {
        //1.找出此时段、此就诊医生所有处于status =11|12 的就诊记录
        //有的话 就不能叫号（有且只有一个）
        UserReservation beforeUserReservation = userReservationService.
                getBeforeUserReservation(userReservation.getScheduleDoctorId(), userReservation.getTimeInterval());
        if (beforeUserReservation == null) {
            return true;
        } else {
            return !beforeUserReservation.getStatus().equals(11) && !beforeUserReservation.getStatus().equals(12);
        }
    }

    @Override
    public UserReservation getNextUserReservation(Integer scheduleDoctorId, String timeInterval) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("scheduleDoctorId", scheduleDoctorId)
                .andEqualTo("timeInterval", timeInterval)
                .andEqualTo("status", 4)
                .andEqualTo("isDelete", 0);
        example.orderBy("regNo").asc();
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        if (userReservationList.size() == 0) {
            return null;
        } else {
            return userReservationList.get(0);
        }
    }
}
