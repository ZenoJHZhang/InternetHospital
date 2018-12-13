package com.zjh.internethospitalapi.service.app;

import com.github.pagehelper.PageInfo;
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
     * @param pageNo
     * @param pageSize
     * @return
     */
   PageInfo<Patient> listPatient(Integer userId,Integer pageNo,Integer pageSize);

    /**
     * 新增就诊人
     * @param patient
     * @param userId 用户id
     * @return
     */
    Integer insertPatient(Patient patient,Integer userId);

    /**
     * 判断该用户是否已添加了相同的就诊人
     * @param patient
     * @param userId
     * @return
     */
    boolean isSamePatient(Patient patient,Integer userId);

    /**
     * 删除就诊人
     * @param patientList
     * @return
     */
    Integer deletePatient(List<Patient> patientList);
}
