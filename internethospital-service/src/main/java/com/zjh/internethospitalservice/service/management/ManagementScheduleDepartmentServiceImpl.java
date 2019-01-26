package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/25 14:45
 */
@Service("/managementScheduleDepartmentService")
public class ManagementScheduleDepartmentServiceImpl implements ManagementScheduleDepartmentService {

    private final ScheduleDepartmentMapper scheduleDepartmentMapper;
    private final DepartmentMapper departmentMapper;

    @Autowired
    public ManagementScheduleDepartmentServiceImpl(ScheduleDepartmentMapper scheduleDepartmentMapper, DepartmentMapper departmentMapper) {
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
        this.departmentMapper = departmentMapper;
    }

    @Override
    public Integer insertScheduleDepartment(Integer departmentId, String timeInterval, String scheduleTime, Integer totalNumber) {
        //判断是否有重复时段的相同科室排班
        if (getScheduleDepartmentByDepartmentIdAndScheduleTime(departmentId, scheduleTime) != null) {
            throw new InternetHospitalException(ExceptionConstants.SAME_SCHEDULE_DEPARTMENT);
        }
        ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
        scheduleDepartment.setDepartmentId(departmentId);
        scheduleDepartment.setScheduleTime(scheduleTime);
        scheduleDepartment.setCreateTime(new Date());
        scheduleDepartment.setUpdateTime(new Date());
        scheduleDepartment = setScheduleDepartmentTotalNumberByTimeInterval(scheduleDepartment, timeInterval, totalNumber);
        int i = scheduleDepartmentMapper.insertSelective(scheduleDepartment);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.INSERT_SCHEDULE_DEPARTMENT_FAIL);
        }
        return scheduleDepartment.getId();
    }

    @Override
    public void updateScheduleDepartment(Integer scheduleDepartmentId, String timeInterval, Integer totalNumber) {
        ScheduleDepartment scheduleDepartment = scheduleDepartmentMapper.selectByPrimaryKey(scheduleDepartmentId);
        if (scheduleDepartment == null){
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DEPARTMENT_NOT_EXIST);
        }
        scheduleDepartment.setUpdateTime(new Date());
        scheduleDepartmentMapper.updateByPrimaryKeySelective(
                setScheduleDepartmentTotalNumberByTimeInterval(scheduleDepartment, timeInterval, totalNumber)
        );
    }



    @Override
    public ScheduleDepartment getScheduleDepartmentByDepartmentIdAndScheduleTime(Integer departmentId, String scheduleTime) {
        Example example = new Example(ScheduleDepartment.class);
        example.createCriteria().andEqualTo("departmentId", departmentId)
                .andEqualTo("scheduleTime", scheduleTime);
        return scheduleDepartmentMapper.selectOneByExample(example);
    }

    @Override
    public void deleteScheduleDepartmentById(Integer scheduleDepartmentId) {
        int i = scheduleDepartmentMapper.deleteByPrimaryKey(scheduleDepartmentId);
        if (i != 1){
            throw new InternetHospitalException(ExceptionConstants.SCHEDULE_DEPARTMENT_NOT_EXIST);
        }
    }

    /**
     * 根据排班时段设置对应时段号源总数
     *
     * @param scheduleDepartment 科室排班
     * @param timeInterval       排班时段
     * @param totalNumber        号源数
     * @return
     */
    private ScheduleDepartment setScheduleDepartmentTotalNumberByTimeInterval(ScheduleDepartment scheduleDepartment,
                                                                              String timeInterval, Integer totalNumber) {
        switch (timeInterval) {
            case Constants.MORNING:
                scheduleDepartment.setMorningHas(Constants.ONE);
                scheduleDepartment.setMorningTotalNumber(totalNumber);
                break;
            case Constants.AFTERNOON:
                scheduleDepartment.setAfternoonHas(Constants.ONE);
                scheduleDepartment.setAfternoonTotalNumber(totalNumber);
                break;
            default:
                scheduleDepartment.setNightHas(Constants.NIGHT);
                scheduleDepartment.setNightTotalNumber(totalNumber);
                break;
        }
        return scheduleDepartment;
    }
}
