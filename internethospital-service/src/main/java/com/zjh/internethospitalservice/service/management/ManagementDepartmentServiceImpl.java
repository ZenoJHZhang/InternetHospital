package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.DoctorDepartment;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorDepartmentMapper;
import com.zjh.internethospitalservice.mapper.ImgMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
import com.zjh.internethospitalservice.util.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
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
    private final ImgMapper imgMapper;
    private final ScheduleDoctorMapper scheduleDoctorMapper;
    private final DoctorDepartmentMapper doctorDepartmentMapper;

    @Autowired
    public ManagementDepartmentServiceImpl(DepartmentMapper departmentMapper, ImgMapper imgMapper, ScheduleDoctorMapper scheduleDoctorMapper, DoctorDepartmentMapper doctorDepartmentMapper) {
        this.departmentMapper = departmentMapper;
        this.imgMapper = imgMapper;
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.doctorDepartmentMapper = doctorDepartmentMapper;
    }

    @Override
    public PageInfo<Department> listAllDepartmentByType(Integer departmentType, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Department.class);
        if (departmentType != 2) {
            example.createCriteria().andEqualTo("deptType", departmentType).andEqualTo("isDelete", 0);
        } else {
            example.createCriteria().andEqualTo("isDelete", 0);
        }
        PageHelper.startPage(pageNumber, pageSize);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        return new PageInfo<>(departmentList);
    }

    @Override
    public Integer insertDepartment(Department department) {
        if (isSameDepartment(department)) {
            throw new InternetHospitalException(ExceptionConstants.SAME_DEPARTMENT);
        }
        department.setCreateTime(new Date());
        department.setUpdateTime(new Date());
        int i = departmentMapper.insertSelective(department);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.INSERT_DEPARTMENT_FAIL);
        }
        return department.getId();
    }

    @Override
    public Integer updateDepartment(Department department) {
        isHasNotEndScheduleDepartment(department.getId());
        if (isSameDepartment(department)) {
            throw new InternetHospitalException(ExceptionConstants.SAME_DEPARTMENT);
        }
        department.setUpdateTime(new Date());
        int i = departmentMapper.updateByPrimaryKey(department);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DEPARTMENT_FAIL);
        }
        return department.getId();
    }

    @Override
    public PageInfo<Department> listDepartmentByNameOrNumberWithDepartmentMessage
            (String departmentMessage, Integer departmentType, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Department.class);
        if (departmentType != 2) {
            example.createCriteria().andEqualTo("deptType", departmentType);
        }
        example.and().andEqualTo("isDelete", 0);
        if (!departmentMessage.equals("")) {
            example.and().orLike("departmentName", "%" + departmentMessage + "%")
                    .orLike("departmentNumber", "%" + departmentMessage + "%");
        }
        PageHelper.startPage(pageNumber, pageSize);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        for (Department department : departmentList
        ) {
            department.setImgPath(getDepartmentImgPath(department.getImgId()));
        }
        return new PageInfo<>(departmentList);
    }

    @Override
    public Department getDepartmentById(Integer departmentId) {
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("id",departmentId).andEqualTo("isDelete",0);
        Department department = departmentMapper.selectOneByExample(example);
        if (department == null){
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        else {
            department.setImgPath(getDepartmentImgPath(department.getImgId()));
        }
        return department;
    }

    @Override
    public void updateDepartmentImg(Integer imgId, Integer departmentId) {
        Department department = new Department();
        department.setId(departmentId);
        department.setImgId(imgId);
        department.setUpdateTime(new Date());
        int i = departmentMapper.updateByPrimaryKeySelective(department);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public void deleteDepartment(Integer departmentId) {
        isHasNotEndScheduleDepartment(departmentId);
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        doctorDepartment.setIsDelete(0);
        doctorDepartment.setDepartmentId(departmentId);
        if(doctorDepartmentMapper.select(doctorDepartment).size() != 0){
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_HAS_DOCTOR);
        }
        Department department = new Department();
        department.setId(departmentId);
        department.setIsDelete(1);
        department.setUpdateTime(new Date());
        int i = departmentMapper.updateByPrimaryKeySelective(department);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.DELETE_DEPARTMENT_FAIL);
        }

    }

    private String getDepartmentImgPath(Integer imgId) {
        Img img = imgMapper.selectByPrimaryKey(imgId);
        return ImgUtil.imgPathGenerate(img);
    }

    /**
     * 判断是否为重复的科室
     * 判断条件为 科室名和科室编号以及科室电话不能相同
     *
     * @param department 科室信息
     * @return true 重复 false 不重复
     */
    private boolean isSameDepartment(Department department) {
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("isDelete", 0);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        //判断是否有重复科室信息，需要排除自身原来的信息
        for (Department o : departmentList
        ) {
            //科室id为null则为新增科室，不需要排除自身
            if (department.getId() != null) {
                if (!department.getId().equals(o.getId())) {
                    if (judgeSameDepartment(o, department)) {
                        return true;
                    }
                }
            } else {
                if (judgeSameDepartment(o, department)) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * 判断该科室下是否有未结束的科室排班
     * 根据医生排班表的科室id来判断
     * 因为最终会分到该科室的医生头上
     *
     * @param departmentId 科室id
     */
    private void isHasNotEndScheduleDepartment(Integer departmentId) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("departmentId", departmentId).
                andNotEqualTo("isStart", 2).andEqualTo("isDelete", 0);
        if (scheduleDoctorMapper.selectByExample(example).size() != 0) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_HAS_NOT_END_SCHEDULE);
        }
    }

    /**
     * 判断除了自身科室信息外是否有科室信息重复
     *
     * @return true 重复
     */
    private boolean judgeSameDepartment(Department o, Department department) {
        return (o.getDepartmentName().equals(department.getDepartmentName()))
                || (o.getDepartmentNumber().equals(department.getDepartmentNumber())) || (o.getPhone().equals(department.getPhone()));
    }
}
