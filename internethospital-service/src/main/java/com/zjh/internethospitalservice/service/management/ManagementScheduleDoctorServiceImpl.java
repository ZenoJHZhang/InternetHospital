package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.dto.ExpertScheduleDto;
import com.zjh.internethospitalapi.dto.ScheduleDoctorDto;
import com.zjh.internethospitalapi.dto.TodayScheduleDoctorDto;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedList;
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
    private final ScheduleDepartmentMapper scheduleDepartmentMapper;

    @Autowired
    public ManagementScheduleDoctorServiceImpl(ScheduleDoctorMapper scheduleDoctorMapper, DoctorMapper doctorMapper, DepartmentMapper departmentMapper, ManagementDoctorService managementDoctorService, ManagementDepartmentService managementDepartmentService, ScheduleDepartmentMapper scheduleDepartmentMapper) {
        this.scheduleDoctorMapper = scheduleDoctorMapper;
        this.doctorMapper = doctorMapper;
        this.departmentMapper = departmentMapper;
        this.managementDoctorService = managementDoctorService;
        this.managementDepartmentService = managementDepartmentService;
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
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
    public void deleteScheduleDoctorByScheduleDepartmentIdWithTimeInterval(Integer scheduleDoctorId, String timeInterval,
                                                                           Integer type, Integer scheduleDepartmentId) {
        if (type.equals(0)){
            Example example = new Example(ScheduleDoctor.class);
            example.createCriteria().andEqualTo("scheduleDepartmentId",scheduleDepartmentId);
            List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
            for (ScheduleDoctor scheduleDoctor:scheduleDoctorList
                 ) {
                deleteScheduleDoctor(scheduleDoctor.getId(),timeInterval);
            }
        }
        else if(type.equals(1)){
            deleteScheduleDoctor(scheduleDoctorId,timeInterval);
        }
    }

    @Override
    public ExpertScheduleDto listScheduleDoctorByScheduleTimeOfType(
            Integer departmentId, String scheduleTime, Integer type) {
        //首先查出属于这个专家科室的医生列表
        Department department = departmentMapper.selectByPrimaryKey(departmentId);
        if (department == null) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        if (department.getDeptType() != 1) {
            throw new InternetHospitalException(ExceptionConstants.NOT_EXPERT_DEPARTMENT);
        }
        ExpertScheduleDto expertScheduleDto = new ExpertScheduleDto();
        List<TodayScheduleDoctorDto> todayScheduleDoctorDtoList = new LinkedList<>();
        List<Doctor> doctorList = managementDoctorService.listDoctorByDepartmentId(departmentId);
        for (Doctor doctor : doctorList
        ) {
            TodayScheduleDoctorDto todayScheduleDoctorDto = new TodayScheduleDoctorDto();
            List<ScheduleDoctorDto> scheduleDoctorDtoList = new LinkedList<>();
            //同一排班日期，同一医生的专家排班只能有一个
            Example example = new Example(ScheduleDoctor.class);
            example.createCriteria().andEqualTo("doctorId", doctor.getId()).andEqualTo("scheduleTime", scheduleTime).andEqualTo("type", type);
            ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectOneByExample(example);
            if (scheduleDoctor != null) {
                if (scheduleDoctor.getDoctorMorningHas().equals(Constants.ONE)) {
                    ScheduleDoctorDto scheduleDoctorDto = new ScheduleDoctorDto();
                    scheduleDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                    scheduleDoctorDto.setScheduleTime(scheduleTime);
                    scheduleDoctorDto.setTimeInterval(Constants.MORNING);
                    scheduleDoctorDto.setTotalNumber(scheduleDoctor.getDoctorMorningTotalNumber());
                    scheduleDoctorDtoList.add(scheduleDoctorDto);
                }
                if (scheduleDoctor.getDoctorAfternoonHas().equals(Constants.ONE)) {
                    ScheduleDoctorDto scheduleDoctorDto = new ScheduleDoctorDto();
                    scheduleDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                    scheduleDoctorDto.setScheduleTime(scheduleTime);
                    scheduleDoctorDto.setTimeInterval(Constants.AFTERNOON);
                    scheduleDoctorDto.setTotalNumber(scheduleDoctor.getDoctorAfternoonTotalNumber());
                    scheduleDoctorDtoList.add(scheduleDoctorDto);
                }
                if (scheduleDoctor.getDoctorNightHas().equals(Constants.ONE)) {
                    ScheduleDoctorDto scheduleDoctorDto = new ScheduleDoctorDto();
                    scheduleDoctorDto.setScheduleDoctorId(scheduleDoctor.getId());
                    scheduleDoctorDto.setScheduleTime(scheduleTime);
                    scheduleDoctorDto.setTimeInterval(Constants.NIGHT);
                    scheduleDoctorDto.setTotalNumber(scheduleDoctor.getDoctorNightTotalNumber());
                    scheduleDoctorDtoList.add(scheduleDoctorDto);
                }
            }
            todayScheduleDoctorDto.setScheduleDoctorDtoList(scheduleDoctorDtoList);
            todayScheduleDoctorDto.setDoctorId(doctor.getId());
            todayScheduleDoctorDto.setDoctorName(doctor.getDoctorName());
            todayScheduleDoctorDtoList.add(todayScheduleDoctorDto);
        }
        expertScheduleDto.setTodayScheduleDoctorDtoList(todayScheduleDoctorDtoList);
        return expertScheduleDto;
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

    /**
     * 删除或更新医生排班对应时段为0
     * @param scheduleDoctorId 医生排班id
     * @param timeInterval 排班时段
     */
    private void deleteScheduleDoctor(Integer scheduleDoctorId,String timeInterval){
        ScheduleDoctor scheduleDoctor = scheduleDoctorMapper.selectByPrimaryKey(scheduleDoctorId);
        if (scheduleDoctor.getIsStart() != 0) {
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
        if (scheduleDoctor.getDoctorMorningHas().equals(Constants.ZERO) &&
                scheduleDoctor.getDoctorAfternoonHas().equals(Constants.ZERO) &&
                scheduleDoctor.getDoctorNightHas().equals(Constants.ZERO)) {
            scheduleDoctorMapper.deleteByPrimaryKey(scheduleDoctor.getId());
        } else {
            scheduleDoctorMapper.updateByPrimaryKeySelective(scheduleDoctor);
        }
    }
}
