package com.zjh.internethospitalservice.service.doc;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.entity.Patient;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.entity.UserReservationImg;
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

    @Autowired
    public DocUserReservationServiceImpl(UserReservationMapper userReservationMapper, PatientMapper patientMapper, UserReservationImgMapper userReservationImgMapper, ImgService imgService, UserReservationStatusMapper userReservationStatusMapper) {
        this.userReservationMapper = userReservationMapper;
        this.patientMapper = patientMapper;
        this.userReservationImgMapper = userReservationImgMapper;
        this.imgService = imgService;
        this.userReservationStatusMapper = userReservationStatusMapper;
    }

    @Override
    public void beginOrFinishClinic(String uuId, Integer flag) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId", uuId);
        UserReservation userReservation = userReservationMapper.selectOneByExample(example);
        if (userReservation == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        if (flag.equals(0)) {
            userReservation.setStartTime(new Date());
            //就诊中
            userReservation.setStatus(11);
            userReservation.setUpdateTime(new Date());
        } else if (flag.equals(1)) {
            userReservation.setFinishTime(new Date());
            //就诊完成
            userReservation.setStatus(16);
            userReservation.setUpdateTime(new Date());
        }
    }

    @Override
    public PageInfo<UserReservation> getUserReservationByDoctorId(Integer doctorId, Integer status, String startScheduleTime,
                                                 String endScheduleTime, String patientName,
                                                 Integer pageNumber, Integer pageSize) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("doctorId", doctorId).andEqualTo("status", status);
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
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        for (UserReservation userReservation : userReservationList
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
        return new PageInfo<>(userReservationList);
    }
}
