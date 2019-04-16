package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
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
     * 医生管理员审核医嘱
     * @param userReservationUuid 用户就诊uuid
     * @param auditStatus 审核状态 1：不通过 2:已通过
     * @param examineFailReason 审核不通过的原因
     * @param auditUserId 药方审核人员
     */
    void auditUserReservation(String userReservationUuid, String auditStatus, String examineFailReason,Integer auditUserId);

    /**
     * 根据就诊信息审核状态分页获取
     * @param auditStatus 审核状态 -1 全部状态 0 未审核 1 审核通过 2 审核不通过
     * @param pageNo 页码
     * @param pageSize 页容量
     * @return PageInfo<UserReservation>
     */
    PageInfo<UserReservation> getUserReservationListByAuditStatus(Integer auditStatus,Integer pageNo,Integer pageSize);
}
