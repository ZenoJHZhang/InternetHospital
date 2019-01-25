package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/25 15:08
 */
@Service("/managementScheduleDoctorService")
public class ManagementScheduleDoctorServiceImpl implements ManagementScheduleDoctorService {

    private final ScheduleDoctorMapper scheduleDoctorMapper;
    private final DoctorMapper doctorMapper;
    private final DepartmentMapper departmentMapper;

    @Autowired
    public ManagementScheduleDoctorServiceImpl(ScheduleDoctorMapper scheduleDoctorMapper, DoctorMapper doctorMapper, DepartmentMapper departmentMapper) {
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.doctorMapper = doctorMapper;
        this.departmentMapper = departmentMapper;
    }

    @Override
    public Integer insertNormalScheduleDoctor(Integer scheduleDepartmentId, Integer departmentId, Integer doctorId,
                                           String timeInterval, String scheduleTime, Integer totalNumber) {
        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        Department department = departmentMapper.selectByPrimaryKey(departmentId);
        if (department == null){
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        Doctor doctor = doctorMapper.selectByPrimaryKey(doctorId);
        if (doctor == null){
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        }
        switch (timeInterval) {
            case Constants.MORNING:
                scheduleDoctor.setDoctorMorningHas(Constants.ONE);
                scheduleDoctor.setDoctorMorningTotalNumber(totalNumber);
                break;
            case Constants.AFTERNOON:
                scheduleDoctor.setDoctorAfternoonHas(Constants.ONE);
                scheduleDoctor.setDoctorAfternoonTotalNumber(totalNumber);
                break;
            default:
                scheduleDoctor.setDoctorNightHas(Constants.ONE);
                scheduleDoctor.setDoctorNightTotalNumber(totalNumber);
                break;
        }
        scheduleDoctor.setDepartmentName(department.getDepartmentName());
        scheduleDoctor.setDepartmentId(departmentId);
        scheduleDoctor.setDoctorId(doctorId);
        scheduleDoctor.setDoctorName(doctor.getDoctorName());
        scheduleDoctor.setCreateTime(new Date());
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDoctorMapper.insertSelective(scheduleDoctor);
        return scheduleDoctor.getId();
    }
}
