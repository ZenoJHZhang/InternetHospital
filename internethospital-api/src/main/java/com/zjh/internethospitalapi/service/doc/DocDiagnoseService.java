package com.zjh.internethospitalapi.service.doc;

import com.zjh.internethospitalapi.entity.Diagnose;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/29 12:14
 */
public interface DocDiagnoseService {

    Integer insertDiagnose(Diagnose diagnose);

    void deleteDiagnose(Integer diagnoseId);

    /**
     * 通过用户就诊记录的uuid获得诊断
     * @param uuId uuid
     * @return 诊断
     */
    Diagnose getDiagnoseByUserReservationId(String uuId);
}
