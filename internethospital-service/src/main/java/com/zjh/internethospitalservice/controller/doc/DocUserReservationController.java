package com.zjh.internethospitalservice.controller.doc;

import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.dto.UserReservationDto;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.app.UserService;
import com.zjh.internethospitalapi.service.doc.DocUserReservationService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.JWTUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/26 12:41
 */
@Api(tags = "【医疗模块】就诊信息API")
@RestController
@RequestMapping("/docUserReservation")
public class DocUserReservationController {

    private final DocUserReservationService docUserReservationService;
    private final HttpServletRequest httpRequest;
    private final UserService userService;

    @Autowired
    public DocUserReservationController(DocUserReservationService docUserReservationService, HttpServletRequest httpRequest, UserService userService) {
        this.docUserReservationService = docUserReservationService;
        this.httpRequest = httpRequest;
        this.userService = userService;
    }

    @ApiOperation(value = "获取相关医生的就诊信息")
    @PostMapping("/getUserReservationOfDoctor")
    @RequiresRoles(value = {"doctor", "superAdmin"}, logical = Logical.OR)
    public ResponseEntity<ApiResponse> getUserReservationOfDoctor(
            @ApiParam(value = "就诊状态",required = true,example = "1") @RequestParam  Integer status,
            @ApiParam(value = "就诊日期筛选开始时间") @RequestParam(required = false) String startScheduleTime,
            @ApiParam(value = "就诊日期筛选结束时间") @RequestParam(required = false) String endScheduleTime,
            @ApiParam(value = "患者姓名") @RequestParam(required = false) String patientName,
            @RequestParam @ApiParam(value = "页码", required = true, example = "1") Integer pageNumber,
            @RequestParam @ApiParam(value = "页容量", required = true, example = "5") Integer pageSize
            ){
        String token = httpRequest.getHeader("Authorization");
        Integer userId = JWTUtil.getUserId(token);
        Doctor doctor = userService.getDoctorByUserId(userId);
        PageInfo<UserReservation> userReservationByDoctorId = docUserReservationService.
                getUserReservationByDoctorId(doctor.getId(), status, startScheduleTime,
                endScheduleTime, patientName, pageNumber, pageSize);
        return ApiResponse.successResponse(userReservationByDoctorId);

    }
}
