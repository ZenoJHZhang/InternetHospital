package com.zjh.internethospitalapi.service.management;

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
     * @param doctorName 医生名字
     * @param doctorNumber 医生工号
     * @param doctorIdCard 医生身份证号
     * @param phone 医生手机号
     * @param doctorTitle 医生职称 
     * @param imgId
     * @param goodAt
     */
    void insertDoctor(String doctorName,String doctorNumber,String doctorIdCard,
                      String phone,String doctorTitle,String imgId,String goodAt);

}
