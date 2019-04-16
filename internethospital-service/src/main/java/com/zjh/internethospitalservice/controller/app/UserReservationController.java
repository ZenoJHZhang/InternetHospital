package com.zjh.internethospitalservice.controller.app;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.UUID;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:30
 */
@RestController
@RequestMapping("/userReservation")
@Api(tags = "【用户模块】用户就诊记录相关API")
public class UserReservationController {

    private final HttpServletRequest request;
    private final UserReservationService userReservationService;
    private final RedisTemplate<String, String> redisTemplate;

    @Autowired
    public UserReservationController(HttpServletRequest request,
                                     UserReservationService userReservationService,
                                     RedisTemplate<String, String> redisTemplate) {
        this.request = request;
        this.userReservationService = userReservationService;
        this.redisTemplate = redisTemplate;
    }



    @PostMapping("/insertUserReservation")
    @ApiOperation(value = "用户确认就诊，添加就诊信息")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> insertUserReservation(
            @RequestBody @ApiParam(value = "就诊信息", required = true) UserReservationDto userReservationDto) {
        String token = request.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        userReservationDto.setUserId(userId);
        String uuId = UUID.randomUUID().toString();
        userReservationDto.setUuId(uuId);
        if (userReservationDto.getType().equals(Constants.DEPARTMENT)) {
             userReservationService.insertNormalUserReservation(userReservationDto);
        } else if (userReservationDto.getType().equals(Constants.EXPERT)) {
            userReservationService.insertExpertUserReservation(userReservationDto);
        }
        return ApiResponse.successResponse(uuId);
    }

    @GetMapping("/getUserReservationDetail")
    @ApiOperation(value = "获取就诊详情信息")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> getUserReservationDetail(
            @RequestParam @ApiParam(value = "就诊信息id", required = true, example = "1") String userReservationUUId) {
        UserReservation userReservationDetail = userReservationService.getUserReservationDetail(userReservationUUId);
        return ApiResponse.successResponse(userReservationDetail);
    }

    @GetMapping("/listUserReservation")
    @ApiOperation(value = "获取用户就诊列表")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> listUserReservationOfUser(
            @RequestParam @ApiParam(value = "页码", required = true, example = "1") Integer pageNo,
            @RequestParam @ApiParam(value = "页容量", required = true, example = "5") Integer pageSize
    ) {
        String token = request.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        PageInfo<UserReservation> userReservationPageInfo = userReservationService.listUserReservationOfUserInPage(userId, pageNo, pageSize);
        return ApiResponse.successResponse(userReservationPageInfo);
    }


    @PostMapping("/payUserReservationClinic")
    @ApiOperation(value = "更新就诊挂号费支付状态")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> payUserReservationClinic(
            @RequestParam @ApiParam(value = "用户id", required = true, example = "1") String userReservationUUId) {

        UserReservation userReservation = new UserReservation();
        //已付款等待视频
        userReservation.setStatus(4);
        //挂号费支付状态修改
        userReservation.setClinicPayStatus("1");
        userReservation.setUuId(userReservationUUId);
        userReservationService.updateUserReservationSelective(userReservation);
        return ApiResponse.successResponse(null);
    }

    @GetMapping("/getUserReservationIdByUuid")
    @ApiOperation(value = "根据就诊uuid获取真正的用户就诊信息id")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> getUserReservationIdByUuid(
            @RequestParam @ApiParam(value = "提交申请时生成的uuid",required = true) String userReservationUuId) {
        UserReservation userReservation = userReservationService.getUserReservationByUuId(userReservationUuId);
        return ApiResponse.successResponse(userReservation.getId());
    }

    @PostMapping("/getAllDetailByUuId")
    @ApiOperation(value = "通过uuid获取用户就诊信息，处方信息，药方信息，相关医生信息，相关科室信息")
    @RequiresRoles(value = {"doctorAdmin", "superAdmin","user","doctor"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> getAllDetailByUuId(
            @RequestParam @ApiParam(value = "提交申请时生成的uuid",required = true) String userReservationUuId) {
        String token = request.getHeader("Authorization");
        Integer roleId = JWTUtil.getRoleId(token);
        boolean adminFlag;
        assert roleId != null;
        adminFlag = !roleId.equals(1);
        UserReservation userReservation = userReservationService.getAllDetailByUuId(userReservationUuId,adminFlag);
        return ApiResponse.successResponse(userReservation);
    }
}
