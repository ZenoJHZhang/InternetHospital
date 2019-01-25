package com.zjh.internethospitalapi.service.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Department;

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
     * @param department 科室
     */
    void insertDepartment(Department department);

    /**
     * 更新科室
     * @param department 科室
     */
    void updateDepartment(Department department);

    /**
     * 根据科室名分页模糊搜索科室
     * @param departmentName 科室名
     * @param pageNumber  页码
     * @param pageSize 页容量
     * @return
     */
    PageInfo<Department> selectDepartmentByName(String departmentName,Integer pageNumber,Integer pageSize);
}
