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

import java.util.ArrayList;
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
    private ManagementDoctorDepartmentServiceImpl(DoctorDepartmentMapper doctorDepartmentMapper, DoctorMapper doctorMapper, DepartmentMapper departmentMapper){
        this.doctorDepartmentMapper = doctorDepartmentMapper;
        this.doctorMapper = doctorMapper;
        this.departmentMapper = departmentMapper;
    }

    @Override
    public List<Doctor> listDoctorByDepartmentId(Integer departmentId) {
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        Department department = departmentMapper.selectByPrimaryKey(departmentId);
        if (department == null){
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        doctorDepartment.setDepartmentId(departmentId);
        List<Doctor> doctorList = new ArrayList<>();
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
        if (doctorDepartmentList.size() == 0){
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_HAS_NO_DOCTOR);
        }
        for (DoctorDepartment o:doctorDepartmentList
             ) {
            Doctor doctor = doctorMapper.selectByPrimaryKey(o.getDoctorId());
            if (doctor == null){
                throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
            }
            doctorList.add(doctor);
        }
        return doctorList;
    }

    @Override
    public void addDoctorIntoDepartment(Integer doctorId, Integer departmentId) {

    }
}
