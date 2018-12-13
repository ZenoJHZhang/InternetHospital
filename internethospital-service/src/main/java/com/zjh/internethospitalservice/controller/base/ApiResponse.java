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

    /**
     * 身份认证失败
     */
    public static final String FAIL_AUTHENTICATION = "40101";
    /**
     * 权限不够
     */
    public static final String FAIL_AUTHORIZATION = "40102";

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

    /**
     * 身份认证失败
     * token失效或过期
     * @return
     */
    public static ResponseEntity<ApiResponse> failAuthentication() {
        return response(401, "登录过期或失效，请重新登录！",FAIL_AUTHENTICATION );
    }

    /**
     * 权限不够
     * @return
     */
    public static ResponseEntity<ApiResponse> failAuthorization(){
        return response(401,"您的权限不足！",FAIL_AUTHORIZATION);
    }
    public static ResponseEntity<ApiResponse> errorResponse(String returnMsg,Object returnData){
        return commonResponse(400,returnMsg,returnData);
    }


}
