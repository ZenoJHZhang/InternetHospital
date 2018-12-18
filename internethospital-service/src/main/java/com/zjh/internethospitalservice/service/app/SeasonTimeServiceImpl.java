package com.zjh.internethospitalservice.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.SeasonTime;
import com.zjh.internethospitalapi.service.app.SeasonTimeService;
import com.zjh.internethospitalservice.mapper.SeasonTimeMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.time.LocalDate;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/18 10:53
 */
@Service("seasonTimeService")
@Slf4j
public class SeasonTimeServiceImpl implements SeasonTimeService {
    private final SeasonTimeMapper seasonTimeMapper;

    @Autowired
    public SeasonTimeServiceImpl(SeasonTimeMapper seasonTimeMapper) {
        this.seasonTimeMapper = seasonTimeMapper;
    }

    @Override
    public JSONObject getSeasonTimeByHospitalOfTimeInterval(Integer hospitalId, String timeInterval){
        LocalDate dateNow = LocalDate.now();
        LocalDate startDate;
        LocalDate endDate;
        JSONObject object = new JSONObject();
        String start;
        String end;
        Example example = new Example(SeasonTime.class);
        example.createCriteria().andEqualTo("hospitalId", hospitalId);
        List<SeasonTime> seasonTimeList = seasonTimeMapper.selectByExample(example);
        //判断出来的夏令时或冬令时时间
        SeasonTime realSeasonTime = null;
        for (SeasonTime seasonTime : seasonTimeList
                ) {
            Integer type = seasonTime.getType();
            if (type == 1) {
                startDate = LocalDate.parse((LocalDate.now().getYear()) + "-" + seasonTime.getStartDate());
                endDate =  LocalDate.parse((LocalDate.now().getYear()+1) + "-" + seasonTime.getEndDate());
                 if(dateNow.isAfter(startDate) && dateNow.isBefore(endDate)){
                     realSeasonTime = seasonTime;
                 }
            }
            else{
                startDate = LocalDate.parse((LocalDate.now().getYear()) + "-" + seasonTime.getStartDate());
                endDate =  LocalDate.parse((LocalDate.now().getYear()) + "-" + seasonTime.getEndDate());
                if(dateNow.isAfter(startDate) && dateNow.isBefore(endDate)){
                    realSeasonTime = seasonTime;
                }
            }
        }
        if (realSeasonTime != null){
            if (timeInterval.equals(Constants.MORNING)){
                start = realSeasonTime.getMorningStart();
                end = realSeasonTime.getMorningEnd();
            }
            else if(timeInterval.equals(Constants.AFTERNOON)){
                start = realSeasonTime.getAfternoonStart();
                end = realSeasonTime.getAfternoonEnd();
            }
            else {
                start = realSeasonTime.getNightStart();
                end = realSeasonTime.getNightEnd();
            }
        }
        else {
            log.error("令时获取失败");
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_INSERT_FAIL);
        }
        object.put("start",start);
        object.put("end",end);
        return object;
    }
}
