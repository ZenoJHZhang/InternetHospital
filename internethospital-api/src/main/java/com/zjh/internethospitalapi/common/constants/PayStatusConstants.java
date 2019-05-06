package com.zjh.internethospitalapi.common.constants;

/**
 * 支付宝api 支付状态解析常量类
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 14:27
 */
public class PayStatusConstants {
    //交易创建，等待买家付款
    public static final String WAIT_BUYER_PAY = "WAIT_BUYER_PAY";
    //未付款交易超时关闭，或支付完成后全额退款
    public static final String TRADE_CLOSED = "TRADE_CLOSED";
    //交易支付成功
    public static final String TRADE_SUCCESS = "TRADE_SUCCESS";
    //交易结束，不可退款
    public static final String TRADE_FINISHED = "TRADE_FINISHED";

    //等待支付
    public static Integer WAIT_PAY = 1;
    //支付成功
    public static Integer PAY_SUCCESS = 2;
    //申请退款中
    public static Integer WANT_REFUND = 3;
    //已退款
    public static Integer HAS_REFUND = 4;
    //拒绝退款
    public static Integer REFUSE_REFUND = 5;
    //支付已结束
    public static Integer PAY_FINISH = 6;
    //支付超时
    public static Integer PAY_TIMEOUT = 7;
    //未扫码
    public static Integer NOT_SWEEP_CODE = 8;

}
