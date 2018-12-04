package com.zjh.internethospitalservice.mapper;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalservice.mapper.sqlprovider.DepartmentMapperSqlProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DepartmentMapper extends Mapper<Department> {

    /**
     * 查找当日,该时段诊室信息及排班信息
     * @param scheduleTime
     * @param timeInterval
     * @return
     */
    @SelectProvider(type = DepartmentMapperSqlProvider.class,method = "listDepartmentScheduleOfDaySql")
    List<JSONObject> listDepartmentScheduleOfDay(@Param("scheduleTime") String scheduleTime, @Param("timeInterval") String timeInterval);
}