package com.zjh.internethospitalapi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 分配医生 DTO
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/18 09:55
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class DispensingDoctorDto {
    private Integer doctorId;
    private String doctorName;
    private Integer scheduleDoctorId;
    /**
     * 医生此时段已挂号源数
     */
    private Integer doctorAppointmentNumber;
    /**
     * 医生此时段总号源数
     */
    private Integer doctorTotalAppointmentNumber;
    /**
     * 时段
     */
    private String timeInterval;

}
