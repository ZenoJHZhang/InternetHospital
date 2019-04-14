package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.UserReservation;

import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/4/14 12:14
 */
public interface ManagementUserReservationService {

    /**
     * 根据就诊状态获取就诊信息列表
     * @param userReservationStatus 就诊状态
     * @return List<UserReservation>
     */
    List<UserReservation> getUserReservationListByStatus(Integer userReservationStatus);

    /**
     * 医生管理员审核医嘱
     * @param userReservationUuid 用户就诊uuid
     * @param auditStatus 审核状态 1：不通过 2:已通过
     * @param examineFailReason 审核不通过的原因
     * @param auditUserId 药方审核人员
     */
    void auditUserReservation(String userReservationUuid, String auditStatus, String examineFailReason,Integer auditUserId);
}
