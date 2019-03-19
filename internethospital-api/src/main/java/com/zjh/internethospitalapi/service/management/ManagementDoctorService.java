package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.dto.DoctorDto;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;

import java.util.List;

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
     * 有选择性的更新医生
     *
     * @param doctorId 医生id
     * @param doctorNumber 医生工号
     * @param phone 医生手机号
     * @param doctorTitle 医生职称
     * @param imgId 医生头像图片id
     * @param goodAt 医生擅长
     */
    void updateDoctorSelective(Integer doctorId,String doctorNumber,String phone,String doctorTitle,Integer imgId,String goodAt);

    /**
     * 删除医生并删除对应user
     * 还需要删除医生科室联系
     * PS 需要判断今日以及之后是否有排班，如有则不能删除
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
     * @return
     */
    List<Doctor> listDoctorByDepartmentId(Integer departmentId);

    /**
     * 根据医生姓名/工号进行模糊搜索，并通过科室进行筛选
     * @param doctorMessage 医生信息
     * @param departmentId 科室id
     * @param pageNo 页码
     * @param pageSize 页容量
     * @return 医生分页信息
     */
    PageInfo<Doctor> listDoctorByNameOrNumberWithDepartmentId(String doctorMessage,Integer departmentId,Integer pageNo,Integer pageSize);

    /**
     * 根据医生id获取医生所属科室列表信息
     * @param doctorId 医生id
     * @return 科室列表信息
     */
    List<Department> listDepartmentListByDoctorId(Integer doctorId);
}
