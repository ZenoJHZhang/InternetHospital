package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.DoctorDepartment;
import com.zjh.internethospitalapi.service.management.DoctorDepartmentService;
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
@Service("doctorDepartmentService")
public class DoctorDepartmentServiceImpl implements DoctorDepartmentService {

    private final DoctorDepartmentMapper doctorDepartmentMapper;
    private final DoctorMapper doctorMapper;

    @Autowired
    private DoctorDepartmentServiceImpl(DoctorDepartmentMapper doctorDepartmentMapper, DoctorMapper doctorMapper){
        this.doctorDepartmentMapper = doctorDepartmentMapper;
        this.doctorMapper = doctorMapper;
    }

    @Override
    public List<Doctor> listDoctorByDepartmentId(Integer departmentId) {
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        doctorDepartment.setDepartmentId(departmentId);
        List<Doctor> doctorList = new ArrayList<>();
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
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
}
