package com.zjh.internethospitalservice.mapper.sqlprovider;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.jdbc.SQL;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/8 14:25
 */
public class RefundSqlProvider {
    public static String listRefundByStatus(
            @Param("status") Integer status) {
        return new SQL() {{
            SELECT("refund.*,user_reservation_status.state_name  as refund_status_name,u.clinic_price");
            FROM("refund,user_reservation u,user_reservation_status ");
            WHERE("u.is_delete = 0 ");
            WHERE("refund.is_delete = 0");
            WHERE("u.uu_id = refund.user_reservation_uu_id");
            if (status.equals(-1)){
                WHERE("(u.`status` = 6 or u.`status`= 7 or u.`status` = 8 or u.`status`= 9)");
            }
            else {
                WHERE("u.`status` = #{status} ");
            }
            WHERE("user_reservation_status.id = u.`status`");
        }}.toString();
    }
}
