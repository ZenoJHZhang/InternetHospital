package com.zjh.internethospitalapi.service.doc;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.UserReservation;

/**
 * 医生修改用户就诊信息
 * 开处方，开药
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/2/14 10:32
 */
public interface DocUserReservationService {

    /**
     * 医生开始/结束用户就诊
     * @param uuid 就诊uuid
     * @param flag 0:用户开始就诊 ； 1：用户结束就诊
     */
    void beginOrFinishClinic(String uuid, Integer flag);

    /**
     * 根据医生id，就诊状态，就诊日期以及就诊患者姓名获取就诊列表
     * @param doctorId 医生id 主要筛选条件
     * @param status 就诊状态 主要筛选条件
     * @param startScheduleTime 就诊日期开始时间 可选
     * @param endScheduleTime 就诊日期结束时间 可选
     * @param patientName 患者姓名 可选
     * @param pageNumber 页码
     * @param pageSize 页容量
     * @return 就诊信息
     */
    PageInfo<UserReservation> getUserReservationByDoctorId(Integer doctorId, Integer status, String startScheduleTime,
                                                           String endScheduleTime, String patientName, Integer pageNumber, Integer pageSize);

    /**
     * 医生提交医嘱进行审核，改变用户就诊状态为13
     * @param userReservationUuid 用户就诊uuid
     */
    void confirmUserReservation(String userReservationUuid);

    /**
     * 通过uuid获取用户就诊
     * @param userReservationUuid 用户就诊uuid
     * @return 用户就诊
     */
    UserReservation getUserReservationByUuid(String userReservationUuid);

    /**
     * 过号
     * @param userReservationUuId uuId
     * @param passReason 过号原因
     */
    void passUserReservation(String userReservationUuId,String passReason);

    /**
     * 判断此用户之前被叫号用户是否结束
     * true 已结束，可叫号此用户
     * false 等待上一个用户结束
     * @param userReservation 就诊详情
     * @return boolean
     */
    boolean judgeBeforeUserReservationStatus(UserReservation userReservation);

    /**
     * 获取当前时段、此医生下一个叫号的患者就诊
     * @param scheduleDoctorId 排班医生id
     * @param timeInterval 时段
     * @return UserReservation
     */
    UserReservation getNextUserReservation(Integer scheduleDoctorId,String timeInterval);
}
