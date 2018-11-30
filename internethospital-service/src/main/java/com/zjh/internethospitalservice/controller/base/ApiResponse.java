package com.zjh.internethospitalservice.controller.base;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Data;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;

import java.io.Serializable;

/**
 * @author 张江浩
 */
@Validated
@Data
public class ApiResponse implements Serializable {
    private static final long serialVersionUID = -8407728322598034531L;

    @JsonProperty("returnCode")
    private Integer returnCode = null;
    @JsonProperty("returnType")
    private String returnType = null;
    @JsonProperty("returnData")
    private Object returnData = null;

    private ApiResponse() {
        super();
    }

    public static ResponseEntity<ApiResponse> response(int returnCode, String returnMsg, Object returnData) {
        ApiResponse res = new ApiResponse();
        res.setReturnCode(returnCode);
        res.setReturnType(returnMsg);
        res.setReturnData(returnData);
        return new ResponseEntity<>(res, HttpStatus.valueOf(returnCode));
    }

    public static  ResponseEntity<ApiResponse> commonResponse(int returnCode, String returnMsg, Object returnData){
        ApiResponse res = new ApiResponse();
        res.setReturnCode(returnCode);
        res.setReturnType(returnMsg);
        res.setReturnData(returnData);
        return new ResponseEntity<>(res, HttpStatus.OK);
    }

    public static ResponseEntity<ApiResponse> successResponse(Object returnData) {
        return response(200, "success", returnData);
    }

    public static ResponseEntity<ApiResponse> failAuthentication(String returnMsg) {
        return response(401, returnMsg, null);
    }

    public static ResponseEntity<ApiResponse> errorResponse(String returnMsg,Object returnData){
        return commonResponse(400,returnMsg,null);
    }


}
