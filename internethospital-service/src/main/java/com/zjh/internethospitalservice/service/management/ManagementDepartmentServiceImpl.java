package com.zjh.internethospitalservice.service.management;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.zjh.internethospitalapi.common.constants.Constants;
import com.zjh.internethospitalapi.common.constants.ExceptionConstants;
import com.zjh.internethospitalapi.common.exception.InternetHospitalException;
import com.zjh.internethospitalapi.entity.Department;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.entity.ScheduleDepartment;
import com.zjh.internethospitalapi.service.management.ManagementDepartmentService;
import com.zjh.internethospitalservice.mapper.DepartmentMapper;
import com.zjh.internethospitalservice.mapper.ImgMapper;
import com.zjh.internethospitalservice.mapper.ScheduleDepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2019/1/24 13:50
 */
@Service("managementDepartmentService")
public class ManagementDepartmentServiceImpl implements ManagementDepartmentService {

    private final DepartmentMapper departmentMapper;
    private final ImgMapper imgMapper;
    private final ScheduleDepartmentMapper scheduleDepartmentMapper;

    @Autowired
    public ManagementDepartmentServiceImpl(DepartmentMapper departmentMapper, ImgMapper imgMapper, ScheduleDepartmentMapper scheduleDepartmentMapper) {
        this.departmentMapper = departmentMapper;
        this.imgMapper = imgMapper;
        this.scheduleDepartmentMapper = scheduleDepartmentMapper;
    }

    @Override
    public PageInfo<Department> listAllDepartmentByType(Integer departmentType, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Department.class);
        if (departmentType != 2){
            example.createCriteria().andEqualTo("deptType",departmentType).andEqualTo("isDelete",0);
        }
        else {
            example.createCriteria().andEqualTo("isDelete",0);
        }
        PageHelper.startPage(pageNumber,pageSize);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        return new PageInfo<>(departmentList);
    }

    @Override
    public void insertDepartment(Department department) {
        int i = departmentMapper.insertSelective(department);
        if (i !=1){
            throw new InternetHospitalException(ExceptionConstants.INSERT_DEPARTMENT_FAIL);
        }
    }

    @Override
    public void updateDepartment(Department department) {
        //查找该科室下是否有未结束的科室排班
        Example example = new Example(ScheduleDepartment.class);
        example.createCriteria().andEqualTo("departmentId",department.getId()).
                andNotEqualTo("isStart",2).andEqualTo("isDelete",0);
        if(scheduleDepartmentMapper.selectByExample(example).size() != 0){
            throw new InternetHospitalException(ExceptionConstants.DEPARTMENT_HAS_STARTING_SCHEDULE);
        }
        if (isSameDepartment(department)){
            throw new InternetHospitalException(ExceptionConstants.SAME_DEPARTMENT);
        }
        int i = departmentMapper.updateByPrimaryKey(department);
        if (i != 1){
            throw new InternetHospitalException(ExceptionConstants.UPDATE_DEPARTMENT_FAIL);
        }
    }

    @Override
    public PageInfo<Department> listDepartmentByNameOrNumberWithDepartmentMessage
            (String departmentMessage,Integer departmentType, Integer pageNumber, Integer pageSize) {
        Example example = new Example(Department.class);
        example.createCriteria().andLike("departmentName","%"+departmentMessage+"%");
        example.or().andLike("departmentNumber","%"+departmentMessage+"%");
        example.and().andEqualTo("isDelete",0);
        if (departmentType != 2){
            example.and().andEqualTo("deptType",departmentType);
        }
        PageHelper.startPage(pageNumber,pageSize);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        for (Department department:departmentList
             ) {
            department.setImgPath(getDepartmentImgPath(department.getImgId()));
        }
        return new PageInfo<>(departmentList);
    }

    @Override
    public Department getDepartmentById(Integer departmentId) {
        Department department = departmentMapper.selectByPrimaryKey(departmentId);
        department.setImgPath(getDepartmentImgPath(department.getImgId()));
        return department;
    }

    private String getDepartmentImgPath(Integer imgId){
        Img img = imgMapper.selectByPrimaryKey(imgId);
        StringBuilder imgPath = new StringBuilder();
        imgPath
                .append(Constants.IMG_DOWNLOAD_BASE_URL).append(img.getType()).append("/").append(img.getImgUuid())
                .append(".").append(img.getSuffix());
        return imgPath.toString();
    }

    /**
     * 判断是否为重复的科室
     * 判断条件为 科室名和科室编号不能相同
     * @param department
     * @return true 重复 false 不重复
     */
    private boolean isSameDepartment(Department department){
        Example example = new Example(Department.class);
        example.createCriteria().andEqualTo("isDelete",0);
        List<Department> departmentList = departmentMapper.selectByExample(example);
        for (Department o:departmentList
             ) {
            if ((o.getDepartmentName().equals(department.getDepartmentName()) )
                    || (o.getDepartmentNumber().equals(department.getDepartmentNumber()))){
                return true;
            }
        }
        return false;
    }
}
