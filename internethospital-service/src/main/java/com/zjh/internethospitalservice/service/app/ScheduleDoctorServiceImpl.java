package com.zjh.internethospitalservice.service.app;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.Constants;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Doctor;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.entity.ScheduleDoctor;
import com.zjh.internethospitalapi.service.app.ScheduleDoctorService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.DoctorMapper;
import com.zjh.internethospitalservice.mapper.ImgMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDoctorMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/11/26 09:33
 */
@Service("/scheduleDoctorService")
public class ScheduleDoctorServiceImpl implements ScheduleDoctorService {
    @Autowired
    private ScheduleDoctorMapper scheduleDoctorMapper;
    @Autowired
    private DoctorMapper doctorMapper;
    @Autowired
    private ImgMapper imgMapper;
    @Autowired
    private DepartmentMapper departmentMapper;
    @Override
    public PageInfo<ScheduleDoctor> listExpertDoctor(String departmentName, String scheduleTime, String timeInterval, Integer pageSize, Integer pageNo) {
        /**
         * 标志现在选择的是哪个时段
         */
        Integer timeIntervalIndex = 0;
        /**
         * 特定时刻所剩号源
         */
        Integer timeIntervalNumber = 0;
        Example example = new Example(ScheduleDoctor.class);
        example.createCriteria().andEqualTo("departmentName",departmentName).andEqualTo("scheduleTime",scheduleTime);
        if ((Constants.MORNING).equals(timeInterval)){
            example.and().andEqualTo("doctorMorningHas",1);
            timeIntervalIndex = 1;
        }
        if((Constants.AFTERNOON).equals(timeInterval)){
            example.and().andEqualTo("doctorAfternoonHas",1);
            timeIntervalIndex = 2;
        }
        if((Constants.NIGHT).equals(timeInterval)){
            example.and().andEqualTo("doctorNightHas",1);
            timeIntervalIndex = 3;
        }
        PageHelper.startPage(pageNo,pageSize);
        List<ScheduleDoctor> scheduleDoctorList = scheduleDoctorMapper.selectByExample(example);
        for (int i = 0; i < scheduleDoctorList.size(); i++) {
            ScheduleDoctor scheduleDoctor = scheduleDoctorList.get(i);
            Doctor doctor = doctorMapper.selectByPrimaryKey(scheduleDoctor.getDoctorId());
            Department department = departmentMapper.selectByPrimaryKey(scheduleDoctor.getDepartmentId());
            StringBuilder imgPath = new StringBuilder();
            Img img = imgMapper.selectByPrimaryKey(doctor.getImgId());
            imgPath.append(img.getImgUuid()).append(".").append(img.getSuffix());
            doctor.setImgPath(imgPath.toString());
            if (timeIntervalIndex == 1){
                timeIntervalNumber = scheduleDoctor.getDoctorMorningTotalNumber() - scheduleDoctor.getDoctorMorningNumber();
            }
            else if (timeIntervalIndex == 2){
                timeIntervalNumber = scheduleDoctor.getDoctorAfternoonTotalNumber() - scheduleDoctor.getDoctorAfternoonNumber();
            }
            else if (timeIntervalIndex == 3){
                timeIntervalNumber = scheduleDoctor.getDoctorNightTotalNumber() - scheduleDoctor.getDoctorNightNumber();
            }
            scheduleDoctor.setDoctor(doctor);
            scheduleDoctor.setDepartment(department);
            scheduleDoctor.setTimeIntervalNumber(timeIntervalNumber);
        }
        PageInfo<ScheduleDoctor> pageInfo = new PageInfo<>(scheduleDoctorList);
        return pageInfo;
    }
}
