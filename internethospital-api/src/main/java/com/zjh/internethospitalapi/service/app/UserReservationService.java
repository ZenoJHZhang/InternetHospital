package com.zjh.internethospitalapi.service.app;

import com.alibaba.fastjson.JSONObject;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import org.springframework.web.multipart.MultipartFile;

/**
 * 患者就诊记录
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:23
 */
public interface UserReservationService {
    Integer insertReservationImg(MultipartFile img);

    /**
     * 用户挂号，预约普通科室
     * @param userReservationDto
     * @return
     */
    JSONObject insertNormalUserReservation(UserReservationDto userReservationDto);
}
