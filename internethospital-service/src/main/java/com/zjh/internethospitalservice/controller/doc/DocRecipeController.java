package com.zjh.internethospitalservice.controller.doc;

import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.Medical;
import com.zjh.internethospitalapi.entity.Recipe;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalapi.service.doc.DocRecipeService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.List;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/31 12:48
 */
@RestController
@RequestMapping("/docRecipe")
@Api(tags = "【医疗模块】处方相关API")
public class DocRecipeController {

    private final HttpServletRequest httpRequest;
    private final UserService userService;
    private final DocRecipeService docRecipeService;

    @Autowired
    public DocRecipeController(HttpServletRequest httpRequest, UserService userService, DocRecipeService docRecipeService) {
        this.httpRequest = httpRequest;
        this.userService = userService;
        this.docRecipeService = docRecipeService;
    }


    @ApiOperation(value = "新增处方")
    @PostMapping("/insertRecipe")
    public ResponseEntity<ApiResponse> insertRecipe(
            @RequestBody @ApiParam(value = "处方药品及额外信息", required = true) List<Medical> medicalList) {
        //判断数据是否完全
        boolean flag = docRecipeService.initRecipeAndDetail(medicalList);

        if (!flag) {
            return ApiResponse.response(400,"数据不全", null);
        } else {
            //init recipe
            String token = httpRequest.getHeader("Authorization");
            Integer userId = JWTUtil.getUserId(token);
            Doctor doctor = userService.getDoctorByUserId(userId);
            Recipe recipe = new Recipe();
            recipe.setDoctorId(doctor.getId());
            String userReservationUuid = medicalList.get(0).getUserReservationUuid();
            recipe.setUserReservationUuId(userReservationUuid);
            BigDecimal totalPrice = new BigDecimal(0.00);
            totalPrice = totalPrice.setScale(2);
            for (Medical medical : medicalList
            ) {
                BigDecimal price = new BigDecimal(medical.getPrice());
                BigDecimal amount = new BigDecimal(medical.getAmount());
                totalPrice = totalPrice.add(price.setScale(2).multiply(amount));
            }
            recipe.setPrice(totalPrice.toString());
            Integer recipeId = docRecipeService.insertRecipe(recipe,medicalList.size());
            docRecipeService.insertRecipeDetailList(medicalList, recipeId);
            return ApiResponse.successResponse(null);
        }
    }

    @ApiOperation(value = "根据用户就诊uuid获取已有处方")
    @PostMapping("/getRecipeDetailListByUserReservationUuid")
    public ResponseEntity<ApiResponse> getRecipeDetailListByUserReservationUuid(
            @RequestParam @ApiParam(value = "用户就诊记录uuId", required = true) String userReservationUuid) {
        return ApiResponse.successResponse(docRecipeService.getRecipeDetailListByUserReservationUuid(userReservationUuid));
    }
}
