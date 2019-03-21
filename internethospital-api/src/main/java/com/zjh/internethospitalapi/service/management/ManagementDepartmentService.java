package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Img;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/24 11:44
 */
public interface ManagementDepartmentService {

    /**
     * 根据科室类型获取所有该类型科室
     * @param departmentType 0 普通；1 专家
     * @param pageNumber 页码
     * @param pageSize 页容量
     * @return
     */
    PageInfo<Department> listAllDepartmentByType(Integer departmentType,Integer pageNumber,Integer pageSize);

    /**
     * 新增科室
     * 重复科室不可新增
     * @param department 科室
     * @return 科室id
     */
    Integer insertDepartment(Department department);

    /**
     * 更新科室
     * 重复或科室下有排班（即 isStart ！= 2）不可更新
     * @param department 科室
     * @return 科室id
     */
    Integer updateDepartment(Department department);

    /**
     * 根据科室名/科室编号分页模糊搜索科室
     * @param departmentMessage 科室名
     * @param departmentType 科室类型
     * @param pageNumber  页码
     * @param pageSize 页容量
     * @return
     */
    PageInfo<Department> listDepartmentByNameOrNumberWithDepartmentMessage
    (String departmentMessage,Integer departmentType, Integer pageNumber, Integer pageSize);

    /**
     * 通过科室id获取科室内容
     * @param departmentId 科室id
     * @return 科室
     */
    Department getDepartmentById(Integer departmentId);

    /**
     * 更新科室图片
     * @param imgId 图片id
     * @param departmentId 科室id
     */
    void updateDepartmentImg(Integer imgId, Integer departmentId);

    /**
     * 删除科室
     * @param departmentId 科室id
     */
    void deleteDepartment(Integer departmentId);

}
