package com.zjh.internethospitalservice.controller.doc;

import com.zjh.internethospitalapi.entity.Diagnose;
import com.zjh.internethospitalapi.service.doc.DocDiagnoseService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/29 12:33
 */
@RestController
@RequestMapping("/docDiagnose")
@Api(tags = "【医疗模块】诊断相关API")
public class DocDiagnoseController {

private final DocDiagnoseService docDiagnoseService;

    public DocDiagnoseController(DocDiagnoseService docDiagnoseService) {
        this.docDiagnoseService = docDiagnoseService;
    }


    @ApiOperation(value = "新增诊断")
    @PostMapping("/insertDiagnose")
    public ResponseEntity<ApiResponse> insertDiagnose(
            @RequestBody @ApiParam(value = "诊断", required = true)Diagnose diagnose
    ) {
        Integer diagnoseId = docDiagnoseService.insertDiagnose(diagnose);
        return ApiResponse.successResponse(diagnoseId);
    }


    @ApiOperation(value = "根据用户就诊记录uuId获取对应诊断")
    @PostMapping("/getDiagnoseByUserReservationUuId")
    public ResponseEntity<ApiResponse> getDiagnoseByUserReservationUuId(
            @RequestParam @ApiParam(value = "用户就诊记录uuId", required = true)String userReservationUuid
    ) {
        Diagnose diagnose = docDiagnoseService.getDiagnoseByUserReservationId(userReservationUuid);
        return ApiResponse.successResponse(diagnose);
    }
}
