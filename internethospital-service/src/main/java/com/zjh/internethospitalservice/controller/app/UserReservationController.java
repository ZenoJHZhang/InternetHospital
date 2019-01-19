package com.zjh.internethospitalservice.controller.app;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.FileUtil;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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

    @PostMapping("/insertUserReservationImg")
    @ApiOperation(value = "上传用户就诊图片描述")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> insertUserReservationImg(@RequestBody MultipartFile file) {
        return FileUtil.uploadFile(file, Constants.IMH_TYPE_USER_RESERVATION, "就诊信息图片描述");
    }

    @PostMapping("/deleteUserReservationImg")
    @ApiOperation(value = "删除用户就诊图片描述")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> deleteUserReservationImg(
            @ApiParam(required = true, value = "图片id") Integer id) throws Exception {
        return FileUtil.deleteFile(id);
    }

    @PostMapping("/insertUserReservation")
    @ApiOperation(value = "用户确认就诊，添加就诊信息")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> insertUserReservation(
            @RequestBody @ApiParam(value = "就诊信息", required = true) UserReservationDto userReservationDto) {
        String token = request.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        userReservationDto.setUserId(userId);
        Integer userReservationId = null;
        if (userReservationDto.getType().equals(Constants.DEPARTMENT)) {
            userReservationId = userReservationService.insertNormalUserReservation(userReservationDto);
        } else if (userReservationDto.getType().equals(Constants.EXPERT)) {
            userReservationId = userReservationService.insertExpertUserReservation(userReservationDto);
        }
        String uuId = UUID.randomUUID().toString();
        UserReservation userReservation = new UserReservation();
        userReservation.setId(userReservationId);
        userReservation.setUuId(uuId);
        userReservationService.updateUserReservationSelective(userReservation);
        return ApiResponse.successResponse(uuId);
    }

    @GetMapping("/getUserReservationDetail")
    @ApiOperation(value = "获取就诊详情信息")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> getUserReservationDetail(
            @RequestParam @ApiParam(value = "就诊信息id", required = true, example = "1") Integer userReservationId) {
        UserReservation userReservationDetail = userReservationService.getUserReservationDetail(userReservationId);
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
            @RequestParam @ApiParam(value = "用户id", required = true, example = "1") Integer userReservationId) {

        UserReservation userReservation = new UserReservation();
        //已付款等待视频
        userReservation.setStatus(4);
        userReservation.setId(userReservationId);
        userReservationService.updateUserReservationSelective(userReservation);
        return ApiResponse.successResponse(null);
    }

    @GetMapping("/getUserReservationIdByUuid")
    @ApiOperation(value = "根据就诊uuid获取真正的用户就诊信息id")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> getUserReservationIdByUuid(
            @RequestParam @ApiParam(value = "提交申请时生成的uuid") String userReservationUuId) {
        UserReservation userReservation = userReservationService.getUserReservationByUuId(userReservationUuId);
        return ApiResponse.successResponse(userReservation.getId());
    }
}
