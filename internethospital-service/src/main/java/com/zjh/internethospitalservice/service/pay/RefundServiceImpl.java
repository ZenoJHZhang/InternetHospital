package com.zjh.internethospitalservice.service.pay;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.entity.Refund;
import com.zjh.internethospitalapi.entity.RefundCorrelation;
import com.zjh.internethospitalapi.service.pay.RefundService;
import com.zjh.internethospitalservice.mapper.RefundCorrelationMapper;
import com.zjh.internethospitalservice.mapper.RefundMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

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
    private final RefundMapper refundMapper;

    @Autowired
    public RefundServiceImpl(RefundCorrelationMapper refundCorrelationMapper, RefundMapper refundMapper) {
        this.refundCorrelationMapper = refundCorrelationMapper;
        this.refundMapper = refundMapper;
    }

    @Override
    public RefundCorrelation getRefundCorrelationByOutTradeNo(String outTradeNo) {
        RefundCorrelation refundCorrelation = new RefundCorrelation();
        refundCorrelation.setOutTradeNo(outTradeNo);
        refundCorrelation.setIsDelete(0);
        return refundCorrelationMapper.selectOne(refundCorrelation);
    }

    @Override
    public void refuseRefund(Refund refund) {
        Example example = new Example(Refund.class);
        example.createCriteria().andEqualTo("userReservationUuId",refund.getUserReservationUuId());
        refund.setUpdateTime(new Date());
        refundMapper.updateByExampleSelective(refund,example);
    }

    @Override
    public void agreeRefund(Refund refund, RefundCorrelation refundCorrelation) {
        Example example = new Example(Refund.class);
        example.createCriteria().andEqualTo("userReservationUuId",refund.getUserReservationUuId());
        refund.setUpdateTime(new Date());
        refundCorrelation.setUpdateTime(new Date());
        refundCorrelation.setCreateTime(new Date());
        refundMapper.updateByExampleSelective(refund,example);
        refundCorrelationMapper.insertSelective(refundCorrelation);
    }

    @Override
    public PageInfo<Refund> listRefundByStatus(Integer status, Integer pageNo, Integer pageSize) {
        PageHelper.startPage(pageNo,pageSize);
        List<Refund> refundList = refundMapper.listRefundByStatus(status);
        return new PageInfo<>(refundList);
    }
}
