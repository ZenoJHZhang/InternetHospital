package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalservice.mapper.PatientMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:29
 */
@Service("userReservation")
public class UserReservationServiceImpl implements UserReservationService {
    @Autowired
    private PatientMapper patientMapper;

    @Override
    public Integer insertReservationImg(MultipartFile img) {
        return null;
    }

    @Override
    public JSONObject insertNormalUserReservation(UserReservationDto userReservationDto) {
        Integer patientId = userReservationDto.getPatientId();
        String  patientName = patientMapper.selectByPrimaryKey(patientId).getRealName();
        return null;
    }
}
