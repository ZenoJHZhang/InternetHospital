package com.zjh.internethospitalservice.service.pay;

import com.zjh.internethospitalapi.entity.RefundCorrelation;
import com.zjh.internethospitalapi.service.pay.RefundService;
import com.zjh.internethospitalservice.mapper.RefundCorrelationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/5/5 14:53
 */
@Service("refundService")
public class RefundServiceImpl implements RefundService {

    private final RefundCorrelationMapper refundCorrelationMapper;

    @Autowired
    public RefundServiceImpl(RefundCorrelationMapper refundCorrelationMapper) {
        this.refundCorrelationMapper = refundCorrelationMapper;
    }

    @Override
    public   RefundCorrelation getRefundCorrelationByOutTradeNo(String outTradeNo) {
        RefundCorrelation refundCorrelation = new RefundCorrelation();
        refundCorrelation.setOutTradeNo(outTradeNo);
        refundCorrelation.setIsDelete(0);
        return refundCorrelationMapper.selectOne(refundCorrelation);
    }
}
