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
     * 判断用户就诊状态,并判断医生是否过号叫人
     * 根据医生叫号，判断并更新用户就诊状态
     * @param userReservation 用户就诊
     * @param doctorCallRegNo 医生准备叫的号
     * @return -1 还未叫到 0 刚好叫到 1 已过号 2 医生过号叫人 3:上个就诊还未结束
     */
    Integer judgeUserReservationClinicStatusBeforeCall(UserReservation userReservation, Integer doctorCallRegNo);

    /**
     * 过号
     * @param userReservationUuId uuId
     * @param passReason 过号原因
     */
    void passUserReservation(String userReservationUuId,String passReason);
}
