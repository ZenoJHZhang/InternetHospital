package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

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

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * @return doctor_id
     */
    public Integer getDoctorId() {
        return doctorId;
    }

    /**
     * @param doctorId
     */
    public void setDoctorId(Integer doctorId) {
        this.doctorId = doctorId;
    }

    /**
     * @return department_id
     */
    public Integer getDepartmentId() {
        return departmentId;
    }

    /**
     * @param departmentId
     */
    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    /**
     * 获取医生在科室下的排序越大越靠前
     *
     * @return doctor_sort - 医生在科室下的排序越大越靠前
     */
    public Integer getDoctorSort() {
        return doctorSort;
    }

    /**
     * 设置医生在科室下的排序越大越靠前
     *
     * @param doctorSort 医生在科室下的排序越大越靠前
     */
    public void setDoctorSort(Integer doctorSort) {
        this.doctorSort = doctorSort;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return update_time
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}