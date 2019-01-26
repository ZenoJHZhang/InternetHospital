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
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

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
        if (department == null) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        Doctor doctor = doctorMapper.selectByPrimaryKey(doctorId);
        if (doctor == null) {
            throw new InternetHospitalException(ExceptionConstants.DOCTOR_NOT_EXIST);
        }
        scheduleDoctor.setScheduleDepartmentId(scheduleDepartmentId);
        scheduleDoctor.setDepartmentName(department.getDepartmentName());
        scheduleDoctor.setDepartmentId(departmentId);
        scheduleDoctor.setDoctorId(doctorId);
        scheduleDoctor.setDoctorName(doctor.getDoctorName());
        scheduleDoctor.setCreateTime(new Date());
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDoctorMapper.insertSelective(
                setScheduleDoctorTotalNumberByTimeInterval(scheduleDoctor, timeInterval, totalNumber)
        );
        return scheduleDoctor.getId();
    }

    @Override
    public void updateNormalScheduleDoctor(Integer scheduleDepartmentId, String timeInterval, Integer totalNumber) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("scheduleDepartmentId", scheduleDepartmentId);
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
        int size = scheduleDoctorList.size();
        int doctorTotalNumber = totalNumber / size;
        int lastDoctorTotalNumber = totalNumber - (size - 1) * doctorTotalNumber;
        for (int i = 0; i < size; i++) {
            Integer averageNumber;
            if (i == (size - 1)) {
                averageNumber = lastDoctorTotalNumber;
            } else {
                averageNumber = doctorTotalNumber;
            }
            ScheduleDoctor scheduleDoctor = scheduleDoctorList.get(i);
            scheduleDoctor.setUpdateTime(new Date());
            scheduleDoctorMapper.updateByPrimaryKeySelective(
                    setScheduleDoctorTotalNumberByTimeInterval(scheduleDoctor, timeInterval, averageNumber)
            );
        }
    }

    @Override
    public Integer countScheduleDoctorByScheduleDepartment(Integer scheduleDepartmentId) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("scheduleDepartmentId", scheduleDepartmentId);
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
        return scheduleDoctorList.size();
    }

    /**
     * 根据排班时段设置对应时段号源总数
     *
     * @param scheduleDoctor 医生排班
     * @param timeInterval   排班时段
     * @param totalNumber    号源数
     * @return
     */
    private ScheduleDoctor setScheduleDoctorTotalNumberByTimeInterval(ScheduleDoctor scheduleDoctor,
                                                                      String timeInterval, Integer totalNumber) {
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
        return scheduleDoctor;
    }
}
