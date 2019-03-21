package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.*;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorDepartmentService;
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
    private final ManagementDoctorDepartmentService managementDoctorDepartmentService;

    @Autowired
    public ManagementDoctorServiceImpl(
            UserService userService, DoctorDepartmentMapper doctorDepartmentMapper,
            ScheduleDoctorMapper scheduleDoctorMapper, DoctorMapper doctorMapper, ImgMapper imgMapper, DepartmentMapper departmentMapper, ManagementDoctorDepartmentService managementDoctorDepartmentService) {
        this.userService = userService;
        this.doctorMapper = doctorMapper;
        this.doctorDepartmentMapper = doctorDepartmentMapper;
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.imgMapper = imgMapper;
        this.departmentMapper = departmentMapper;
        this.managementDoctorDepartmentService = managementDoctorDepartmentService;
    }

    @Override
    public Integer insertDoctor(Doctor doctor) {
        String phone = doctor.getPhone();
        doctor.setCreateTime(new Date());
        doctor.setUpdateTime(new Date());
        boolean isSameFlag = userService.isSameUserPhone(phone);
        if (isSameFlag) {
            throw new InternetHospitalException(ExceptionConstants.SAME_USER_PHONE);
        } else {
            userService.isSameIdCard(doctor.getDoctorIdCard());
            isSameDoctor(doctor);
            Integer userId = userService.userRegister(phone, DEFAULT_PASSWORD, DOCTOR_ROLE_ID);
            doctor.setUserId(userId);
            int i = doctorMapper.insertSelective(doctor);
            if (i != 1) {
                throw new InternetHospitalException(ExceptionConstants.INSERT_DOCTOR_FAIL);
            }
            managementDoctorDepartmentService.updateDoctorDepartment(doctor.getId(), doctor.getDepartmentList());
            doctor.setDeptNum(doctor.getDepartmentList().size());
            doctorMapper.updateByPrimaryKeySelective(doctor);
        }
        return doctor.getId();
    }

    @Override
    public Integer updateDoctorSelective(Doctor doctor) {
        isHasNotEndScheduleDoctor(doctor.getId());
        isSameDoctor(doctor);
        managementDoctorDepartmentService.updateDoctorDepartment(doctor.getId(), doctor.getDepartmentList());
        doctor.setDeptNum(doctor.getDepartmentList().size());
        doctor.setUpdateTime(new Date());
        int i = doctorMapper.updateByPrimaryKeySelective(doctor);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DOCTOR_FAIL);
        }
        return doctor.getId();
    }


    @Override
    public void deleteDoctor(Integer doctorId) {
        isHasNotEndScheduleDoctor(doctorId);
        Doctor doctor = getDoctorById(doctorId);
        Integer userId = doctor.getUserId();
        doctor.setIsDelete(1);
        int i = doctorMapper.updateByPrimaryKey(doctor);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.DELETE_DOCTOR_FAIL);
        }
        DoctorDepartment doctorDepartment = new DoctorDepartment();
        doctorDepartment.setDoctorId(doctorId);
        doctorDepartmentMapper.delete(doctorDepartment);
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


    /**
     * 判断是否为重复医生
     * 由手机号，工号和身份证号判断
     *
     * @param doctor 医生信息
     */
    private void isSameDoctor(Doctor doctor) {
        String doctorNumber = doctor.getDoctorNumber();
        String doctorPhone = doctor.getPhone();
        String doctorIdCard = doctor.getDoctorIdCard();
        Integer doctorId = doctor.getId();
        Example example = new Example(Doctor.class);
        example.createCriteria().andNotEqualTo("id", doctorId);
        example.and().orEqualTo("phone", doctorPhone)
                .orEqualTo("doctorNumber", doctorNumber)
                .orEqualTo("doctorIdCard", doctorIdCard);
        if (doctorMapper.selectByExample(example).size() != 0) {
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
        PageHelper.startPage(pageNo, pageSize);
        List<Doctor> doctorList = doctorMapper.listDoctorByNameOrNumberWithDepartmentId(doctorMessage.trim(), departmentId);
        for (Doctor doctor : doctorList
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
        doctorDepartment.setIsDelete(0);
        List<DoctorDepartment> doctorDepartmentList = doctorDepartmentMapper.select(doctorDepartment);
        List<Department> departmentList = new ArrayList<>();
        for (DoctorDepartment o : doctorDepartmentList
        ) {
            departmentList.add(departmentMapper.selectByPrimaryKey(o.getDepartmentId()));
        }
        return departmentList;
    }

    @Override
    public void updateDoctorImg(Integer doctorId, Integer imgId) {
        Doctor doctor = new Doctor();
        doctor.setImgId(imgId);
        doctor.setId(doctorId);
        int i = doctorMapper.updateByPrimaryKeySelective(doctor);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DOCTOR_FAIL);
        }
    }


    private String getDoctorImgPath(Integer imgId) {
        Img img = imgMapper.selectByPrimaryKey(imgId);
        return ImgUtil.imgPathGenerate(img);
    }

    /**
     * 是否有未结束的医生排班在该医生下
     *
     * @param doctorId 医生id
     */
    private void isHasNotEndScheduleDoctor(Integer doctorId) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("doctorId", doctorId).
                andNotEqualTo("isStart", 2).andEqualTo("isDelete", 0);
        if (scheduleDoctorMapper.selectByExample(example).size() != 0) {
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_HAS_NOT_END_SCHEDULE);
        }
    }
}
