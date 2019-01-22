package com.zjh.internethospitalapi.service.management;

import com.zjh.internethospitalapi.entity.Doctor;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/7 15:53
 */
public interface ManagementDoctorService {
    /**
     * 新增医生
     * @param doctor 医生
     */
    void insertDoctor(Doctor doctor);

    /**
     * 更新医生
     * @param doctor 医生
     */
    void updateDoctor(Doctor doctor);

    /**
     * 判断是否有重复医生工号或身份证号
     * @param doctorNumber 医生工号
     */
    void isSameDoctorNumber(String doctorNumber);

}
