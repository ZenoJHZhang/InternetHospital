package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.entity.SeasonTime;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/18 10:43
 */
public interface SeasonTimeService {

    /**
     * 根据当前日期，获得对应时段的该医院的起始时刻
     * @param hospitalId
     * @param timeInterval
     * @return
     */
    JSONObject getSeasonTimeByHospitalOfTimeInterval(Integer hospitalId,String timeInterval);

}
