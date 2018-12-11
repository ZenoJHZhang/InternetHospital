package com.zjh.internethospitalservice.service.app;

import com.zjh.internethospitalapi.entity.Patient;
import com.zjh.internethospitalapi.service.app.PatientService;
import com.zjh.internethospitalservice.mapper.PatientMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

    @Autowired
    public PatientServiceImpl(PatientMapper patientMapper) {
        this.patientMapper = patientMapper;
    }

    @Override
    public List<Patient> listPatient(Integer userId) {
        return null;
    }

    @Override
    public Integer insertPatient(Patient patient) {
        return patientMapper.insertSelective(patient);
    }
}
