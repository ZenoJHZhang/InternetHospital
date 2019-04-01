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
     * @param userReservationUuid
     */
    void confirmUserReservation(String userReservationUuid);
}
