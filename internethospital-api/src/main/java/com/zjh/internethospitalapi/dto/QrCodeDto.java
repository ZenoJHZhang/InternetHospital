package com.zjh.internethospitalapi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 12:13
 */
@Data
@AllArgsConstructor
public class QrCodeDto {
    /**
     * 二维码地址
     */
    private String qrCode;
    /**
     * 商户外部订单号
     */
    private String outTradeNo;
    /**
     * 用户就诊uuId
     */
    private String userReservationUuId;
    /**
     * 订单支付状态
     */
    private Integer payStatus;
}
