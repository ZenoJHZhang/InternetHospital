package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.service.management.ManagementDoctorDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/2 15:36
 */
@Service("managementScheduleDepartmentService")
public class ManagementScheduleDepartmentServiceImpl implements ManagementScheduleDepartmentService {

    private ScheduleDepartmentMapper scheduleDepartmentMapper;
    private ManagementDoctorDepartmentService managementDoctorDepartmentService;

    @Autowired
    public ManagementScheduleDepartmentServiceImpl(ManagementDoctorDepartmentService managementDoctorDepartmentService,
                                                   ScheduleDepartmentMapper scheduleDepartmentMapper) {
        this.managementDoctorDepartmentService = managementDoctorDepartmentService;
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
    }

    @Override
    public void insertScheduleDepartment(Integer departmentId,String departmentName, String timeInterval, Integer totalNumber, String scheduleTime) {
        ScheduleDepartment scheduleDepartment = new ScheduleDepartment();
        scheduleDepartment.setDepartmentId(departmentId);
        if (timeInterval.equals(Constants.MORNING)) {
            scheduleDepartment.setMorningHas("1");
        } else if (timeInterval.equals(Constants.AFTERNOON)) {

        } else {

        }
    }
}
