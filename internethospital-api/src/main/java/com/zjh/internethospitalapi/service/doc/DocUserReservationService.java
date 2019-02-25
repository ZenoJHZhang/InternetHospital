package com.zjh.internethospitalapi.service.doc;

/**
 * 类的说明
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

}
