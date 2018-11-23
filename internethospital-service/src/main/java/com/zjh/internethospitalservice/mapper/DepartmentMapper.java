package com.zjh.internethospitalservice.mapper;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.entity.Department;
import org.apache.ibatis.annotations.Select;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface DepartmentMapper extends Mapper<Department> {

    /**
     * 查找当日诊室信息及排班信息
     * @param date
     * @return
     */
    @Select("SELECT department.*,morning_has,afternoon_has,night_has,schedule_time,department_id,img.* " +
            "from `schedule_department`,department,img " +
            "where department_id = department.id and dept_type = 0 and schedule_time = #{date} and img_id = img.id")
    List<JSONObject> listDepartmentScheduleOfDay(String date);
}