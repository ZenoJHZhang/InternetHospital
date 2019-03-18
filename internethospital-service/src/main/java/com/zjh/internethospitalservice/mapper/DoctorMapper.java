package com.zjh.internethospitalservice.mapper;

import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalservice.mapper.sqlprovider.DepartmentMapperSqlProvider;
import com.zjh.internethospitalservice.mapper.sqlprovider.ManagementDoctorSqlProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DoctorMapper extends Mapper<Doctor> {

    @SelectProvider(type = ManagementDoctorSqlProvider.class,method = "listDoctorByNameOrNumberWithDepartmentId")
    @ResultType(value = Doctor.class)
    List<Doctor> listDoctorByNameOrNumberWithDepartmentId(@Param("doctorMessage") final String doctorMessage,
                                                          @Param("departmentId") final Integer departmentId);
}