package com.zjh.internethospitalapi.entity;

import lombok.Data;

import java.util.Date;
import javax.persistence.*;

@Data
@Table(name = "doctor_department")
public class DoctorDepartment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "doctor_id")
    private Integer doctorId;

    @Column(name = "department_id")
    private Integer departmentId;

    /**
     * 医生在科室下的排序越大越靠前
     */
    @Column(name = "doctor_sort")
    private Integer doctorSort;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private Integer isDelete;

}