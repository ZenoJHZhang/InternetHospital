package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.*;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.mapper.*;
import com.zjh.internethospitalservice.util.ImgUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.*;

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
    private final ScheduleDoctorMapper scheduleDoctorMapper;
    private final ImgMapper imgMapper;
    private final DepartmentMapper departmentMapper;

    @Autowired
    public ManagementDoctorServiceImpl(
            UserService userService, DoctorDepartmentMapper doctorDepartmentMapper,
            ScheduleDoctorMapper scheduleDoctorMapper, DoctorMapper doctorMapper, ImgMapper imgMapper, DepartmentMapper departmentMapper) {
        this.userService = userService;
        this.doctorMapper = doctorMapper;
        this.doctorDepartmentMapper = doctorDepartmentMapper;
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.imgMapper = imgMapper;
        this.departmentMapper = departmentMapper;
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
    public void updateDoctorSelective(Integer doctorId, String doctorNumber, String phone,
                                      String doctorTitle, Integer imgId, String goodAt) {
        Doctor doctor = getDoctorById(doctorId);
        if (doctorNumber != null) {
            doctor.setDoctorNumber(doctorNumber);
        }
        if (phone != null) {
            doctor.setPhone(phone);
        }
        isSameDoctor(doctorNumber, phone, doctor.getDoctorIdCard(), doctorId);
        if (doctorTitle != null) {
            doctor.setDoctorTitle(doctorTitle);
        }
        if (imgId != null) {
            doctor.setImgId(imgId);
        }
        if (goodAt != null) {
            doctor.setGoodAt(goodAt);
        }
        doctor.setUpdateTime(new Date());
        int i = doctorMapper.updateByPrimaryKey(doctor);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DOCTOR_FAIL);
        }
    }


    @Override
    public void deleteDoctor(Integer doctorId) {
        Doctor doctor = getDoctorById(doctorId);
        Integer userId = doctor.getUserId();
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("doctorId", doctorId)
                .andGreaterThanOrEqualTo("scheduleTime", new Date());
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
        if (scheduleDoctorList.size() > 0) {
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_HAS_SCHEDULE);
        }
        doctor.setIsDelete(1);
        int i = doctorMapper.updateByPrimaryKey(doctor);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.DELETE_DOCTOR_FAIL);
        }
        userService.deleteUser(userId);
    }

    @Override
    public Doctor getDoctorById(Integer doctorId) {
        Example example = new Example(Doctor.class);
        example.createCriteria().andEqualTo("id", doctorId)
                .andEqualTo("isDelete", 0);
        Doctor doctor = doctorMapper.selectOneByExample(example);
        if (doctor == null) {
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        }
        List<Department> departmentList = listDepartmentListByDoctorId(doctorId);
        doctor.setImgPath(getDoctorImgPath(doctor.getImgId()));
        doctor.setDepartmentList(departmentList);
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
    public List<Doctor> listDoctorByDepartmentId(Integer departmentId) {
        Example example = new Example(DoctorDepartment.class);
        example.createCriteria().andEqualTo("departmentId", departmentId).andEqualTo("isDelete", 0);
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.selectByExample(example);
        List<Doctor> doctorList = new ArrayList<>();
        for (DoctorDepartment doctorDepartment : doctorDepartmentList
        ) {
            Integer doctorId = doctorDepartment.getDoctorId();
            Doctor doctor = getDoctorById(doctorId);
            doctorList.add(doctor);
        }
        return doctorList;
    }

    @Override
    public PageInfo<Doctor> listDoctorByNameOrNumberWithDepartmentId(String doctorMessage, Integer departmentId,
                                                                     Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Doctor> doctorList = doctorMapper.listDoctorByNameOrNumberWithDepartmentId(doctorMessage.trim(), departmentId);
        for (Doctor doctor:doctorList
             ) {
            List<Department> departmentList = listDepartmentListByDoctorId(doctor.getId());
            doctor.setImgPath(getDoctorImgPath(doctor.getImgId()));
            doctor.setDepartmentList(departmentList);
        }
        return new PageInfo<>(doctorList);
    }

    @Override
    public List<Department> listDepartmentListByDoctorId(Integer doctorId) {
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        doctorDepartment.setDoctorId(doctorId);
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
        List<Department> departmentList = new ArrayList<>();
        for (DoctorDepartment o:doctorDepartmentList
             ) {
            departmentList.add(departmentMapper.selectByPrimaryKey(o.getDepartmentId()));
        }
        return departmentList;
    }


    private String getDoctorImgPath(Integer imgId) {
        Img img = imgMapper.selectByPrimaryKey(imgId);
        return ImgUtil.imgPathGenerate(img);
    }
}
