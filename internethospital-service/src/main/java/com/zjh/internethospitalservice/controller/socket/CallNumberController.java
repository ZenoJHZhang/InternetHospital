package com.zjh.internethospitalservice.controller.socket;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.util.Date;
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

    @MessageMapping("/pushCallNumberInfo")
    @SendTo(value = "/topic/pushCallNumberInfo")
    public Integer pushCallNumberInfo(Integer userReservationId) {
        UserReservation userReservationDetail = userReservationService.getUserReservationDetail(userReservationId);
        int callNo = userReservationDetail.getCallNo();
        int regNo = userReservationDetail.getRegNo();
//        if (callNo == regNo) {
//            return 0;
//        } else if (callNo < regNo) {
//            return -1;
//        } else {
//            return 1;
//        }
        return callNo;
    }

    @MessageMapping("/nextPatient")
    @SendTo(value = "/topic/pushCallNumberInfo")
    public Integer nextPatient(Integer userReservationId) {
        UserReservation userReservationDetail = userReservationService.getUserReservationDetail(userReservationId);
        ScheduleDoctor scheduleDoctor = scheduleDoctorService.getScheduleDoctor(userReservationDetail.getScheduleDoctorId());
        String timeInterval = userReservationDetail.getTimeInterval();
        Integer callNo;
        if (timeInterval.equals(Constants.MORNING)){
            callNo = scheduleDoctor.getMorningCallNo();
            callNo = callNo +1;
            scheduleDoctor.setMorningCallNo(callNo);
        }
        else if(timeInterval.equals(Constants.AFTERNOON)){
            callNo = scheduleDoctor.getAfternoonCallNo();
            callNo = callNo +1;
            scheduleDoctor.setAfternoonCallNo(callNo);
        }
        else {
            callNo = scheduleDoctor.getNightCallNo();
            callNo = callNo +1;
            scheduleDoctor.setNightCallNo(callNo);
        }
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDoctorService.updateScheduleDoctor(scheduleDoctor);
        return callNo;
    }
}
