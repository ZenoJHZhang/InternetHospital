package com.zjh.internethospitalapi.dto;

import lombok.Data;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/22 16:33
 */
@Data
public class ScheduleDepartmentDto {
    String scheduleTime;

    String timeInterval;

    Integer totalNumber;

    Integer scheduleDepartmentId;
}
