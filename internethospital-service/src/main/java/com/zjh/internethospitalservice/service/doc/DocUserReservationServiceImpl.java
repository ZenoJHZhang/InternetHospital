package com.zjh.internethospitalservice.service.doc;

import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.doc.DocUserReservationService;
import com.zjh.internethospitalservice.mapper.UserReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/2/14 10:36
 */
public class DocUserReservationServiceImpl implements DocUserReservationService {

    private final UserReservationMapper userReservationMapper;

    @Autowired
    public DocUserReservationServiceImpl(UserReservationMapper userReservationMapper) {
        this.userReservationMapper = userReservationMapper;
    }

    @Override
    public void beginOrFinishClinic(String uuId, Integer flag) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId",uuId);
        UserReservation userReservation = userReservationMapper.selectOneByExample(example);
        if (userReservation == null){
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        if (flag.equals(0)){
            userReservation.setStartTime(new Date());
            //就诊中
            userReservation.setStatus(11);
            userReservation.setUpdateTime(new Date());
        }
        else if(flag.equals(1)){
            userReservation.setFinishTime(new Date());
            //就诊完成
            userReservation.setStatus(16);
            userReservation.setUpdateTime(new Date());
        }
    }
}
