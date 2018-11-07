package com.zjh.internethospitalservice.controller.base;

import com.fasterxml.jackson.annotation.JsonProperty;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.annotation.Validated;
import java.io.Serializable;
import java.util.Objects;

/**
 * 返回体
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/6 15:49
 */
@Validated
public class ApiResponse implements Serializable {
    public ApiResponse() {
        super();
    }

    public static ResponseEntity<ApiResponse> response(int returnCode, String returnMsg, Object returnData) {
        ApiResponse res = new ApiResponse();
        res.setCode(returnCode);
        res.setType(returnMsg);
        res.setData(returnData);
        return new ResponseEntity<ApiResponse>(res, HttpStatus.OK);
    }

    public static ResponseEntity<ApiResponse> successResponse(Object returnData) {
        return response(200, "success", returnData);
    }

    public static ResponseEntity<ApiResponse> errorResponse(String returnMsg) {
        return response(400, returnMsg, null);
    }

    @JsonProperty("code")
    private Integer code = null;

    @JsonProperty("type")
    private String type = null;

    @JsonProperty("data")
    private Object data = null;

    public ApiResponse(Integer code, String type, Object data) {
        this.code = code;
        this.type = type;
        this.data = data;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        ApiResponse _apiResponse = (ApiResponse) o;
        return Objects.equals(this.code, _apiResponse.code) &&
                Objects.equals(this.type, _apiResponse.type) &&
                Objects.equals(this.data, _apiResponse.data);
    }

    @Override
    public int hashCode() {
        return Objects.hash(code, type, data);
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("class ModelApiResponse {\n");

        sb.append("    code: ").append(toIndentedString(code)).append("\n");
        sb.append("    type: ").append(toIndentedString(type)).append("\n");
        sb.append("    data: ").append(toIndentedString(data)).append("\n");
        sb.append("}");
        return sb.toString();
    }

    /**
     * Convert the given object to string with each line indented by 4 spaces
     * (except the first line).
     */
    private String toIndentedString(Object o) {
        if (o == null) {
            return "null";
        }
        return o.toString().replace("\n", "\n    ");
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
