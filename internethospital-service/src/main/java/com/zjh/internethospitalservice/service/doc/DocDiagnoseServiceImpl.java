package com.zjh.internethospitalservice.service.doc;

import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Diagnose;
import com.zjh.internethospitalapi.entity.UserReservation;
import com.zjh.internethospitalapi.service.doc.DocDiagnoseService;
import com.zjh.internethospitalservice.mapper.DiagnoseMapper;
import com.zjh.internethospitalservice.mapper.UserReservationMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;

/**
 * 类的说明
 *
 * @author 张江浩
 * @version 1.00
 * @date 2019/3/29 12:14
 */
@Service("/docDiagnoseService")
public class DocDiagnoseServiceImpl implements DocDiagnoseService {

    private final DiagnoseMapper diagnoseMapper;
    private final UserReservationMapper userReservationMapper;

    @Autowired
    public DocDiagnoseServiceImpl(DiagnoseMapper diagnoseMapper, UserReservationMapper userReservationMapper) {
        this.diagnoseMapper = diagnoseMapper;
        this.userReservationMapper = userReservationMapper;
    }

    @Override
    public Integer insertDiagnose(Diagnose diagnose) {
        Example example = new Example(UserReservation.class);
        example.createCriteria().andEqualTo("uuId", diagnose.getUserReservationUuId());
        if (userReservationMapper.selectOneByExample(example) == null) {
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_NOT_EXIST);
        }
        //防止一个就诊记录重复添加诊断
        if(getDiagnoseByUserReservationId(diagnose.getUserReservationUuId()) != null){
            throw new InternetHospitalException(ExceptionConstants.USER_RESERVATION_HAS_DIAGNOSE);
        }

        diagnose.setCreateTime(new Date());
        diagnose.setUpdateTime(new Date());
        diagnoseMapper.insertSelective(diagnose);
        return diagnose.getId();

    }

    @Override
    public void deleteDiagnose(Integer diagnoseId) {
        Diagnose diagnose = new Diagnose();
        diagnose.setId(diagnoseId);
        diagnose.setIsDelete(1);
        int i = diagnoseMapper.updateByPrimaryKeySelective(diagnose);
        if (i != 1) {
            throw new InternetHospitalException(ExceptionConstants.DIAGNOSE_NOT_EXIST);
        }
    }

    @Override
    public Diagnose getDiagnoseByUserReservationId(String uuId) {
        Example example = new Example(Diagnose.class);
        example.createCriteria().andEqualTo("userReservationUuId", uuId)
                .andEqualTo("isDelete", 0);
        return diagnoseMapper.selectOneByExample(example);
    }
}
