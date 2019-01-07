package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/3 09:29
 */
@Service("managementScheduleDoctorService")
public class ManagementScheduleDoctorServiceImpl implements ManagementScheduleDoctorService {

    private ScheduleDoctorMapper scheduleDoctorMapper;
    private final DepartmentMapper departmentMapper;
    private final DoctorMapper doctorMapper;
    private final ScheduleDepartmentMapper scheduleDepartmentMapper;

    @Autowired
    public ManagementScheduleDoctorServiceImpl(ScheduleDoctorMapper scheduleDoctorMapper, DepartmentMapper departmentMapper, DoctorMapper doctorMapper, ScheduleDepartmentMapper scheduleDepartmentMapper) {
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.departmentMapper = departmentMapper;
        this.doctorMapper = doctorMapper;
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
    }

    @Override
    public void insertScheduleDoctor(Integer scheduleDepartmentId, Integer departmentId, Integer doctorId,
                                     String scheduleTime, String timeInterval, Integer totalNumber) {
        Department department = departmentMapper.selectByPrimaryKey(departmentId);
        ScheduleDepartment scheduleDepartment = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartmentId);
        String departmentName;
        String doctorName;
        int result;
        if (scheduleDepartment == null) {
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DEPARTMENT_NOT_EXIST);
        } else {
            if (!scheduleDepartment.getScheduleTime().equals(scheduleTime)) {
                throw new InternetHospitalException(ExceptionConstants.INSERT_SCHEDULE_DEPARTMENT_FAIL);
            }
        }
        if (department == null) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        } else {
            departmentName = department.getDepartmentName();
        }
        Doctor doctor = doctorMapper.selectByPrimaryKey(doctorId);
        if (doctor == null) {
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        } else {
            doctorName = doctor.getDoctorName();
        }
        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        scheduleDoctor.setDoctorId(doctorId);
        scheduleDoctor.setScheduleTime(scheduleTime);
        switch (timeInterval) {
            case Constants.MORNING:
                if (!Constants.TRUE.equals(scheduleDepartment.getMorningHas())) {
                    throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
                } else {
                    scheduleDoctor.setDoctorMorningHas("1");
                    scheduleDoctor.setDoctorMorningTotalNumber(totalNumber);
                }
                break;
            case Constants.AFTERNOON:
                if (!Constants.TRUE.equals(scheduleDepartment.getAfternoonHas())) {
                    throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
                } else {
                    scheduleDoctor.setDoctorAfternoonHas("1");
                    scheduleDoctor.setDoctorAfternoonTotalNumber(totalNumber);
                }
                break;
            case Constants.NIGHT:
                if (!Constants.TRUE.equals(scheduleDepartment.getNightHas())) {
                    throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
                } else {
                    scheduleDoctor.setDoctorNightHas("1");
                    scheduleDoctor.setDoctorNightTotalNumber(totalNumber);
                }
                break;
            default:
                throw new InternetHospitalException(ExceptionConstants.ERROR_TIME_INTERVAL);
        }
        if (scheduleDoctorMapper.selectOne(scheduleDoctor) != null) {
            throw new InternetHospitalException(ExceptionConstants.SAME_SCHEDULE_DOCTOR);
        } else {
            scheduleDoctor.setScheduleDepartmentId(scheduleDepartmentId);
            scheduleDoctor.setDepartmentId(departmentId);
            scheduleDoctor.setDepartmentName(departmentName);
            scheduleDoctor.setDoctorName(doctorName);
            scheduleDoctor.setCreateTime(new Date());
            scheduleDoctor.setUpdateTime(new Date());
            result = scheduleDoctorMapper.insertSelective(scheduleDoctor);
        }
        if (result != 1) {
            throw new InternetHospitalException(ExceptionConstants.INSERT_SCHEDULE_DOCTOR_FAIL);
        }
    }

    @Override
    public void updateScheduleDoctor(ScheduleDoctor scheduleDoctor) {
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
    }

    @Override
    public void deleteScheduleDepartment(Integer scheduleDoctorId) {
        int i = scheduleDoctorMapper.deleteByPrimaryKey(scheduleDoctorId);
        if (i != 1){
            throw new InternetHospitalException(ExceptionConstants.DELETE_SCHEDULE_DOCTOR_FAIL);
        }
    }
}
