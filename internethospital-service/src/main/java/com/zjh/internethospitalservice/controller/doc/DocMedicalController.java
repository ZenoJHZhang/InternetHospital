package com.zjh.internethospitalservice.controller.doc;

import com.zjh.internethospitalapi.entity.Medical;
import com.zjh.internethospitalapi.service.doc.DocMedicalExtraService;
import com.zjh.internethospitalapi.service.doc.DocMedicalService;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import com.zjh.internethospitalservice.util.VerifiableList;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/30 16:03
 */
@RestController
@RequestMapping("/docMedical")
@Api(tags = "【医疗模块】药品相关API")
public class DocMedicalController {
    private final DocMedicalService docMedicalService;
    private final DocMedicalExtraService docMedicalExtraService;

    @Autowired
    public DocMedicalController(DocMedicalService docMedicalService, DocMedicalExtraService docMedicalExtraService) {
        this.docMedicalService = docMedicalService;
        this.docMedicalExtraService = docMedicalExtraService;
    }

    @ApiOperation(value = "分页获取药品信息")
    @PostMapping("/listAllMedicalInPage")
    public ResponseEntity<ApiResponse> listAllMedicalInPage(
            @RequestParam @ApiParam(value = "页码", required = true, example = "1") Integer pageNumber,
            @RequestParam @ApiParam(value = "页容量", required = true, example = "8") Integer pageSize
    ) {
        return ApiResponse.successResponse(docMedicalService.listAllMedicalInPage(pageNumber, pageSize));
    }

    @ApiOperation(value = "根据药品名模糊分页获取药品信息")
    @GetMapping("/listMedicalByNameInPage")
    public ResponseEntity<ApiResponse> listMedicalByNameInPage(
            @RequestParam @ApiParam(value = "药品名", required = true) String medicalName,
            @RequestParam @ApiParam(value = "页码", required = true, example = "1") Integer pageNumber,
            @RequestParam @ApiParam(value = "页容量", required = true, example = "8") Integer pageSize
    ) {
        return ApiResponse.successResponse
                (docMedicalService.listMedicalByNameInPage(medicalName, pageNumber, pageSize));
    }

    @ApiOperation(value = "批量添加药品")
    @PostMapping("/insertMedicalList")
    public ResponseEntity<ApiResponse> insertMedicalList(
            @ApiParam(value = "药品列表", required = true) @Valid @RequestBody VerifiableList<Medical> medicalList
    ) {
        Integer sameMedicalNumber = 0;
        for (Medical medical : medicalList
        ) {
            Integer i = docMedicalService.insertMedical(medical);
            sameMedicalNumber = sameMedicalNumber + i;
        }
        return ApiResponse.successResponse(sameMedicalNumber);
    }

    @ApiOperation(value = "更新药品")
    @PostMapping("/updateMedical")
    public ResponseEntity<ApiResponse> updateMedical(@ApiParam(value = "药品", required = true) @RequestParam Medical medical) {
        docMedicalService.updateMedical(medical);
        return ApiResponse.successResponse(null);
    }

    @ApiOperation(value = "批量删除药品")
    @PostMapping("/deleteMedicalList")
    public ResponseEntity<ApiResponse> deleteMedicalList(
            @ApiParam(value = "药品id列表", required = true) @RequestParam List<Integer> medicalIdList) {
        for (Integer id : medicalIdList
        ) {
            docMedicalService.deleteMedical(id);
        }
        return ApiResponse.successResponse(null);
    }

    @ApiOperation(value = "获取所有药品服用频次")
    @PostMapping("/listMedicalTimes")
    public ResponseEntity<ApiResponse> listMedicalTimes(
    ) {
        return ApiResponse.successResponse(docMedicalExtraService.listMedicalTimes());
    }

    @ApiOperation(value = "获取所有药品服用方式")
    @PostMapping("/listMedicalMethod")
    public ResponseEntity<ApiResponse> listMedicalMethod(
    ) {
        return ApiResponse.successResponse(docMedicalExtraService.listMedicalMethod());
    }
}
