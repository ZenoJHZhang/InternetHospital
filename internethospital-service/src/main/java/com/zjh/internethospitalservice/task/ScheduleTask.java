package com.zjh.internethospitalservice.task;

import com.zjh.internethospitalapi.service.management.ManagementScheduleDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementScheduleDoctorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

/**
 * 排班类定时任务
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/30 09:47
 */
@Component
public class ScheduleTask {

    private final ManagementScheduleDepartmentService managementScheduleDepartmentService;
    private final ManagementScheduleDoctorService managementScheduleDoctorService;

    @Autowired
    public ScheduleTask(ManagementScheduleDepartmentService managementScheduleDepartmentService,
                        ManagementScheduleDoctorService managementScheduleDoctorService) {
        this.managementScheduleDepartmentService = managementScheduleDepartmentService;
        this.managementScheduleDoctorService = managementScheduleDoctorService;
    }

    /**
     * 每天0点自动使排班进入执行状态，避免被删除
     */
    @Scheduled(cron = "0 0 0 * * ? ")
    @Transactional(rollbackFor = Exception.class)
    void makeScheduleStart() {
        managementScheduleDepartmentService.setScheduleDepartmentStart();
        managementScheduleDoctorService.setScheduleDoctorStart();
    }

    /**
     * 每天23点自动使排班进入结束状态
     */
    @Scheduled(cron = "0 0 23 * * ?  ")
    @Transactional(rollbackFor = Exception.class)
    void makeScheduleEnd() {
        managementScheduleDepartmentService.setScheduleDepartmentEnd();
        managementScheduleDoctorService.setScheduleDoctorEnd();
    }

}
