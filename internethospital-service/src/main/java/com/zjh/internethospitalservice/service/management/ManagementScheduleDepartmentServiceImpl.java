package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
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
 * @date: 2019/1/2 15:36
 */
@Service("managementScheduleDepartmentService")
public class ManagementScheduleDepartmentServiceImpl implements ManagementScheduleDepartmentService {

    private final ScheduleDepartmentMapper scheduleDepartmentMapper;
    private final DepartmentMapper departmentMapper;
    private final ScheduleDoctorMapper scheduleDoctorMapper;

    @Autowired
    public ManagementScheduleDepartmentServiceImpl(ScheduleDepartmentMapper scheduleDepartmentMapper,
                                                   DepartmentMapper departmentMapper, ScheduleDoctorMapper scheduleDoctorMapper) {
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
        this.departmentMapper = departmentMapper;
        this.scheduleDoctorMapper = scheduleDoctorMapper;
    }

    @Override
    public Integer insertScheduleDepartment(Integer departmentId, String timeInterval, Integer totalNumber, String scheduleTime, Integer type) {
        Department department = departmentMapper.selectByPrimaryKey(departmentId);
        if (department == null) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_NOT_EXIST);
        }
        if (!department.getDeptType().equals(type)) {
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_TYPE_ERROR);
        }
        int result;
        ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
        scheduleDepartment.setDepartmentId(departmentId);
        scheduleDepartment.setScheduleTime(scheduleTime);
        scheduleDepartment.setType(type);
        switch (timeInterval) {
            case Constants.MORNING:
                scheduleDepartment.setMorningHas("1");
                scheduleDepartment.setMorningTotalNumber(totalNumber);
                break;
            case Constants.AFTERNOON:
                scheduleDepartment.setAfternoonHas("1");
                scheduleDepartment.setAfternoonNumber(totalNumber);
                break;
            case Constants.NIGHT:
                scheduleDepartment.setNightHas("1");
                scheduleDepartment.setNightTotalNumber(totalNumber);
                break;
            default:
                throw new InternetHospitalException(ExceptionConstants.ERROR_TIME_INTERVAL);
        }
        if (scheduleDepartmentMapper.selectOne(scheduleDepartment) != null) {
            throw new InternetHospitalException(ExceptionConstants.SAME_SCHEDULE_DEPARTMENT);
        } else {
            scheduleDepartment.setCreateTime(new Date());
            scheduleDepartment.setUpdateTime(new Date());
            result = scheduleDepartmentMapper.insertSelective(scheduleDepartment);
        }
        if (result != 1) {
            throw new InternetHospitalException(ExceptionConstants.INSERT_SCHEDULE_DEPARTMENT_FAIL);
        }
        return scheduleDepartment.getId();
    }

    @Override
    public void updateScheduleDepartment(ScheduleDepartment scheduleDepartment, String timeInterval, Integer insertTotalNumber) {
        ScheduleDepartment getOne = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartment.getId());
        if (getOne == null) {
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DEPARTMENT_NOT_EXIST);
        }
        switch (timeInterval) {
            case Constants.MORNING:
                insertTotalNumber += getOne.getMorningTotalNumber();
                scheduleDepartment.setMorningTotalNumber(insertTotalNumber);
                break;
            case Constants.AFTERNOON:
                insertTotalNumber += getOne.getAfternoonTotalNumber();
                scheduleDepartment.setAfternoonNumber(insertTotalNumber);
                break;
            case Constants.NIGHT:
                insertTotalNumber += getOne.getNightTotalNumber();
                scheduleDepartment.setNightTotalNumber(insertTotalNumber);
                break;
            default:
                break;
        }
        scheduleDepartment.setUpdateTime(new Date());
        int i = scheduleDepartmentMapper.updateByPrimaryKeySelective(scheduleDepartment);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_SCHEDULE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public void updateScheduleDepartmentNumber(ScheduleDepartment scheduleDepartment, String timeInterval, Integer totalNumber) {
        ScheduleDepartment getOne = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartment.getId());
        if (getOne == null) {
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DEPARTMENT_NOT_EXIST);
        }
        switch (timeInterval) {
            case Constants.MORNING:
                scheduleDepartment.setMorningHas(Constants.ONE);
                scheduleDepartment.setMorningTotalNumber(totalNumber);
                break;
            case Constants.AFTERNOON:
                scheduleDepartment.setAfternoonHas(Constants.ONE);
                scheduleDepartment.setAfternoonTotalNumber(totalNumber);
                break;
            case Constants.NIGHT:
                scheduleDepartment.setNightHas(Constants.ONE);
                scheduleDepartment.setNightTotalNumber(totalNumber);
                break;
            default:
                break;
        }
        scheduleDepartment.setUpdateTime(new Date());
        int i = scheduleDepartmentMapper.updateByPrimaryKeySelective(scheduleDepartment);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_SCHEDULE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public void updateScheduleDepartment(ScheduleDepartment scheduleDepartment) {
        scheduleDepartment.setUpdateTime(new Date());
        int i = scheduleDepartmentMapper.updateByPrimaryKeySelective(scheduleDepartment);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.UPDATE_SCHEDULE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public void deleteScheduleDepartmentWithType(Integer scheduleDepartmentId) {
        int i;
        ScheduleDepartment scheduleDepartment = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartmentId);
        if (scheduleDepartment == null){
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DEPARTMENT_NOT_EXIST);
        }
        Integer type = scheduleDepartment.getType();
        if (type == 0) {
            Example example = new Example(ScheduleDoctor.class);
            example.createCriteria().andEqualTo("scheduleDepartmentId", scheduleDepartmentId);
            scheduleDoctorMapper.deleteByExample(example);
            i = scheduleDepartmentMapper.deleteByPrimaryKey(scheduleDepartmentId);
        } else {
            Example example = new Example(ScheduleDoctor.class);
            example.createCriteria().andEqualTo("scheduleDepartmentId", scheduleDepartmentId);
            List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
            if (scheduleDoctorList.size() > 0) {
                throw new InternetHospitalException(ExceptionConstants.HAS_SCHEDULE_DOCTOR_IN_SCHEDULE_DEPARTMENT);
            } else {
                scheduleDoctorMapper.deleteByExample(example);
                i = scheduleDepartmentMapper.deleteByPrimaryKey(scheduleDepartmentId);
            }
        }
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.DELETE_SCHEDULE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTimeAndType(Integer departmentId,
                                                                                        String scheduleTime, Integer type) {
        Example example = new Example(ScheduleDepartment.class);
        example.createCriteria().andEqualTo("departmentId", departmentId).
                andEqualTo("scheduleTime", scheduleTime).andEqualTo("type", type);
        return scheduleDepartmentMapper.selectOneByExample(example);
    }
}
