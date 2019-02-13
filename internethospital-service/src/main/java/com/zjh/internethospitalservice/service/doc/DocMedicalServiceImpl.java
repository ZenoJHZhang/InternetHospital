package com.zjh.internethospitalservice.service.doc;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Medical;
import com.zjh.internethospitalapi.service.doc.DocMedicalService;
import com.zjh.internethospitalservice.mapper.MedicalMapper;
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
 * @date: 2019/1/30 15:32
 */
@Service("docMedicalService")
public class DocMedicalServiceImpl implements DocMedicalService {

    private final MedicalMapper medicalMapper;

    @Autowired
    public DocMedicalServiceImpl(MedicalMapper medicalMapper) {
        this.medicalMapper = medicalMapper;
    }

    @Override
    public PageInfo<Medical> listAllMedicalInPage(Integer pageNumber, Integer pageSize) {
        PageHelper.startPage(pageNumber, pageSize);
        Example example = new Example(Medical.class);
        example.createCriteria().andEqualTo("isDelete", 0);
        List<Medical> medicalList = medicalMapper.selectByExample(example);
        return new PageInfo<>(medicalList);
    }

    @Override
    public PageInfo<Medical> listMedicalByNameInPage(String medicalName, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Medical.class);
        example.createCriteria().andLike("name", medicalName).andEqualTo("isDelete", 0);
        PageHelper.startPage(pageNumber, pageSize);
        List<Medical> medicalList = medicalMapper.selectByExample(example);
        return new PageInfo<>(medicalList);
    }

    @Override
    public boolean sameMedical(Medical medical) {
        String medicalName = medical.getName();
        String medicalOrigin = medical.getOrigin();
        Example example = new Example(Medical.class);
        example.createCriteria().andEqualTo("name", medicalName).
                andEqualTo("origin", medicalOrigin).andEqualTo("isDelete", 0);
        List<Medical> medicalList = medicalMapper.selectByExample(example);
        return medicalList.size() != 0;
    }

    @Override
    public Integer insertMedical(Medical medical) {
        Integer sameMedicalNumber;
        medical.setCreateTime(new Date());
        medical.setUpdateTime(new Date());
        medical.setIsDelete(0);
        boolean sameMedicalFlag = sameMedical(medical);
        if (sameMedicalFlag) {
            sameMedicalNumber = 1;
        } else {
            sameMedicalNumber = 0;
            int i = medicalMapper.insertSelective(medical);
            if (i != 1){
                throw new InternetHospitalException(ExceptionConstants.INSERT_MEDICAL_FAIL);
            }
        }
        return sameMedicalNumber;
    }

    @Override
    public void updateMedical(Medical medical) {
        boolean sameMedicalFlag = sameMedical(medical);
        if (sameMedicalFlag) {
            throw new InternetHospitalException(ExceptionConstants.SAME_MEDICAL);
        } else {
            medical.setUpdateTime(new Date());
            int i = medicalMapper.updateByPrimaryKeySelective(medical);
            if (i != 1){
                throw  new InternetHospitalException(ExceptionConstants.UPDATE_MEDICAL_FAIL);
            }
        }
    }

    @Override
    public void deleteMedical(Integer medicalId) {
        Example example = new Example(Medical.class);
        example.createCriteria().andEqualTo("isDelete",0).andEqualTo("id",medicalId);
        Medical medical = medicalMapper.selectOneByExample(example);
        if (medical  == null){
            throw new InternetHospitalException(ExceptionConstants.MEDICAL_NOT_EXIST);
        }
        else {
            medical.setIsDelete(1);
            int i = medicalMapper.updateByPrimaryKeySelective(medical);
            if (i != 1){
                throw  new InternetHospitalException(ExceptionConstants.DELETE_MEDICAL_FAIL);
            }
        }
    }
}
