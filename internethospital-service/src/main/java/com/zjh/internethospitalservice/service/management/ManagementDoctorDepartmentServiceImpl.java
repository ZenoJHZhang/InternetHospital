package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.DoctorDepartment;
import com.zjh.internethospitalapi.service.management.ManagementDoctorDepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorDepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/2 16:03
 */
@Service("managementDoctorDepartmentService")
public class ManagementDoctorDepartmentServiceImpl implements ManagementDoctorDepartmentService {

    private final DoctorDepartmentMapper doctorDepartmentMapper;
    private final DoctorMapper doctorMapper;
    private final DepartmentMapper departmentMapper;

    @Autowired
    public ManagementDoctorDepartmentServiceImpl(DoctorDepartmentMapper doctorDepartmentMapper,
                                                  DoctorMapper doctorMapper, DepartmentMapper departmentMapper) {
        this.doctorDepartmentMapper = doctorDepartmentMapper;
        this.doctorMapper = doctorMapper;
        this.departmentMapper = departmentMapper;
    }

    @Override
    public List<Doctor> listDoctorByDepartmentId(Integer departmentId) {
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("id",departmentId).andEqualTo("isDelete",0);
        Department department = departmentMapper.selectOneByExample(example);
        if (department == null) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        doctorDepartment.setDepartmentId(departmentId);
        List<Doctor> doctorList = new ArrayList<>();
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
        if (doctorDepartmentList.size() == 0) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_HAS_NO_DOCTOR);
        }
        for (DoctorDepartment o : doctorDepartmentList
                ) {
            Example example1 = new Example(Doctor.class);
            example.createCriteria().andEqualTo("id",o.getDoctorId())
                    .andEqualTo("isDelete",0);
            Doctor doctor = doctorMapper.selectOneByExample(example1);
            if (doctor == null) {
                throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
            }
            doctorList.add(doctor);
        }
        return doctorList;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addDoctorIntoDepartment(Integer doctorId, List<Integer> departmentIdList) {
        Example example = new Example(Doctor.class);
        example.createCriteria().andEqualTo("id",doctorId)
                .andEqualTo("isDelete",0);
        Doctor doctor = doctorMapper.selectOneByExample(example);
        if (doctor == null){
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        }
        for (Integer departmentId : departmentIdList
                ) {
            DoctorDepartment doctorDepartment = new DoctorDepartment();
            doctorDepartment.setDoctorId(doctorId);
            Example example1 = new Example(Department.class);
            example.createCriteria().andEqualTo("id",departmentId).andEqualTo("isDelete",0);
            Department department = departmentMapper.selectOneByExample(example1);
            if (department == null) {
                throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
            }
            doctorDepartment.setDepartmentId(departmentId);
            if (doctorDepartmentMapper.selectOne(doctorDepartment) != null) {
                throw new InternetHospitalException(
                        department.getDepartmentName() + ExceptionConstants.DOCTOR_ALREADY_IN_DEPARTMENT);
            }
            doctorDepartment.setCreateTime(new Date());
            doctorDepartment.setUpdateTime(new Date());
            int i = doctorDepartmentMapper.insertSelective(doctorDepartment);
            if (i != 1) {
                throw new InternetHospitalException(ExceptionConstants.INSERT_DOCTOR_INTO_DEPARTMENT_FAIL);
            }
        }
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateDoctorDepartment(Integer doctorId, List<Integer> departmentIdList) {
        Example doctorExample = new Example(Doctor.class);
        doctorExample.createCriteria().andEqualTo("id",doctorId)
                .andEqualTo("isDelete",0);
        Doctor doctor = doctorMapper.selectOneByExample(doctorExample);
        if (doctor == null){
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        }
        Example example = new Example(DoctorDepartment.class);
        example.createCriteria().andEqualTo("doctorId",doctorId);
        doctorDepartmentMapper.deleteByExample(example);
        for (Integer departmentId:departmentIdList){
            Example departmentExample = new Example(Department.class);
            example.createCriteria().andEqualTo("id",departmentId).andEqualTo("isDelete",0);
            Department department = departmentMapper.selectOneByExample(departmentExample);
            if (department == null) {
                throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
            }
            DoctorDepartment doctorDepartment = new DoctorDepartment();
            doctorDepartment.setDoctorId(doctorId);
            doctorDepartment.setDepartmentId(departmentId);
            doctorDepartment.setCreateTime(new Date());
            doctorDepartment.setUpdateTime(new Date());
            int i = doctorDepartmentMapper.insertSelective(doctorDepartment);
            if (i != 1) {
                throw new InternetHospitalException(ExceptionConstants.INSERT_DOCTOR_INTO_DEPARTMENT_FAIL);
            }
        }
        doctor.setDeptNum(departmentIdList.size());
        doctorMapper.updateByPrimaryKey(doctor);
    }
}
