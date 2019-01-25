package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
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
     *
     * @param doctor 医生
     */
    void insertDoctor(Doctor doctor);

    /**
     * 更新医生
     *
     * @param doctor 医生
     */
    void updateDoctor(Doctor doctor);

    /**
     * 删除医生并删除对应user
     *
     * @param doctorId 医生id
     */
    void deleteDoctor(Integer doctorId);

    /**
     * 根据id获取医生信息
     *
     * @param doctorId 医生id
     * @return Doctor
     */
    Doctor getDoctorById(Integer doctorId);

    /**
     * 判断是否为重复医生
     * 由手机号，工号和身份证号判断
     *
     * @param doctorNumber 医生工号
     * @param doctorPhone  医生手机号
     * @param doctorIdCard 医生身份证号
     * @param doctorId     医生id
     */
    void isSameDoctor(String doctorNumber, String doctorPhone, String doctorIdCard, Integer doctorId);

    /**
     * 根据科室id获取医生列表
     *
     * @param departmentId 科室id
     * @param pageNo 页码
     * @param pageSize 页容量
     * @return
     */
    PageInfo<Doctor> listDoctorByDepartmentId(Integer departmentId,Integer pageNo,Integer pageSize);
}
