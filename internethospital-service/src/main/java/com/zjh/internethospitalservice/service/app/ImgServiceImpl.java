package com.zjh.internethospitalservice.service.app;

import com.zjh.internethospitalapi.common.Constants;
import com.zjh.internethospitalapi.entity.Img;
import com.zjh.internethospitalapi.service.app.ImgService;
import com.zjh.internethospitalservice.mapper.ImgMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import java.util.Date;
import java.util.List;

/**
 * 类的说明
 *
 * @version 1.00
 * @author: 张江浩
 * @date: 2018/12/6 16:34
 */
@Service("imgService")
public class ImgServiceImpl implements ImgService {

    private final ImgMapper imgMapper;

    @Autowired
    public ImgServiceImpl(ImgMapper imgMapper) {
        this.imgMapper = imgMapper;
    }

    @Override
    public List<Img> listIndexCarousel() {
        Example example = new Example(Img.class);
        example.createCriteria().andEqualTo("type",Constants.IMG_TYPE_INDEX);
        List<Img> imgList = imgMapper.selectByExample(example);
        for (Img img:imgList
             ) {
            StringBuilder path = new StringBuilder();
            path.append(Constants.IMG_DOWNLOAD_BASE_URL).append(img.getType()).append("/")
                    .append(img.getImgUuid()).append(".").append(img.getSuffix());
            img.setPath(path.toString());
        }
        return imgList;
    }

    @Override
    public Integer insertIndexCarousel(Img img) {
        img.setCreateTime(new Date());
        img.setUpdateTime(new Date());
        return imgMapper.insert(img);
    }
}

