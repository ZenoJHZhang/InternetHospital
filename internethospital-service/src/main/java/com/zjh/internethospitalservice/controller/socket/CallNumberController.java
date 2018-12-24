package com.zjh.internethospitalservice.controller.socket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalservice.util.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/21 09:47
 */
@Controller
public class CallNumberController {

    private final UserReservationService userReservationService;
    private final ScheduleDoctorService scheduleDoctorService;

    @Autowired
    public CallNumberController(UserReservationService userReservationService, ScheduleDoctorService scheduleDoctorService) {
        this.userReservationService = userReservationService;
        this.scheduleDoctorService = scheduleDoctorService;
    }

//    @MessageMapping("/nextPatient")
//    @SendTo(value = "/topic/userReservation")
//    public Integer nextPatient(Integer userReservationId) {
//        UserReservation userReservationDetail = userReservationService.getUserReservationDetail(userReservationId);
//        ScheduleDoctor scheduleDoctor = scheduleDoctorService.getScheduleDoctor(userReservationDetail.getScheduleDoctorId());
//        String timeInterval = userReservationDetail.getTimeInterval();
//        Integer callNo;
//        if (timeInterval.equals(Constants.MORNING)){
//            callNo = scheduleDoctor.getMorningCallNo();
//            callNo = callNo +1;
//            scheduleDoctor.setMorningCallNo(callNo);
//        }
//        else if(timeInterval.equals(Constants.AFTERNOON)){
//            callNo = scheduleDoctor.getAfternoonCallNo();
//            callNo = callNo +1;
//            scheduleDoctor.setAfternoonCallNo(callNo);
//        }
//        else {
//            callNo = scheduleDoctor.getNightCallNo();
//            callNo = callNo +1;
//            scheduleDoctor.setNightCallNo(callNo);
//        }
//        scheduleDoctor.setUpdateTime(new Date());
//        scheduleDoctorService.updateScheduleDoctor(scheduleDoctor);
//        return callNo;
//    }

    @MessageMapping("/pushClinicState")
    @SendTo(value = "/topic/userReservation")
    public List<UserReservation> pushUserReservationClinicState(String detail) {
        JSONObject object = JSON.parseObject(detail);
        String token = object.getString("token");
        Integer userReservationId = object.getInteger("userReservationId");
        Integer userId = JWTUtil.getUserId(token);
        List<UserReservation> userReservationList = userReservationService.getUserReservationByUserIdIsNotEnd(userId);
        for (UserReservation userReservation : userReservationList
                ) {
            ScheduleDoctor scheduleDoctor = scheduleDoctorService.getScheduleDoctor(userReservation.getScheduleDoctorId());
            String timeInterval = userReservation.getTimeInterval();
            Integer callNo;
            Integer clinicState;
            if (timeInterval.equals(Constants.MORNING)) {
                callNo = scheduleDoctor.getMorningCallNo();
                callNo = callNo + 1;
                scheduleDoctor.setMorningCallNo(callNo);
            } else if (timeInterval.equals(Constants.AFTERNOON)) {
                callNo = scheduleDoctor.getAfternoonCallNo();
                callNo = callNo + 1;
                scheduleDoctor.setAfternoonCallNo(callNo);
            } else {
                callNo = scheduleDoctor.getNightCallNo();
                callNo = callNo + 1;
                scheduleDoctor.setNightCallNo(callNo);
            }
            if (callNo.equals(userReservation.getRegNo())) {
                clinicState = 0;
            } else if (Integer.compare(callNo, userReservation.getRegNo()) < 0) {
                clinicState = -1;
            } else {
                clinicState = 1;
            }
            userReservation.setClinicState(clinicState);
            userReservation.setCallNo(callNo);
            if (userReservation.getId().equals(userReservationId)) {
                scheduleDoctor.setUpdateTime(new Date());
                scheduleDoctorService.updateScheduleDoctor(scheduleDoctor);
            }
        }
        return userReservationList;
    }
}
