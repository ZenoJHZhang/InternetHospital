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
     *
     * @param pageNumber 页码
     * @param pageSize   页容量
     * @return 药品信息
     */
    PageInfo<Medical> listAllMedicalInPage(Integer pageNumber, Integer pageSize);

    /**
     * 通过药品名分页模糊获取药品信息
     *
     * @param medicalName 药品名
     * @param pageNumber  页码
     * @param pageSize    页容量
     * @return 药品信息
     */
    PageInfo<Medical> listMedicalByNameInPage(String medicalName, Integer pageNumber, Integer pageSize);

    /**
     * 判断是否为重复药品
     * 条件为 名字 和 产地 都相同
     *
     * @param medical 药品
     * @return true 重复   ； false 不重复
     */
    boolean sameMedical(Medical medical);

    /**
     * 添加药品
     *
     * @param medical 药品
     * @return 重复药品数量
     */
    Integer insertMedical(Medical medical);

    /**
     * 更新药品
     *
     * @param medical 药品
     */
    void updateMedical(Medical medical);

    /**
     * 删除药品
     * @param medicalId 药品id
     */
    void deleteMedical(Integer medicalId);
}
