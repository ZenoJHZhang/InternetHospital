package com.zjh.internethospitalservice.util;

import java.time.LocalDateTime;

/**
 * 年齡工具类
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/13 11:07
 */
public class AgeUtil {
    public static Integer getAgeFromBirth(String birth) {
        int yearNow = LocalDateTime.now().getYear();
        int monthNow = LocalDateTime.now().getMonthValue();
        int dayNow = LocalDateTime.now().getDayOfMonth();
        int yearPatient = Integer.parseInt(birth.substring(0, 4));
        int monthPatient = Integer.parseInt(birth.substring(4, 6));
        int dayPatient = Integer.parseInt(birth.substring(6));
        Integer age = yearNow - yearPatient;
        if (monthNow <= monthPatient) {
            if (monthNow == monthPatient) {
                if (dayNow < dayPatient) {
                    age--;
                }
            } else {
                age--;
            }
        }
        return age;
    }
}
