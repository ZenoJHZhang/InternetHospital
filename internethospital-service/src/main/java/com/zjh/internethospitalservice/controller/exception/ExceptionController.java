package com.zjh.internethospitalservice.controller.exception;

import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalservice.controller.base.ApiResponse;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authz.AuthorizationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author 张江浩
 * @Description 异常处理
 * @Date 2018-12-13
 * @Time 17:09
 */
@RestControllerAdvice
@Slf4j
public class ExceptionController {

    private final HttpServletRequest request;

    @Autowired
    public ExceptionController(HttpServletRequest request) {
        this.request = request;
    }

    /**
     * 捕获权限不够异常
     *
     * @return
     */
    @ExceptionHandler(AuthorizationException.class)
    public ResponseEntity<ApiResponse> handle401() {
        String token = request.getHeader("Authorization");
        if (token == null){
            return ApiResponse.failAuthentication();
        }
        else {
            return ApiResponse.failAuthorization();
        }
    }

    @ExceptionHandler(InternetHospitalException.class)
    public ResponseEntity<ApiResponse> handleInstantiationException(InternetHospitalException e){
        log.error(e.getMessage(),e);
        return ApiResponse.response(400,e.getMessage(),null);
    }

    @ExceptionHandler(Exception.class)
    public ResponseEntity<ApiResponse> globalException(HttpServletRequest request, Throwable ex){
        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
        log.error(ex.getMessage(),ex);
        if (statusCode == null){
            return ApiResponse.response(500,"服务器错误",null);
        }
        return ApiResponse.response(statusCode,"服务器错误",null);
    }

}
