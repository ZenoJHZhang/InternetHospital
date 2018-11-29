package com.zjh.internethospitalapi.service.app;

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
}
