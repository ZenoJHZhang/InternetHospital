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
import com.zjh.internethospitalservice.util.ShortMessageUtil;
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

    /**
     * 医生叫号
     *
     * @param detail
     * @return
     */
    @MessageMapping("/callUseReservation")
    @SendTo(value = "/topic/userReservation")
    public JSONObject callUseReservation(String detail) {
        //判断身份并获取用户就诊以及对应医生排班信息
        JSONObject object = JSON.parseObject(detail);
        String token = object.getString("token");
        String userReservationUUId = object.getString("userReservationUuId");
        Integer userId = JWTUtil.getUserId(token);
        UserReservation userReservation = userReservationService.getUserReservationDetail(userReservationUUId);
        Integer scheduleDoctorId = userReservation.getScheduleDoctorId();
        JSONObject result = new JSONObject();
        String timeInterval = userReservation.getTimeInterval();
        if (userId != null && !userId.equals(managementDoctorService.getDoctorById(userReservation.getDoctorId()).getUserId())) {
            //code 1 不成功
            result.put("code", 1);
            result.put("message", "就诊记录无效");
            return result;
        } else if (userReservation.getStatus().equals(11) || userReservation.getStatus().equals(12)) {
            result.put("code", 1);
            result.put("message", "用户已在就诊中");
            return result;
        }
        //医生叫号，更新叫号数并判断用户就诊状态
        else {
            //下一个应当被叫号的就诊uuId
            String nextUserReservationUuId = docUserReservationService.getNextUserReservation(scheduleDoctorId, timeInterval).getUuId();
            if (!nextUserReservationUuId.equals(userReservationUUId)) {
                result.put("code", 1);
                result.put("message", "请按顺序进行叫号");
                return result;
            }
            if (!docUserReservationService.judgeBeforeUserReservationStatus(userReservation)) {
                result.put("code", 1);
                result.put("message", "上个就诊未完成，无法再次叫号");
                return result;
            }

            //更新用户就诊 叫号时间以及就诊开始时间
            userReservation.setCallNumberTime(new Date());
            userReservation.setStartTime(new Date());

            //更新用户就诊状态
            //就诊中状态
            if (userReservation.getStatus().equals(4)) {
                userReservation.setStatus(11);
                userReservation.setIsCalled(1);
                userReservationService.updateUserReservationSelective(userReservation);
            }

            //发送短信,写死为自己手机
//            ShortMessageUtil.callNoMessage(patientName,clinicDate,clinicTime,departmentName,doctorName,regNo.toString(),"15868154079");

            //现在叫到几号
            Integer callNo = null;
            UserReservation beforeUserReservation = userReservationService.getBeforeUserReservation(scheduleDoctorId, userReservation.getTimeInterval());
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

            result.put("id", userReservation.getId());
            result.put("callNo", callNo);
            result.put("code", 0);

            return result;
        }
    }

    @MessageMapping("/passUserReservation")
    @SendTo(value = "/topic/userReservation")
    public JSONObject passUserReservation(String detail) {
        //判断身份并获取用户就诊以及对应医生排班信息
        JSONObject object = JSON.parseObject(detail);
        String token = object.getString("token");
        String userReservationUuId = object.getString("userReservationUuId");
        String passReason = object.getString("passReason");
        Integer userId = JWTUtil.getUserId(token);
        UserReservation userReservation = userReservationService.getUserReservationDetail(userReservationUuId);
        Integer scheduleDoctorId = userReservation.getScheduleDoctorId();
        JSONObject result = new JSONObject();
        if (userId != null && !userId.equals(managementDoctorService.getDoctorById(userReservation.getDoctorId()).getUserId())) {
            //code 1 不成功
            result.put("code", 1);
            result.put("message", "就诊记录无效");
            return result;
        } else if (userReservation.getStatus().equals(11) || userReservation.getStatus().equals(12)) {
            result.put("code", 1);
            result.put("message", "用户已在就诊中");
            return result;
        } else {
            docUserReservationService.passUserReservation(userReservationUuId, passReason);
            result.put("code", 2);
            result.put("message", "患者已过号");
            return result;
        }
    }

}
