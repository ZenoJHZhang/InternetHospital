package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.DoctorDepartment;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.mapper.DoctorDepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/21 10:04
 */
@Service("managementDoctorService")
public class ManagementDoctorServiceImpl implements ManagementDoctorService {
    private static final String DEFAULT_PASSWORD = "123456";
    private static final Integer DOCTOR_ROLE_ID = 2;
    private final UserService userService;
    private final DoctorMapper doctorMapper;
    private final DoctorDepartmentMapper doctorDepartmentMapper;

    @Autowired
    public ManagementDoctorServiceImpl(UserService userService, DoctorMapper doctorMapper, DoctorDepartmentMapper doctorDepartmentMapper) {
        this.userService = userService;
        this.doctorMapper = doctorMapper;
        this.doctorDepartmentMapper = doctorDepartmentMapper;
    }

    @Override
    public void insertDoctor(Doctor doctor) {
        String phone = doctor.getPhone();
        doctor.setCreateTime(new Date());
        doctor.setUpdateTime(new Date());
        boolean isSameFlag = userService.isSameUserPhone(phone);
        if (isSameFlag) {
            throw new InternetHospitalException(ExceptionConstants.SAME_USER_PHONE);
        } else {
            userService.isSameIdCard(doctor.getDoctorIdCard());
            isSameDoctor(doctor.getDoctorNumber(), doctor.getPhone(), doctor.getDoctorIdCard(), doctor.getId());
            Integer userId = userService.userRegister(phone, DEFAULT_PASSWORD, DOCTOR_ROLE_ID);
            doctor.setUserId(userId);
            int i = doctorMapper.insertSelective(doctor);
            if (i != 1) {
                throw new InternetHospitalException(ExceptionConstants.INSERT_DOCTOR_FAIL);
            }
        }
    }

    @Override
    public void updateDoctor(Doctor doctor) {
        isSameDoctor(doctor.getDoctorNumber(), doctor.getPhone(), doctor.getDoctorIdCard(), doctor.getId());
        doctor.setUpdateTime(new Date());
        int i = doctorMapper.updateByPrimaryKey(doctor);
        if(i != 1){
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DOCTOR_FAIL);
        }
    }

    @Override
    public void deleteDoctor(Integer doctorId) {
        Doctor doctor = getDoctorById(doctorId);
        Integer userId = doctor.getUserId();
        int i = doctorMapper.deleteByPrimaryKey(doctorId);
        if (i != 1){
            throw new InternetHospitalException(ExceptionConstants.DELETE_DOCTOR_FAIL);
        }
        userService.deleteUser(userId);
    }

    @Override
    public Doctor getDoctorById(Integer doctorId) {
        Doctor doctor = doctorMapper.selectByPrimaryKey(doctorId);
        if (doctor == null){
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        }
        return doctor;
    }

    @Override
    public void isSameDoctor(String doctorNumber, String doctorPhone, String doctorIdCard, Integer doctorId) {
        Example example = new Example(Doctor.class);
        example.createCriteria().andNotEqualTo("id", doctorId);
        example.and().orEqualTo("phone", doctorPhone)
                .orEqualTo("doctorNumber", doctorNumber)
                .orEqualTo("doctorIdCard", doctorIdCard);
        Doctor doctor = doctorMapper.selectOneByExample(example);
        if (doctor != null) {
            throw new InternetHospitalException(ExceptionConstants.SAME_DOCTOR);
        }
    }

    @Override
    public PageInfo<Doctor> listDoctorByDepartmentId(Integer departmentId,Integer pageNo,Integer pageSize) {
        Example example = new Example(DoctorDepartment.class);
        example.createCriteria().andEqualTo("departmentId",departmentId);
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.selectByExample(example);
        List<Doctor> doctorList = new ArrayList<>();
        for (DoctorDepartment doctorDepartment:doctorDepartmentList
             ) {
            Integer doctorId = doctorDepartment.getDoctorId();
            Doctor doctor = doctorMapper.selectByPrimaryKey(doctorId);
            doctorList.add(doctor);
        }
        return new PageInfo<>(doctorList);
    }

}
