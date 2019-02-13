package com.zjh.internethospitalapi.service.app;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Patient;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author 张江浩
 * @date 2018/11/29 16:01
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
    void insertPatient(Patient patient,Integer userId);

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
     * @param userId 用户id
     * @return
     */
    void deletePatient(List<Patient> patientList,Integer userId);

    /**
     * 根据id获取就诊人
     * @param id
     * @param userId
     * @return
     */
    Patient selectPatientById(Integer id,Integer userId);

    /**
     * 更新就诊人
     * @param patient 就诊人
     * @param userId 用户id
     */
    void updatePatient(Patient patient,Integer userId);

 /**
  * 判断病人是否存在
  * @param id 病人id
  * @param userId 用户id
  */
 void judgePatientExist(Integer id,Integer userId);

}
