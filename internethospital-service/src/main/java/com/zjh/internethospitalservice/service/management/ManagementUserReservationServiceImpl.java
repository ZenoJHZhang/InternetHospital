package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Recipe;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.doc.DocUserReservationService;
import com.zjh.internethospitalapi.service.management.ManagementUserReservationService;
import com.zjh.internethospitalservice.mapper.RecipeMapper;
import com.zjh.internethospitalservice.mapper.UserReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.*;

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
    public PageInfo<UserReservation> getUserReservationListByAuditStatus(Integer auditStatus, Integer pageNo,
                                                                         Integer pageSize) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("isDelete",0);
        if (!auditStatus.equals(-1)){
            //未审核
            if (auditStatus.equals(0)){
                example.and().andEqualTo("status",13);
                example.and().andEqualTo("isAudit",0);
            }
            //审核通过
            if (auditStatus.equals(1)){
                example.and().andEqualTo("isAudit",1)
                        .andEqualTo("auditStatus",2)
                        .andEqualTo("status",14);

            }
            //审核不通过
            if (auditStatus.equals(2)){
                example.and().andEqualTo("isAudit",1)
                        .andEqualTo("auditStatus",1)
                        .andEqualTo("status",16);
            }
        }
        else {
            List<Integer> list = new LinkedList<>();
            list.add(13);
            list.add(14);
            list.add(16);
            list.add(17);
            list.add(18);
            list.add(19);
            example.and().andIn("status",list);
        }
        PageHelper.startPage(pageNo,pageSize);
        List<UserReservation> userReservationList = userReservationMapper.selectByExample(example);
        return new PageInfo<>(userReservationList);
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
            userReservation.setAuditStatus(auditStatus);
            recipe.setAuditUserId(auditUserId);
            recipe.setStatus(2);
            recipe.setReason(examineFailReason);
        }
        else {
            //审方通过状态
            userReservation.setStatus(14);
            userReservation.setAuditStatus(auditStatus);
            recipe.setAuditUserId(auditUserId);
            recipe.setStatus(1);
        }
        recipe.setUpdateTime(new Date());
        userReservation.setUpdateTime(new Date());
        userReservationMapper.updateByPrimaryKeySelective(userReservation);
        recipeMapper.updateByPrimaryKeySelective(recipe);
    }
}
