package com.zjh.internethospitalservice.controller.socket;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalapi.service.doc.DocUserReservationService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.util.JWTUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;

import java.util.Date;

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
    private final ManagementDoctorService managementDoctorService;
    private final DocUserReservationService docUserReservationService;


    @Autowired
    public CallNumberController(UserReservationService userReservationService, ScheduleDoctorService scheduleDoctorService,
                                ManagementDoctorService managementDoctorService, DocUserReservationService docUserReservationService) {
        this.userReservationService = userReservationService;
        this.scheduleDoctorService = scheduleDoctorService;
        this.managementDoctorService = managementDoctorService;
        this.docUserReservationService = docUserReservationService;
    }

    @MessageMapping("/pushClinicState")
    @SendTo(value = "/topic/userReservation")
    public JSONObject pushUserReservationClinicState(String detail) {
        //判断身份并获取用户就诊以及对应医生排班信息
        JSONObject object = JSON.parseObject(detail);
        String token = object.getString("token");
        String userReservationUUId = object.getString("userReservationUuId");
        Integer doctorCallRegNo = object.getInteger("doctorCallRegNo");
        Integer userId = JWTUtil.getUserId(token);
        UserReservation userReservation = userReservationService.getUserReservationDetail(userReservationUUId);
        JSONObject result = new JSONObject();
        ScheduleDoctor scheduleDoctor = scheduleDoctorService.getScheduleDoctor(userReservation.getScheduleDoctorId());
        String timeInterval = userReservation.getTimeInterval();
        if (userId != null && !userId.equals(managementDoctorService.getDoctorById(userReservation.getDoctorId()).getUserId())) {
            //code 1 不成功
            result.put("code", 1);
            result.put("message","就诊记录无效");
            return result;
        } else if (userReservation.getStatus().equals(11)) {
            result.put("code", 1);
            result.put("message","用户已在就诊中");
            return result;
        }
        //医生叫号，更新叫号数并判断用户就诊状态
        else {
            //返回值为2，说明医生未按顺序叫号
            Integer clinicState = docUserReservationService.
                    judgeUserReservationClinicStatusBeforeCall(userReservation,doctorCallRegNo);
            if(clinicState.equals(2)){
                result.put("code", 1);
                result.put("message","请按顺序进行叫号");
                return result;
            }
            if (clinicState.equals(3)){
                result.put("code", 1);
                result.put("message","上个就诊未完成，无法再次叫号");
                return result;
            }
            Integer callNo;
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
            result.put("id", userReservation.getId());
            result.put("clinicState", clinicState);
            result.put("callNo", callNo);
            result.put("code", 0);
            scheduleDoctor.setUpdateTime(new Date());
            scheduleDoctorService.updateScheduleDoctor(scheduleDoctor);

            //更新用户就诊 叫号时间以及就诊开始时间
            userReservation.setCallNumberTime(new Date());
            userReservation.setStartTime(new Date());

            //更新用户就诊状态
            //已过号状态
            if (clinicState.equals(1) && userReservation.getStatus().equals(4)) {
                userReservation.setStatus(5);
                userReservationService.updateUserReservationSelective(userReservation);
                result.put("message","该就诊记录已过号");
                return result;
            }
            //就诊中状态
            if (clinicState.equals(0) && userReservation.getStatus().equals(4)) {
                userReservation.setStatus(11);
                userReservationService.updateUserReservationSelective(userReservation);
            }
            //更新用户就诊 叫号时间以及开始就诊时间 callNumberTime

            return result;
        }

    }
}
