package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

@Table(name = "season_time")
public class SeasonTime {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 医院ID
     */
    @Column(name = "hospital_id")
    private String hospitalId;

    /**
     * 名称
     */
    private String name;

    /**
     * 开始日期
     */
    @Column(name = "start_date")
    private String startDate;

    /**
     * 结束日期
     */
    @Column(name = "end_date")
    private String endDate;

    /**
     * 早上开始时间
     */
    @Column(name = "sw_start")
    private String swStart;

    /**
     * 早上结束时间
     */
    @Column(name = "sw_end")
    private String swEnd;

    /**
     * 下午开始时间
     */
    @Column(name = "xw_start")
    private String xwStart;

    /**
     * 下午结束时间
     */
    @Column(name = "xw_end")
    private String xwEnd;

    /**
     * 晚上开始时间
     */
    @Column(name = "ws_start")
    private String wsStart;

    /**
     * 晚上结束时间
     */
    @Column(name = "ws_end")
    private String wsEnd;

    /**
     * 夜班开始
     */
    @Column(name = "yb_start")
    private String ybStart;

    /**
     * 夜班结束
     */
    @Column(name = "yb_end")
    private String ybEnd;

    /**
     * 1:未删除 0：删除
     */
    @Column(name = "is_delete")
    private String isDelete;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    private String tmp1;

    private String tmp2;

    private String tmp3;

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
     * 获取医院ID
     *
     * @return hospital_id - 医院ID
     */
    public String getHospitalId() {
        return hospitalId;
    }

    /**
     * 设置医院ID
     *
     * @param hospitalId 医院ID
     */
    public void setHospitalId(String hospitalId) {
        this.hospitalId = hospitalId;
    }

    /**
     * 获取名称
     *
     * @return name - 名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置名称
     *
     * @param name 名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取开始日期
     *
     * @return start_date - 开始日期
     */
    public String getStartDate() {
        return startDate;
    }

    /**
     * 设置开始日期
     *
     * @param startDate 开始日期
     */
    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    /**
     * 获取结束日期
     *
     * @return end_date - 结束日期
     */
    public String getEndDate() {
        return endDate;
    }

    /**
     * 设置结束日期
     *
     * @param endDate 结束日期
     */
    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    /**
     * 获取早上开始时间
     *
     * @return sw_start - 早上开始时间
     */
    public String getSwStart() {
        return swStart;
    }

    /**
     * 设置早上开始时间
     *
     * @param swStart 早上开始时间
     */
    public void setSwStart(String swStart) {
        this.swStart = swStart;
    }

    /**
     * 获取早上结束时间
     *
     * @return sw_end - 早上结束时间
     */
    public String getSwEnd() {
        return swEnd;
    }

    /**
     * 设置早上结束时间
     *
     * @param swEnd 早上结束时间
     */
    public void setSwEnd(String swEnd) {
        this.swEnd = swEnd;
    }

    /**
     * 获取下午开始时间
     *
     * @return xw_start - 下午开始时间
     */
    public String getXwStart() {
        return xwStart;
    }

    /**
     * 设置下午开始时间
     *
     * @param xwStart 下午开始时间
     */
    public void setXwStart(String xwStart) {
        this.xwStart = xwStart;
    }

    /**
     * 获取下午结束时间
     *
     * @return xw_end - 下午结束时间
     */
    public String getXwEnd() {
        return xwEnd;
    }

    /**
     * 设置下午结束时间
     *
     * @param xwEnd 下午结束时间
     */
    public void setXwEnd(String xwEnd) {
        this.xwEnd = xwEnd;
    }

    /**
     * 获取晚上开始时间
     *
     * @return ws_start - 晚上开始时间
     */
    public String getWsStart() {
        return wsStart;
    }

    /**
     * 设置晚上开始时间
     *
     * @param wsStart 晚上开始时间
     */
    public void setWsStart(String wsStart) {
        this.wsStart = wsStart;
    }

    /**
     * 获取晚上结束时间
     *
     * @return ws_end - 晚上结束时间
     */
    public String getWsEnd() {
        return wsEnd;
    }

    /**
     * 设置晚上结束时间
     *
     * @param wsEnd 晚上结束时间
     */
    public void setWsEnd(String wsEnd) {
        this.wsEnd = wsEnd;
    }

    /**
     * 获取夜班开始
     *
     * @return yb_start - 夜班开始
     */
    public String getYbStart() {
        return ybStart;
    }

    /**
     * 设置夜班开始
     *
     * @param ybStart 夜班开始
     */
    public void setYbStart(String ybStart) {
        this.ybStart = ybStart;
    }

    /**
     * 获取夜班结束
     *
     * @return yb_end - 夜班结束
     */
    public String getYbEnd() {
        return ybEnd;
    }

    /**
     * 设置夜班结束
     *
     * @param ybEnd 夜班结束
     */
    public void setYbEnd(String ybEnd) {
        this.ybEnd = ybEnd;
    }

    /**
     * 获取1:未删除 0：删除
     *
     * @return is_delete - 1:未删除 0：删除
     */
    public String getIsDelete() {
        return isDelete;
    }

    /**
     * 设置1:未删除 0：删除
     *
     * @param isDelete 1:未删除 0：删除
     */
    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
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

    /**
     * @return tmp1
     */
    public String getTmp1() {
        return tmp1;
    }

    /**
     * @param tmp1
     */
    public void setTmp1(String tmp1) {
        this.tmp1 = tmp1;
    }

    /**
     * @return tmp2
     */
    public String getTmp2() {
        return tmp2;
    }

    /**
     * @param tmp2
     */
    public void setTmp2(String tmp2) {
        this.tmp2 = tmp2;
    }

    /**
     * @return tmp3
     */
    public String getTmp3() {
        return tmp3;
    }

    /**
     * @param tmp3
     */
    public void setTmp3(String tmp3) {
        this.tmp3 = tmp3;
    }
}