package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.User;
import com.zjh.internethospitalapi.entity.UserReservation;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * 患者就诊记录
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:23
 */
public interface UserReservationService {
    /**
     * 用户挂号，预约普通科室
     * @param userReservationDto
     * @return userReservationId
     */
    Integer insertNormalUserReservation(UserReservationDto userReservationDto);

    /**
     * 预约专家医生
     * @param userReservationDto
     * @return userReservationId
     */
    Integer insertExpertUserReservation(UserReservationDto userReservationDto);

    /**
     * 获取就诊详情
     * @param userReservationId
     * @return
     */
    UserReservation getUserReservationDetail(Integer userReservationId);

    /**
     * 通过用户id获得就诊信息列表(未终止的)
     * @param userId
     * @return
     */
    List<UserReservation> getUserReservationByUserIdIsNotEnd(Integer userId);
}
