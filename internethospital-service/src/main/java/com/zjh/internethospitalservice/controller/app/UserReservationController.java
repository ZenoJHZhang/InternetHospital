package com.zjh.internethospitalservice.controller.app;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.service.app.PatientService;
import com.zjh.internethospitalapi.service.app.UserReservationService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.FileUtil;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/29 13:30
 */
@RestController
@RequestMapping("/userReservation")
@Api(tags = "用户就诊记录相关API")
public class UserReservationController {

    private final HttpServletRequest request;
    private final UserReservationService userReservationService;

    @Autowired
    public UserReservationController(HttpServletRequest request, PatientService patientService, UserReservationService userReservationService) {
        this.request = request;
        this.userReservationService = userReservationService;
    }

    @PostMapping("/insertUserReservationImg")
    @ApiOperation(value = "上传用户就诊图片描述")
    public ResponseEntity<ApiResponse> insertUserReservationImg(@RequestBody MultipartFile file) {
        return FileUtil.uploadFile(file, Constants.IMH_TYPE_USER_RESERVATION, "就诊信息图片描述");
    }

    @PostMapping("/deleteUserReservationImg")
    @ApiOperation(value = "删除用户就诊图片描述")
    public ResponseEntity<ApiResponse> deleteUserReservationImg(
            @ApiParam(required = true, value = "图片id") Integer id) throws Exception {
        return FileUtil.deleteFile(id);
    }

    @PostMapping("/insertUserReservation")
    @ApiOperation(value = "用户确认就诊，添加就诊信息")
    public ResponseEntity<ApiResponse> insertUserReservation(
            @RequestBody @ApiParam(value = "就诊信息",required = true) UserReservationDto userReservationDto) {
        String token = request.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        userReservationDto.setUserId(userId);
        if (userReservationDto.getType().equals(Constants.DEPARTMENT)){
            userReservationService.insertNormalUserReservation(userReservationDto);
        }
        else if(userReservationDto.getType().equals(Constants.EXPERT)){

        }
        return null;
    }
}
