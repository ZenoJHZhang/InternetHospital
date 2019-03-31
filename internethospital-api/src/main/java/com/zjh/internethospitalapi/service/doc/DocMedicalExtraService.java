package com.zjh.internethospitalapi.service.doc;

import com.zjh.internethospitalapi.entity.MedicalMethod;
import com.zjh.internethospitalapi.entity.MedicalTimes;

import java.util.List;

/**
 * 药品额外使用信息
 * 服用方式 频率等
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/29 17:22
 */
public interface DocMedicalExtraService {

    List<MedicalTimes> listMedicalTimes();

    List<MedicalMethod> listMedicalMethod();
}
