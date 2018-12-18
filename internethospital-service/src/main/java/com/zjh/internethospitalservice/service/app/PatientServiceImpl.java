package com.zjh.internethospitalservice.service.app;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Patient;
import com.zjh.internethospitalapi.service.app.PatientService;
import com.zjh.internethospitalservice.mapper.PatientMapper;
import com.zjh.internethospitalservice.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 16:04
 */
@Service("patientService")
public class PatientServiceImpl implements PatientService {
    private final PatientMapper patientMapper;
    private final UserMapper userMapper;

    @Autowired
    public PatientServiceImpl(PatientMapper patientMapper, UserMapper userMapper) {
        this.patientMapper = patientMapper;
        this.userMapper = userMapper;
    }

    @Override
    public PageInfo<Patient> listPatient(Integer userId, Integer pageNo, Integer pageSize) {
        Patient patient = new Patient();
        patient.setUserId(userId);
        PageHelper.startPage(pageNo, pageSize);
        List<Patient> patientList = patientMapper.select(patient);
        return new PageInfo<>(patientList);
    }

    @Override
    public void insertPatient(Patient patient, Integer userId) {
        String idCard = patient.getIdCard();
        String birth = idCard.substring(6, 14);
        String sexString = idCard.substring(16, 17);
        Integer sex = Integer.valueOf(sexString) % 2;
        patient.setSex(sex);
        patient.setBirth(birth);
        patient.setUserId(userId);
        patient.setCreateTime(new Date());
        patient.setUpdateTime(new Date());
       patientMapper.insertSelective(patient);
    }

    @Override
    public boolean isSamePatient(Patient patient, Integer userId) {
        Example example = new Example(Patient.class);
        example.createCriteria().andEqualTo("userId", userId);
        example.and().orEqualTo("idCard", patient.getIdCard())
                .orEqualTo("phone", patient.getPhone());
        Patient patientSelected = patientMapper.selectOneByExample(example);
        return patientSelected != null;
    }

    @Override
    public void deletePatient(List<Patient> patientList) {
        int i = 0;
        for (Patient patient:patientList
             ) {
            i += patientMapper.delete(patient);
        }
        if (i !=  patientList.size()){
            throw new InternetHospitalException(ExceptionConstants.PATIENT_DELETE_FAIL);
        }
    }

    @Override
    public Patient selectPatientById(Integer id) {
        return patientMapper.selectByPrimaryKey(id);
    }
}
