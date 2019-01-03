package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
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

    public ManagementScheduleDoctorServiceImpl(ScheduleDoctorMapper scheduleDoctorMapper) {
        this.scheduleDoctorMapper = scheduleDoctorMapper;
    }

    @Override
    public void insertScheduleDoctor(Integer scheduleDepartmentId, Integer departmentId, String departmentName, Integer doctorId,
                                     String doctorName, String scheduleTime, String timeInterval, Integer totalNumber) {
        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        scheduleDoctor.setScheduleDepartmentId(scheduleDepartmentId);
        scheduleDoctor.setDepartmentId(departmentId);
        scheduleDoctor.setDepartmentName(departmentName);
        scheduleDoctor.setDoctorId(doctorId);
        scheduleDoctor.setDoctorName(doctorName);
        scheduleDoctor.setScheduleTime(scheduleTime);
        scheduleDoctor.setCreateTime(new Date());
        scheduleDoctor.setUpdateTime(new Date());
        if (timeInterval.equals(Constants.MORNING)) {
            scheduleDoctor.setDoctorMorningHas("1");
            scheduleDoctor.setDoctorMorningNumber(totalNumber);
        } else if (timeInterval.equals(Constants.AFTERNOON)) {
            scheduleDoctor.setDoctorAfternoonHas("1");
            scheduleDoctor.setDoctorAfternoonNumber(totalNumber);
        } else {
            scheduleDoctor.setDoctorNightHas("1");
            scheduleDoctor.setDoctorNightNumber(totalNumber);
        }
        int result = scheduleDoctorMapper.insertSelective(scheduleDoctor);
        if (result != 1){
            throw new InternetHospitalException(ExceptionConstants.INSERT_SCHEDULE_DOCTOR_FAIL);
        }
    }
}
