package com.zjh.internethospitalservice.controller.img;

import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.service.img.ImgService;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalapi.service.management.ManagementDoctorService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.FileUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/5 16:20
 */
@RestController
@RequestMapping("/img")
@Api(tags = "【图片模块】图片操作API")
public class ImgController {

    private final ImgService imgService;
    private final ManagementDepartmentService managementDepartmentService;
    private final ManagementDoctorService managementDoctorService;

    @Autowired
    public ImgController(ImgService imgService, ManagementDepartmentService managementDepartmentService, ManagementDoctorService managementDoctorService) {
        this.imgService = imgService;
        this.managementDepartmentService = managementDepartmentService;
        this.managementDoctorService = managementDoctorService;
    }

    @GetMapping("/listIndexCarousel")
    @ApiOperation(value = "获得首页轮播图")
    public ResponseEntity<ApiResponse> listIndexCarousel() {
        return ApiResponse.successResponse(imgService.listIndexCarousel());
    }

    @PostMapping("/insertIndexImg")
    @ApiOperation(value = "添加首页轮播图")
    public ResponseEntity<ApiResponse> insertIndexImg(@RequestParam(value = "file") MultipartFile file) {
        return FileUtil.uploadFile(file,Constants.IMG_TYPE_INDEX,"首页轮播图");
    }

    @GetMapping("/listNetTreatmentRoomCarousel")
    @ApiOperation(value = "获得网络诊室页面轮播图")
    public ResponseEntity<ApiResponse> listNetTreatmentRoomCarousel() {
        return ApiResponse.successResponse(imgService.listNetTreatmentRoomCarousel());
    }
    @ApiOperation(value = "获取用户就诊病情图片")
    @GetMapping(value = "/listUserReservationImg")
    @RequiresRoles(value = "user")
    public ResponseEntity<ApiResponse> listUserReservationImg(
            @ApiParam(value = "用户就诊信息uuId",required = true) @RequestParam String userReservationUuId){
        return ApiResponse.successResponse(imgService.listUserReservationImg(userReservationUuId));
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
            @ApiParam(required = true, value = "图片id",example = "1") @RequestParam Integer id) {
        return FileUtil.deleteFile(id);
    }

    @PostMapping("/insertDepartmentImg")
    @ApiOperation(value = "添加科室示例图")
    public ResponseEntity<ApiResponse> insertDepartmentImg(@RequestParam String imgStr
            ,@RequestParam Integer departmentId) throws IOException {
        Integer imgId = FileUtil.enCodingBase64(imgStr, Constants.IMG_TYPE_DEPARMENT, "科室示例图");
        managementDepartmentService.updateDepartmentImg(imgId,departmentId);
        return ApiResponse.successResponse(null);
    }

    @PostMapping("/insertDoctorImg")
    @ApiOperation(value = "添加医生头像")
    public ResponseEntity<ApiResponse> insertDoctorImg(@RequestParam String imgStr
            ,@RequestParam Integer doctorId) throws IOException {
        Integer imgId = FileUtil.enCodingBase64(imgStr, Constants.IMG_TYPE_DOCTOR, "医生头像");
        managementDoctorService.updateDoctorImg(doctorId,imgId);
        return ApiResponse.successResponse(null);
    }

}
