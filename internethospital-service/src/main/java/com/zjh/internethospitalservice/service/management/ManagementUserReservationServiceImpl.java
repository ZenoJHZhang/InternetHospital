package com.zjh.internethospitalservice.service.management;

import com.zjh.internethospitalapi.entity.Recipe;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.doc.DocUserReservationService;
import com.zjh.internethospitalapi.service.management.ManagementUserReservationService;
import com.zjh.internethospitalservice.mapper.RecipeMapper;
import com.zjh.internethospitalservice.mapper.UserReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/4/14 12:16
 */
@Service("managementUserReservationService")
public class ManagementUserReservationServiceImpl implements ManagementUserReservationService {

    private final UserReservationMapper userReservationMapper;
    private final DocUserReservationService docUserReservationService;
    private final RecipeMapper recipeMapper;

    @Autowired
    public ManagementUserReservationServiceImpl(UserReservationMapper userReservationMapper,
                                                DocUserReservationService docUserReservationService,
                                                RecipeMapper recipeMapper) {
        this.userReservationMapper = userReservationMapper;
        this.docUserReservationService = docUserReservationService;
        this.recipeMapper = recipeMapper;
    }

    @Override
    public List<UserReservation> getUserReservationListByStatus(Integer userReservationStatus) {
        UserReservation userReservation = new UserReservation();
        userReservation.setStatus(userReservationStatus);
        userReservation.setIsDelete(0);
        return userReservationMapper.select(userReservation);
    }

    @Override
    public void auditUserReservation(String userReservationUuid, String auditStatus, String examineFailReason,Integer auditUserId) {
        UserReservation userReservation = docUserReservationService.getUserReservationByUuid(userReservationUuid);
        Recipe recipe = new Recipe();
        recipe.setUserReservationUuId(userReservationUuid);
        recipe.setIsDelete(0);
        recipe = recipeMapper.selectOne(recipe);
        //已审核状态
        userReservation.setIsAudit("1");
        //审核结果
        userReservation.setAuditStatus(auditStatus);
        if (auditStatus.equals("1")){
            userReservation.setExamineFailReason(examineFailReason);
            //审方未通过状态
            userReservation.setStatus(16);
            recipe.setAuditUserId(auditUserId);
            recipe.setStatus(2);
            recipe.setReason(examineFailReason);
        }
        else {
            //审方通过状态
            userReservation.setStatus(14);
            recipe.setAuditUserId(auditUserId);
            recipe.setStatus(1);
        }
        recipe.setUpdateTime(new Date());
        userReservation.setUpdateTime(new Date());
        userReservationMapper.updateByPrimaryKeySelective(userReservation);
        recipeMapper.updateByPrimaryKeySelective(recipe);
    }
}
