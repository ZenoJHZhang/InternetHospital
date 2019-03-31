package com.zjh.internethospitalapi.service.app;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.UserReservation;

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
     * @param userReservationUUId
     * @return
     */
    UserReservation getUserReservationDetail(String userReservationUUId);

    /**
     * 通过用户id获得就诊信息列表(未终止的)
     * @param userId
     * @return
     */
    List<UserReservation> getUserReservationByUserIdIsNotEnd(Integer userId);

    /**
     * 通过用户id，分页获取用户就诊记录列表
     * @param userId
     * @param pageNo
     * @param pageSize
     * @return
     */
    PageInfo<UserReservation> listUserReservationOfUserInPage(Integer userId,Integer pageNo,Integer pageSize);

    /**
     * 根据UUId选择性更新
     * @param userReservation
     */
    void updateUserReservationSelective(UserReservation userReservation);

    /**
     * 通过uuid获取用户就诊信息
     * @param uuid uuid
     * @return
     */
    UserReservation getUserReservationByUuId(String uuid);
}
