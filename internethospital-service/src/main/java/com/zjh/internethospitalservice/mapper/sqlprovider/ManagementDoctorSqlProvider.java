package com.zjh.internethospitalservice.mapper.sqlprovider;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/18 16:41
 */
public class ManagementDoctorSqlProvider {
    public static String listDoctorByNameOrNumberWithDepartmentId(
            @Param("doctorMessage") final String doctorMessage,
            @Param("departmentId") final Integer departmentId) {
        return new SQL() {{
            SELECT_DISTINCT("doctor.*");
            FROM("doctor_department,doctor");
            if (!departmentId.equals(0)) {
                WHERE(" doctor_department.department_id = #{departmentId}");
            }
            if (!doctorMessage.equals("")) {
                WHERE("doctor_name like \"%\"#{doctorMessage}\"%\"" +
                        "or doctor_number like \"%\"#{doctorMessage}\"%\"");

            }
            WHERE("doctor.id = doctor_department.doctor_id and doctor.is_delete = 0 and doctor_department.is_delete = 0");
        }}.toString();
    }
}