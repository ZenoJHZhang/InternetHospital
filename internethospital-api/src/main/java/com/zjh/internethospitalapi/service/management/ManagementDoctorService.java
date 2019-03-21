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
     * @return 医生id
     */
    Integer insertDoctor(Doctor doctor);

    /**
     * 更新医生
     * 重复医生信息或医生下有排班（即 isStart ！= 2）不可更新
     * @param doctor 医生信息
     * @return doctorId
     */
    Integer updateDoctorSelective(Doctor doctor);

    /**
     * 删除医生并删除对应user
     * 还需要删除医生科室联系
     * PS 需要判断今日以及之后是否有排班，如有则不能删除
     *
     * @param doctorId 医生id
     */
    void deleteDoctor(Integer doctorId);

    /**
     * 根据id获取医生信息以及所属的科室信息
     *
     * @param doctorId 医生id
     * @return Doctor
     */
    Doctor getDoctorById(Integer doctorId);

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

    /**
     * 更新医生头像
     * @param doctorId 医生id
     * @param imgId 头像图片id
     */
    void updateDoctorImg(Integer doctorId,Integer imgId);
}
