package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.Patient;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.PatientService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:29
 */
@Service("userReservation")
public class UserReservationServiceImpl implements UserReservationService {
    private final PatientService patientService;

    @Autowired
    public UserReservationServiceImpl(PatientService patientService) {
        this.patientService = patientService;
    }


    @Override
    public JSONObject insertNormalUserReservation(UserReservationDto userReservationDto) {
        UserReservation userReservation = new UserReservation();
        BeanUtils.copyProperties(userReservationDto,userReservation);
        userReservation.setPatientName(patientService.selectPatientById(userReservation.getPatientId()).getRealName());
        /**
         * 如果scheduleTime为今天，是普通挂号，否则是预约挂号
         * 普通挂号 1 预约挂号 2
         * */
        if (LocalDate.now().toString().equals(userReservationDto.getScheduleTime())) {
            userReservation.setType(1);
        }
        else {
            userReservation.setType(2);
        }

        return null;
    }
}
