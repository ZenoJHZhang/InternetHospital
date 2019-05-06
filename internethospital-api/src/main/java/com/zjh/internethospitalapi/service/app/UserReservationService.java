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
     * 用户挂号普通科室,仅填写信息，不挂号，正式挂号应在付款后
     * @param userReservationDto
     */
    void insertNormalUserReservation(UserReservationDto userReservationDto);

    /**
     * 预约专家医生，仅填写信息，不挂号
     * @param userReservationDto
     */
    void insertExpertUserReservation(UserReservationDto userReservationDto);

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

    /**
     * 通过uuid获取用户就诊信息，处方信息，药方信息，相关医生信息，相关科室信息
     * @param uuid 用户就诊uuid
     * @param adminFlag 管理员审核用Flag
     * @return UserReservation
     */
    UserReservation getAllDetailByUuId(String uuid,boolean adminFlag);

    /**
     * 给与问诊医生星级评价
     * @param doctorId 医生id
     * @param starRate 星级
     * @param userReservationUuId  就诊uuid
     */
    void giveStar(Integer doctorId,Integer starRate,String userReservationUuId);

    /**
     * 预约专家科室
     * @param userReservation
     */
    void appointmentExpert(UserReservation userReservation);

    /**
     * 预约普通科室
     * @param userReservation
     * @param scheduleDepartmentId
     */
    void appointmentNormal(UserReservation userReservation, Integer scheduleDepartmentId);
}
