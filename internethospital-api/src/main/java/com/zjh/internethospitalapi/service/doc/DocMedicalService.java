package com.zjh.internethospitalapi.service.doc;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Medical;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/30 15:27
 */
public interface DocMedicalService {

    /**
     * 分页获取所有药品信息
     * @param pageNumber 页码
     * @param pageSize 页容量
     * @return 药品信息
     */
    PageInfo<Medical> listAllMedicalInPage(Integer pageNumber,Integer pageSize);

    /**
     * 通过药品名分页模糊获取药品信息
     * @param medicalName 药品名
     * @param pageNumber 页码
     * @param pageSize 页容量
     * @return 药品信息
     */
    PageInfo<Medical> listMedicalByNameInPage(String medicalName,Integer pageNumber,Integer pageSize);

}
