package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.DoctorDepartment;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
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
    private final ManagementDepartmentService managementDepartmentService;

    @Autowired
    public ManagementDoctorDepartmentServiceImpl(DoctorDepartmentMapper doctorDepartmentMapper,
                                                 DoctorMapper doctorMapper,
                                                 ManagementDepartmentService managementDepartmentService) {
        this.doctorDepartmentMapper = doctorDepartmentMapper;
        this.doctorMapper = doctorMapper;
        this.managementDepartmentService = managementDepartmentService;
    }

    @Override
    public List<Doctor> listDoctorByDepartmentId(Integer departmentId) {
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        //判断科室是否存在
        managementDepartmentService.getDepartmentById(departmentId);
        doctorDepartment.setDepartmentId(departmentId);
        List<Doctor> doctorList = new ArrayList<>();
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
        if (doctorDepartmentList.size() == 0) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_HAS_NO_DOCTOR);
        }
        for (DoctorDepartment o : doctorDepartmentList
        ) {
            Doctor doctor = doctorMapper.selectByPrimaryKey(o.getDoctorId());
            doctorList.add(doctor);
        }
        return doctorList;
    }

    @Transactional(rollbackFor = Exception.class)
    @Override
    public void updateDoctorDepartment(Integer doctorId, List<Department> departmentList) {
        //先将原先医生所属科室的信息删除 doctorDepartment表的所属
        Example example = new Example(DoctorDepartment.class);
        example.createCriteria().andEqualTo("doctorId", doctorId);
        doctorDepartmentMapper.deleteByExample(example);

        for (Department department : departmentList) {
            Integer departmentId = department.getId();
            //判断科室是否存在
            managementDepartmentService.getDepartmentById(departmentId);

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
    }
}
