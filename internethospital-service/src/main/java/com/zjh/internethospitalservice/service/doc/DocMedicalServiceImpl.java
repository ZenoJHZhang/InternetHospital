package com.zjh.internethospitalservice.service.doc;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Medical;
import com.zjh.internethospitalapi.service.doc.DocMedicalService;
import com.zjh.internethospitalservice.mapper.MedicalMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

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
        PageHelper.startPage(pageNumber,pageSize);
        Example example = new Example(Medical.class);
        example.createCriteria().andEqualTo("isDelete",0);
        List<Medical> medicalList = medicalMapper.selectByExample(example);
        return new PageInfo<>(medicalList);
    }

    @Override
    public PageInfo<Medical> listMedicalByNameInPage(String medicalName, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Medical.class);
        example.createCriteria().andLike("name",medicalName).andEqualTo("isDelete",0);
        PageHelper.startPage(pageNumber,pageSize);
        List<Medical> medicalList = medicalMapper.selectByExample(example);
        return new PageInfo<>(medicalList);
    }
}
