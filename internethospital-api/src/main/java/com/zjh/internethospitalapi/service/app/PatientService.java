package com.zjh.internethospitalapi.service.app;

import com.zjh.internethospitalapi.entity.Patient;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 16:01
 */
public interface PatientService {
    /**
     * 获取该用户的所有就诊人列表
     * @param userId
     * @return
     */
    List<Patient> listPatient(Integer userId);
}
