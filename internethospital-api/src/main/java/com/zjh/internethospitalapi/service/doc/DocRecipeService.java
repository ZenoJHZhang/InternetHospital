package com.zjh.internethospitalapi.service.doc;

import com.zjh.internethospitalapi.entity.Medical;
import com.zjh.internethospitalapi.entity.Recipe;

import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/31 12:49
 */
public interface DocRecipeService {

    /**
     * 判断药品以及额外信息是否齐全
     * @param medicalList 处方包含药品列表
     * @return true 齐全
     */
    boolean initRecipeAndDetail(List<Medical> medicalList);

    /**
     * 新增处方并更新对应用户就诊信息
     * @param recipe 处方
     * @param recipeNumber 总处方详情数
     * @return 处方id
     */
    Integer insertRecipe(Recipe recipe,Integer recipeNumber);

    /**
     * 新增处方细节
     * 一个处方对应多个处方细节
     * 每个处方细节都是一种药的信息及用法
     * @param medicalList 处方包含药品列表
     * @param recipeId 处方id
     */
    void insertRecipeDetailList(List<Medical> medicalList, Integer recipeId);

    List<Medical> getRecipeDetailListByUserReservationUuid(String UserReservationUuid);
}
