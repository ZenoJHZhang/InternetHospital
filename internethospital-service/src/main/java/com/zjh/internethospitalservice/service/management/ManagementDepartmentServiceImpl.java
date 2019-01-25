package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/24 13:50
 */
@Service("managementDepartmentService")
public class ManagementDepartmentServiceImpl implements ManagementDepartmentService {

    private final DepartmentMapper departmentMapper;

    @Autowired
    public ManagementDepartmentServiceImpl(DepartmentMapper departmentMapper) {
        this.departmentMapper = departmentMapper;
    }

    @Override
    public PageInfo<Department> listAllDepartmentByType(Integer departmentType, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("deptType",departmentType);
        PageHelper.startPage(pageNumber,pageSize);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        return new PageInfo<>(departmentList);
    }

    @Override
    public void insertDepartment(Department department) {
        int i = departmentMapper.insertSelective(department);
        if (i !=1){
            throw new InternetHospitalException(ExceptionConstants.INSERT_DEPARTMENT_FAIL);
        }
    }

    @Override
    public void updateDepartment(Department department) {
        int i = departmentMapper.updateByPrimaryKey(department);
        if (i != 1){
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public PageInfo<Department> selectDepartmentByName(String departmentName, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Department.class);
        example.createCriteria().andLike("departmentName",departmentName);
        PageHelper.startPage(pageNumber,pageSize);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        return new PageInfo<>(departmentList);
    }
}
