package com.zjh.internethospitalservice.util;

import com.github.qcloudsms.SmsSingleSender;
import com.github.qcloudsms.SmsSingleSenderResult;
import com.github.qcloudsms.httpclient.HTTPException;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.constants.ShortMessageConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import lombok.extern.slf4j.Slf4j;
import org.json.JSONException;

import java.io.IOException;

/**
 * 腾讯云发送短信工具
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/8 16:44
 */
@Slf4j
public class ShortMessageUtil {
    private final static int callNoTemplateId = 323326;

    /**
     * 单发短信
     * @param params 模板参数
     * @param phone 接收者手机号
     * @param templateId 模板id
     */
    private static void sendShortMessage(String[] params,String phone,int templateId){
        try {
            SmsSingleSender smsSingleSender = new SmsSingleSender(ShortMessageConstants.APP_ID,
                    ShortMessageConstants.APP_KEY);
            SmsSingleSenderResult result = smsSingleSender.sendWithParam("86",phone,
                    templateId, params,
                    ShortMessageConstants.SMS_SIGN, "", "");
            System.out.println(result);
        } catch (HTTPException | JSONException | IOException e) {
            // HTTP响应码错误
            log.error(e.getMessage());
            throw new InternetHospitalException(ExceptionConstants.SEND_SHORT_MESSAGE_FAIL);
        }
    }

    /**
     * 患者到号提醒
     */
    public static void callNoMessage
    (String patientName,String day,String timeInterval,String departmentName,String doctorName,String regNo,String phone){
        String[] params=  new String[6];
        params[0] = patientName;
        params[1] = day;
        params[2] = timeInterval;
        params[3] = departmentName;
        params[4] = doctorName;
        params[5] = regNo;
        sendShortMessage(params,phone,callNoTemplateId);
    }

    public static void main(String[] args) {
        callNoMessage("张江浩","2019-04-30","8:00-12:00",
                "专家科室1","小明","1","15868154079");
    }

}
