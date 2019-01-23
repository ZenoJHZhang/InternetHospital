package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
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
 * @date: 2019/1/21 10:04
 */
@Service("managementDoctorService")
public class ManagementDoctorServiceImpl implements ManagementDoctorService {
    private static final String DEFAULT_PASSWORD = "123456";
    private static final Integer DOCTOR_ROLE_ID = 2;
    private final UserService userService;
    private final DoctorMapper doctorMapper;

    @Autowired
    public ManagementDoctorServiceImpl(UserService userService, DoctorMapper doctorMapper) {
        this.userService = userService;
        this.doctorMapper = doctorMapper;
    }

    @Override
    public void insertDoctor(Doctor doctor) {
        String phone = doctor.getPhone();
        doctor.setCreateTime(new Date());
        doctor.setUpdateTime(new Date());
        boolean isSameFlag = userService.isSameUserPhone(phone);
        if (isSameFlag) {
            throw new InternetHospitalException(ExceptionConstants.SAME_USER_PHONE);
        }
        else {
            userService.isSameIdCard(doctor.getDoctorIdCard());
            isSameDoctorNumber(doctor.getDoctorNumber());
            userService.userRegister(phone,DEFAULT_PASSWORD,DOCTOR_ROLE_ID);
            int i = doctorMapper.insertSelective(doctor);
            if (i != 1){
                throw new InternetHospitalException(ExceptionConstants.INSERT_DOCTOR_FAIL);
            }
        }
    }

    @Override
    public void updateDoctor(Doctor doctor) {

    }

    @Override
    public void isSameDoctorNumber(String doctorNumber) {
        Example example = new Example(Doctor.class);
        example.createCriteria().andEqualTo("doctorNumber",doctorNumber);
        List<Doctor> doctorList = doctorMapper.selectByExample(example);
        if (doctorList != null){
            throw new InternetHospitalException(ExceptionConstants.SAME_DOCTOR_NUMBER);
        }
    }

}
