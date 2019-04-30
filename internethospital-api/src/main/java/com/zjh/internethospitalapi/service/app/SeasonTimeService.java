package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.entity.SeasonTime;

import java.text.ParseException;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/18 10:43
 */
public interface SeasonTimeService {

    /**
     * 根据当前日期，获得对应令时，早晚起始时刻
     * @param date 挂号日期
     * @param timeInterval 时段
     * @return
     */
    JSONObject getSeasonTimeByTimeInterval(String date,String timeInterval);

}
