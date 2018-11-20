package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Notify {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 医院id
     */
    @Column(name = "hospital_id")
    private String hospitalId;

    /**
     * 用户id
     */
    @Column(name = "user_id")
    private String userId;

    /**
     * 通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态
     */
    private String type;

    /**
     * 通知内容
     */
    private String content;

    /**
     * 通知数据，如排班消息的医生id，医院动态的地址等
     */
    @Column(name = "content_data")
    private String contentData;

    /**
     * 状态0未查看。1已查看  
     */
    private String status;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    /**
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取医院id
     *
     * @return hospital_id - 医院id
     */
    public String getHospitalId() {
        return hospitalId;
    }

    /**
     * 设置医院id
     *
     * @param hospitalId 医院id
     */
    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * 获取用户id
     *
     * @return user_id - 用户id
     */
    public String getUserId() {
        return userId;
    }

    /**
     * 设置用户id
     *
     * @param userId 用户id
     */
    public void setUserId(String userId) {
        this.userId = userId;
    }

    /**
     * 获取通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态
     *
     * @return type - 通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态
     */
    public String getType() {
        return type;
    }

    /**
     * 设置通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态
     *
     * @param type 通知类型 1咨询消息。2处方消息。3叫号消息。4排班消息。5快速问诊。6医院动态
     */
    public void setType(String type) {
        this.type = type;
    }

    /**
     * 获取通知内容
     *
     * @return content - 通知内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置通知内容
     *
     * @param content 通知内容
     */
    public void setContent(String content) {
        this.content = content;
    }

    /**
     * 获取通知数据，如排班消息的医生id，医院动态的地址等
     *
     * @return content_data - 通知数据，如排班消息的医生id，医院动态的地址等
     */
    public String getContentData() {
        return contentData;
    }

    /**
     * 设置通知数据，如排班消息的医生id，医院动态的地址等
     *
     * @param contentData 通知数据，如排班消息的医生id，医院动态的地址等
     */
    public void setContentData(String contentData) {
        this.contentData = contentData;
    }

    /**
     * 获取状态0未查看。1已查看  
     *
     * @return status - 状态0未查看。1已查看  
     */
    public String getStatus() {
        return status;
    }

    /**
     * 设置状态0未查看。1已查看  
     *
     * @param status 状态0未查看。1已查看  
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * @return update_time
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * @param updateTime
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}