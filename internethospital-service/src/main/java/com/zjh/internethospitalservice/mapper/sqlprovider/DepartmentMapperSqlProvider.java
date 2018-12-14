package com.zjh.internethospitalservice.mapper.sqlprovider;

import com.zjh.internethospitalapi.common.constants.Constants;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/4 16:14
 */
public class DepartmentMapperSqlProvider {
    public static String listDepartmentScheduleOfDaySql( @Param("timeInterval") final String timeInterval) {
        return new SQL() {{
            SELECT("department.*," +
                    "schedule_department.id as schedule_department_id,schedule_time,department_id," +
                    "img.img_uuid,img.suffix,img.type");
            FROM("schedule_department,department,img");
            if (timeInterval.equals(Constants.MORNING)) {
                WHERE("morning_has = 1");
            }
            if (timeInterval.equals(Constants.AFTERNOON)) {
                WHERE("afternoon_has = 1");
            }
            if (timeInterval.equals(Constants.NIGHT)) {
                WHERE("night_has =1");
            }
            WHERE("department_id = department.id and dept_type = 0 " +
                    "and schedule_time = #{scheduleTime} and img_id = img.id and morning_has = 1");
        }}.toString();
    }
}
