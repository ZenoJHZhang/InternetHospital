package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.time.LocalDate;
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
    private final ManagementDoctorService managementDoctorService;
    private final ManagementDepartmentService managementDepartmentService;

    @Autowired
    public ManagementScheduleDoctorServiceImpl(ScheduleDoctorMapper scheduleDoctorMapper, DoctorMapper doctorMapper, DepartmentMapper departmentMapper, ManagementDoctorService managementDoctorService, ManagementDepartmentService managementDepartmentService) {
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.doctorMapper = doctorMapper;
        this.departmentMapper = departmentMapper;
        this.managementDoctorService = managementDoctorService;
        this.managementDepartmentService = managementDepartmentService;
    }

    @Override
    public Integer insertNormalScheduleDoctor(Integer scheduleDepartmentId, Integer departmentId, Integer doctorId,
                                              String timeInterval, String scheduleTime, Integer totalNumber) {
        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        Department department = managementDepartmentService.getDepartmentById(departmentId);
        Doctor doctor = managementDoctorService.getDoctorById(doctorId);
        scheduleDoctor.setScheduleTime(scheduleTime);
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
            //医生排班已开始，无法更新
            if (scheduleDoctorList.get(i).getIsStart() == 1) {
                throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DOCTOR_HAS_STARTED);
            }
            int averageNumber;
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
    public Integer insertExpertScheduleDoctor(Integer departmentId, Integer doctorId, String timeInterval, String scheduleTime, Integer totalNumber) {
        //是否有专家医生排班重复
        if (getScheduleDoctorByDoctorIdAndScheduleTimeAndType(doctorId, scheduleTime, Integer.valueOf(Constants.ONE)) != null) {
            throw new InternetHospitalException(ExceptionConstants.SAME_SCHEDULE_DOCTOR);
        }
        Department department = managementDepartmentService.getDepartmentById(departmentId);
        if (!department.getDeptType().equals(Integer.valueOf(Constants.ONE))) {
            throw new InternetHospitalException(ExceptionConstants.NOT_EXPERT_DEPARTMENT);
        }
        Doctor doctor = managementDoctorService.getDoctorById(doctorId);
        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        scheduleDoctor.setScheduleTime(scheduleTime);
        scheduleDoctor.setDepartmentName(department.getDepartmentName());
        scheduleDoctor.setDepartmentId(departmentId);
        scheduleDoctor.setDoctorId(doctorId);
        scheduleDoctor.setDoctorName(doctor.getDoctorName());
        scheduleDoctor.setType(Integer.valueOf(Constants.ONE));
        scheduleDoctor.setCreateTime(new Date());
        scheduleDoctor.setUpdateTime(new Date());
        return scheduleDoctorMapper.insertSelective(
                setScheduleDoctorTotalNumberByTimeInterval(scheduleDoctor, timeInterval, totalNumber)
        );
    }

    @Override
    public void updateExpertScheduleDoctor(Integer scheduleDoctorId, String timeInterval, Integer totalNumber) {
        ScheduleDoctor scheduleDoctor = isScheduleDoctorStarting(scheduleDoctorId);
        //判断是否为专家医生排班
        if (!scheduleDoctor.getType().equals(Integer.valueOf(Constants.ONE))) {
            throw new InternetHospitalException(ExceptionConstants.NOT_EXPERT_SCHEDULE_DOCTOR);
        }
        scheduleDoctor.setUpdateTime(new Date());
        scheduleDoctorMapper.updateByPrimaryKeySelective(
                setScheduleDoctorTotalNumberByTimeInterval(scheduleDoctor, timeInterval, totalNumber)
        );
    }

    @Override
    public ScheduleDoctor getScheduleDoctorByDoctorIdAndScheduleTimeAndType
            (Integer doctorId, String scheduleTime, Integer type) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("doctorId", doctorId)
                .andEqualTo("scheduleTime", scheduleTime)
                .andEqualTo("type", type);
        return scheduleDoctorMapper.selectOneByExample(example);
    }

    @Override
    public void deleteScheduleDoctorById(Integer scheduleDoctorId) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("id", scheduleDoctorId)
                .andEqualTo("isStart", 0);
        int i = scheduleDoctorMapper.deleteByExample(example);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DOCTOR_NOT_EXIST);
        }
    }

    @Override
    public void deleteScheduleDoctorByScheduleDepartmentIdWithTimeInterval(Integer scheduleDepartmentId,String timeInterval) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("scheduleDepartmentId", scheduleDepartmentId);
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
        for (ScheduleDoctor scheduleDoctor:scheduleDoctorList
             ) {
            if(scheduleDoctor.getIsStart() != 0){
                throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DOCTOR_HAS_STARTED);
            }
            switch (timeInterval) {
                case Constants.MORNING:
                        scheduleDoctor.setDoctorMorningHas(Constants.ZERO);
                    scheduleDoctor.setDoctorMorningTotalNumber(0);
                    break;
                case Constants.AFTERNOON:
                    scheduleDoctor.setDoctorAfternoonHas(Constants.ZERO);
                    scheduleDoctor.setDoctorAfternoonTotalNumber(0);
                    break;
                default:
                    scheduleDoctor.setDoctorNightHas(Constants.ZERO);
                    scheduleDoctor.setDoctorNightTotalNumber(0);
                    break;
            }
            scheduleDoctor.setUpdateTime(new Date());
            if(scheduleDoctor.getDoctorMorningHas().equals(Constants.ZERO) &&
                    scheduleDoctor.getDoctorAfternoonHas().equals(Constants.ZERO) &&
                    scheduleDoctor.getDoctorNightHas().equals(Constants.ZERO)){
                scheduleDoctorMapper.deleteByPrimaryKey(scheduleDoctor.getId());
            }
            else {
                scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
            }
        }

    }

    @Override
    public PageInfo<ScheduleDoctor> listScheduleDoctorOfTimeInterval(
            Integer departmentId, String scheduleTime, String timeInterval, Integer type, Integer pageNumber, Integer pageSize) {

        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        scheduleDoctor.setType(type);
        scheduleDoctor.setDepartmentId(departmentId);
        scheduleDoctor.setScheduleTime(scheduleTime);
        PageHelper.startPage(pageNumber, pageSize);
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.
                select(setScheduleDoctorTotalNumberByTimeInterval(scheduleDoctor, timeInterval, null));
        return new PageInfo<>(scheduleDoctorList);
    }

    @Override
    public Integer countScheduleDoctorByScheduleDepartment(Integer scheduleDepartmentId) {
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("scheduleDepartmentId", scheduleDepartmentId);
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
        return scheduleDoctorList.size();
    }

    @Override
    public void setScheduleDoctorStart() {
        ScheduleDoctor scheduleDoctor = new ScheduleDoctor();
        scheduleDoctor.setIsStart(1);
        LocalDate date = LocalDate.now();
        Example example = new Example(ScheduleDepartment.class);
        example.createCriteria().andEqualTo("scheduleTime", date.toString());
        scheduleDoctorMapper.updateByExampleSelective(scheduleDoctor, example);
    }

    /**
     * 根据排班时段设置对应时段号源总数
     * ps：号源数为0时，仅设置医生排班时段
     *
     * @param scheduleDoctor 医生排班
     * @param timeInterval   排班时段
     * @param totalNumber    号源数
     * @return 医生排班
     */
    private ScheduleDoctor setScheduleDoctorTotalNumberByTimeInterval(ScheduleDoctor scheduleDoctor,
                                                                      String timeInterval, Integer totalNumber) {
        switch (timeInterval) {
            case Constants.MORNING:
                scheduleDoctor.setDoctorMorningHas(Constants.ONE);
                if (totalNumber != null) {
                    scheduleDoctor.setDoctorMorningTotalNumber(totalNumber);
                }
                break;
            case Constants.AFTERNOON:
                scheduleDoctor.setDoctorAfternoonHas(Constants.ONE);
                if (totalNumber != null) {
                    scheduleDoctor.setDoctorAfternoonTotalNumber(totalNumber);
                }
                break;
            default:
                scheduleDoctor.setDoctorNightHas(Constants.ONE);
                if (totalNumber != null) {
                    scheduleDoctor.setDoctorNightTotalNumber(totalNumber);
                }
                break;
        }
        return scheduleDoctor;
    }

    /**
     * 判断医生排班是否存在以及是否已经开始
     *
     * @param scheduleDoctorId 医生排班id
     * @return 科室排班
     */
    private ScheduleDoctor isScheduleDoctorStarting(Integer scheduleDoctorId) {
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId);
        if (scheduleDoctor == null) {
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DOCTOR_NOT_EXIST);
        }
        if (scheduleDoctor.getIsStart() == 1) {
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DOCTOR_HAS_STARTED);
        }
        return scheduleDoctor;
    }
}
