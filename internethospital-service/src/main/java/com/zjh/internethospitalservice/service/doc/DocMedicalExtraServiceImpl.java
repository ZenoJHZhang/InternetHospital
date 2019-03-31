package com.zjh.internethospitalservice.service.doc;

import com.zjh.internethospitalapi.entity.MedicalMethod;
import com.zjh.internethospitalapi.entity.MedicalTimes;
import com.zjh.internethospitalapi.service.doc.DocMedicalExtraService;
import com.zjh.internethospitalservice.mapper.MedicalMethodMapper;
import com.zjh.internethospitalservice.mapper.MedicalTimesMapper;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/29 17:24
 */
@Service("docMedicalExtraService")
public class DocMedicalExtraServiceImpl implements DocMedicalExtraService {

    private final MedicalMethodMapper medicalMethodMapper;
    private final MedicalTimesMapper medicalTimesMapper;

    public DocMedicalExtraServiceImpl(MedicalMethodMapper medicalMethodMapper, MedicalTimesMapper medicalTimesMapper) {
        this.medicalMethodMapper = medicalMethodMapper;
        this.medicalTimesMapper = medicalTimesMapper;
    }

    @Override
    public List<MedicalTimes> listMedicalTimes() {
        return medicalTimesMapper.selectAll();
    }

    @Override
    public List<MedicalMethod> listMedicalMethod() {
        return medicalMethodMapper.selectAll();
    }
}
