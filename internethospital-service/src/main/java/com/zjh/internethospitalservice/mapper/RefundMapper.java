package com.zjh.internethospitalservice.mapper;

import com.zjh.internethospitalapi.entity.Refund;
import com.zjh.internethospitalservice.mapper.sqlprovider.RefundSqlProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.ResultType;
import org.apache.ibatis.annotations.SelectProvider;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface RefundMapper extends Mapper<Refund> {


    @ResultType(Refund.class)
    @SelectProvider(type = RefundSqlProvider.class,method = "listRefundByStatus")
    List<Refund> listRefundByStatus(@Param("status") Integer status);
}