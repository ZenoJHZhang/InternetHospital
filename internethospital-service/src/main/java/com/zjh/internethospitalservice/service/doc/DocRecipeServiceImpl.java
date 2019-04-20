package com.zjh.internethospitalservice.service.doc;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Medical;
import com.zjh.internethospitalapi.entity.Recipe;
import com.zjh.internethospitalapi.entity.RecipeDetail;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.doc.DocRecipeService;
import com.zjh.internethospitalservice.mapper.MedicalMapper;
import com.zjh.internethospitalservice.mapper.RecipeDetailMapper;
import com.zjh.internethospitalservice.mapper.RecipeMapper;
import com.zjh.internethospitalservice.mapper.UserReservationMapper;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.math.BigDecimal;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/31 13:45
 */
@Service("docRecipeService")
public class DocRecipeServiceImpl implements DocRecipeService {

    private final RecipeMapper recipeMapper;
    private final RecipeDetailMapper recipeDetailMapper;
    private final MedicalMapper medicalMapper;
    private final UserReservationMapper userReservationMapper;

    @Autowired
    public DocRecipeServiceImpl(RecipeMapper recipeMapper, RecipeDetailMapper recipeDetailMapper, MedicalMapper medicalMapper, UserReservationMapper userReservationMapper) {
        this.recipeMapper = recipeMapper;
        this.recipeDetailMapper = recipeDetailMapper;
        this.medicalMapper = medicalMapper;
        this.userReservationMapper = userReservationMapper;
    }

    @Override
    public boolean initRecipeAndDetail(List<Medical> medicalList) {
        for (Medical medical : medicalList
        ) {
            if (medical.getAmount().equals("") || medical.getDay().equals("") ||
                    medical.getDosage().equals("") || medical.getDosageUnit().equals("") ||
                    medical.getMethod().equals("") || medical.getTimes().equals("")) {
                return false;
            }
        }
        return true;
    }

    @Override
    public Integer insertRecipe(Recipe recipe,Integer recipeNumber) {
        Example example = new Example(Recipe.class);
        example.createCriteria().andEqualTo("userReservationUuId",recipe.getUserReservationUuId());
        if(recipeMapper.selectOneByExample(example) != null){
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_HAS_RECIPE);
        }
        //recipe更新
        recipe.setCreateTime(new Date());
        recipe.setUpdateTime(new Date());
        recipeMapper.insertSelective(recipe);

        UserReservation userReservation = new UserReservation();
        userReservation.setUuId(recipe.getUserReservationUuId());
        userReservation.setIsDelete(0);
        userReservation = userReservationMapper.selectOne(userReservation);
        //根据处方更新用户就诊信息 recipeNumber  recipePrice totalPrice
        BigDecimal clinicPrice = new BigDecimal(userReservation.getClinicPrice());
        BigDecimal recipePrice = new BigDecimal(recipe.getPrice());
        BigDecimal totalPrice = clinicPrice.add(recipePrice);
        userReservation.setRecipePrice(recipePrice.toString());
        userReservation.setTotalPrice(totalPrice.toString());
        userReservation.setRecipeNumber(recipeNumber);
        userReservation.setUpdateTime(new Date());
        userReservationMapper.updateByPrimaryKeySelective(userReservation);

        return recipe.getId();
    }

    @Override
    public void insertRecipeDetailList(List<Medical> medicalList, Integer recipeId) {
        for (Medical medical:medicalList
             ) {
            RecipeDetail recipeDetail = new RecipeDetail();
            BeanUtils.copyProperties(medical,recipeDetail);
            recipeDetail.setId(null);
            recipeDetail.setRecipeId(recipeId);
            recipeDetail.setMedicalId(medical.getId());
            recipeDetail.setIsDelete(0);
            recipeDetail.setCreateTime(new Date());
            recipeDetail.setUpdateTime(new Date());
            recipeDetailMapper.insertSelective(recipeDetail);
        }
    }

    @Override
    public List<Medical> getRecipeDetailListByUserReservationUuid(String userReservationUuid) {
        List<Medical> medicalList = new LinkedList<>();
        Recipe recipe = new Recipe();
        recipe.setUserReservationUuId(userReservationUuid);
        recipe = recipeMapper.selectOne(recipe);
        if(recipe != null){
            RecipeDetail recipeDetail = new RecipeDetail();
            recipeDetail.setRecipeId(recipe.getId());
            List<RecipeDetail> recipeDetailList = recipeDetailMapper.select(recipeDetail);
            for (RecipeDetail detail:recipeDetailList
            ) {
                Medical medical = new Medical();
                medical.setId(detail.getMedicalId());
                medical = medicalMapper.selectByPrimaryKey(medical);
                BeanUtils.copyProperties(detail,medical);
                medical.setId(detail.getMedicalId());
                medical.setDosageDetail(detail.getDosage()+detail.getDosageUnit());
                medicalList.add(medical);
            }
            return medicalList;
        }
     else {
         return null;
        }
    }
}
