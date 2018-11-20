package com.zjh.internethospitalapi.entity;

import java.util.Date;
import javax.persistence.*;

public class Hospital {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 医院名称
     */
    private String name;

    /**
     * 医院地址
     */
    private String address;

    /**
     * 医院邮编
     */
    private String postcode;

    /**
     * 医院电话
     */
    private String tel;

    /**
     * 医院邮件
     */
    private String email;

    /**
     * 备案号
     */
    @Column(name = "records_code")
    private String recordsCode;

    /**
     * 制作方
     */
    private String producers;

    /**
     * 版权方
     */
    private String copyright;

    /**
     * 故障电话
     */
    @Column(name = "fault_tel")
    private String faultTel;

    /**
     * 医院缩略图
     */
    private String picture;

    /**
     * 医院logo
     */
    private String logo;

    /**
     * 底部logo
     */
    @Column(name = "foot_logo")
    private String footLogo;

    /**
     * app二维码
     */
    @Column(name = "app_code")
    private String appCode;

    /**
     * 公众号二维码
     */
    @Column(name = "gzh_code")
    private String gzhCode;

    /**
     * 服务号二维码
     */
    @Column(name = "fwh_code")
    private String fwhCode;

    /**
     * 服务窗二维码
     */
    @Column(name = "fwc_code")
    private String fwcCode;

    /**
     * 医院域
     */
    private String domain;

    /**
     * 医院等级：如三级
     */
    private String level;

    /**
     * 医院等级：如甲等
     */
    private String grade;

    /**
     * 医院所在省份
     */
    private String province;

    /**
     * 医院所在城市
     */
    private String city;

    /**
     * 网站地址
     */
    @Column(name = "web_site")
    private String webSite;

    /**
     * 特色科室
     */
    private String specialty;

    /**
     * 交通路线
     */
    private String traffic;

    @Column(name = "app_name")
    private String appName;

    @Column(name = "app_url")
    private String appUrl;

    @Column(name = "app_download")
    private String appDownload;

    /**
     * 0不是平台，1是平台
     */
    @Column(name = "is_platform")
    private String isPlatform;

    /**
     * 能否挂号 0不能  1可以
     */
    @Column(name = "is_order")
    private String isOrder;

    /**
     * 客服电话
     */
    @Column(name = "service_tel")
    private String serviceTel;

    @Column(name = "create_time")
    private Date createTime;

    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 打开app医生端连接前缀
     */
    @Column(name = "app_doctor_url")
    private String appDoctorUrl;

    /**
     * app医生端下载地址
     */
    @Column(name = "app_doctor_download")
    private String appDoctorDownload;

    /**
     * 站长统计script
     */
    @Column(name = "statistics_url")
    private String statisticsUrl;

    /**
     * 医联体id
     */
    @Column(name = "union_id")
    private Integer unionId;

    /**
     * 医院背景类型选择
     */
    @Column(name = "hos_bg_type")
    private String hosBgType;

    /**
     * ca签名项目code
     */
    @Column(name = "ca_project_code")
    private String caProjectCode;

    /**
     * 关键词
     */
    private String keywords;

    /**
     * 简介
     */
    private String description;

    /**
     * 项目id 公司产品线项目的id 由用户中心分配
     */
    @Column(name = "project_id")
    private Integer projectId;

    /**
     * 用户手机端Logo
     */
    @Column(name = "user_app_logo")
    private String userAppLogo;

    /**
     * 网站管理后台左上角logo
     */
    @Column(name = "doc_web_logo")
    private String docWebLogo;

    /**
     * 腾讯云推送id
     */
    @Column(name = "push_id")
    private String pushId;

    /**
     * 快速问诊管理员电话
     */
    @Column(name = "quick_reservation_admin_phone")
    private String quickReservationAdminPhone;

    /**
     * 用户中心的角色名称
     */
    @Column(name = "hospital_role")
    private String hospitalRole;

    /**
     * 医院简介
     */
    private String introduction;

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
     * 获取医院名称
     *
     * @return name - 医院名称
     */
    public String getName() {
        return name;
    }

    /**
     * 设置医院名称
     *
     * @param name 医院名称
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 获取医院地址
     *
     * @return address - 医院地址
     */
    public String getAddress() {
        return address;
    }

    /**
     * 设置医院地址
     *
     * @param address 医院地址
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * 获取医院邮编
     *
     * @return postcode - 医院邮编
     */
    public String getPostcode() {
        return postcode;
    }

    /**
     * 设置医院邮编
     *
     * @param postcode 医院邮编
     */
    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    /**
     * 获取医院电话
     *
     * @return tel - 医院电话
     */
    public String getTel() {
        return tel;
    }

    /**
     * 设置医院电话
     *
     * @param tel 医院电话
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * 获取医院邮件
     *
     * @return email - 医院邮件
     */
    public String getEmail() {
        return email;
    }

    /**
     * 设置医院邮件
     *
     * @param email 医院邮件
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * 获取备案号
     *
     * @return records_code - 备案号
     */
    public String getRecordsCode() {
        return recordsCode;
    }

    /**
     * 设置备案号
     *
     * @param recordsCode 备案号
     */
    public void setRecordsCode(String recordsCode) {
        this.recordsCode = recordsCode;
    }

    /**
     * 获取制作方
     *
     * @return producers - 制作方
     */
    public String getProducers() {
        return producers;
    }

    /**
     * 设置制作方
     *
     * @param producers 制作方
     */
    public void setProducers(String producers) {
        this.producers = producers;
    }

    /**
     * 获取版权方
     *
     * @return copyright - 版权方
     */
    public String getCopyright() {
        return copyright;
    }

    /**
     * 设置版权方
     *
     * @param copyright 版权方
     */
    public void setCopyright(String copyright) {
        this.copyright = copyright;
    }

    /**
     * 获取故障电话
     *
     * @return fault_tel - 故障电话
     */
    public String getFaultTel() {
        return faultTel;
    }

    /**
     * 设置故障电话
     *
     * @param faultTel 故障电话
     */
    public void setFaultTel(String faultTel) {
        this.faultTel = faultTel;
    }

    /**
     * 获取医院缩略图
     *
     * @return picture - 医院缩略图
     */
    public String getPicture() {
        return picture;
    }

    /**
     * 设置医院缩略图
     *
     * @param picture 医院缩略图
     */
    public void setPicture(String picture) {
        this.picture = picture;
    }

    /**
     * 获取医院logo
     *
     * @return logo - 医院logo
     */
    public String getLogo() {
        return logo;
    }

    /**
     * 设置医院logo
     *
     * @param logo 医院logo
     */
    public void setLogo(String logo) {
        this.logo = logo;
    }

    /**
     * 获取底部logo
     *
     * @return foot_logo - 底部logo
     */
    public String getFootLogo() {
        return footLogo;
    }

    /**
     * 设置底部logo
     *
     * @param footLogo 底部logo
     */
    public void setFootLogo(String footLogo) {
        this.footLogo = footLogo;
    }

    /**
     * 获取app二维码
     *
     * @return app_code - app二维码
     */
    public String getAppCode() {
        return appCode;
    }

    /**
     * 设置app二维码
     *
     * @param appCode app二维码
     */
    public void setAppCode(String appCode) {
        this.appCode = appCode;
    }

    /**
     * 获取公众号二维码
     *
     * @return gzh_code - 公众号二维码
     */
    public String getGzhCode() {
        return gzhCode;
    }

    /**
     * 设置公众号二维码
     *
     * @param gzhCode 公众号二维码
     */
    public void setGzhCode(String gzhCode) {
        this.gzhCode = gzhCode;
    }

    /**
     * 获取服务号二维码
     *
     * @return fwh_code - 服务号二维码
     */
    public String getFwhCode() {
        return fwhCode;
    }

    /**
     * 设置服务号二维码
     *
     * @param fwhCode 服务号二维码
     */
    public void setFwhCode(String fwhCode) {
        this.fwhCode = fwhCode;
    }

    /**
     * 获取服务窗二维码
     *
     * @return fwc_code - 服务窗二维码
     */
    public String getFwcCode() {
        return fwcCode;
    }

    /**
     * 设置服务窗二维码
     *
     * @param fwcCode 服务窗二维码
     */
    public void setFwcCode(String fwcCode) {
        this.fwcCode = fwcCode;
    }

    /**
     * 获取医院域
     *
     * @return domain - 医院域
     */
    public String getDomain() {
        return domain;
    }

    /**
     * 设置医院域
     *
     * @param domain 医院域
     */
    public void setDomain(String domain) {
        this.domain = domain;
    }

    /**
     * 获取医院等级：如三级
     *
     * @return level - 医院等级：如三级
     */
    public String getLevel() {
        return level;
    }

    /**
     * 设置医院等级：如三级
     *
     * @param level 医院等级：如三级
     */
    public void setLevel(String level) {
        this.level = level;
    }

    /**
     * 获取医院等级：如甲等
     *
     * @return grade - 医院等级：如甲等
     */
    public String getGrade() {
        return grade;
    }

    /**
     * 设置医院等级：如甲等
     *
     * @param grade 医院等级：如甲等
     */
    public void setGrade(String grade) {
        this.grade = grade;
    }

    /**
     * 获取医院所在省份
     *
     * @return province - 医院所在省份
     */
    public String getProvince() {
        return province;
    }

    /**
     * 设置医院所在省份
     *
     * @param province 医院所在省份
     */
    public void setProvince(String province) {
        this.province = province;
    }

    /**
     * 获取医院所在城市
     *
     * @return city - 医院所在城市
     */
    public String getCity() {
        return city;
    }

    /**
     * 设置医院所在城市
     *
     * @param city 医院所在城市
     */
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * 获取网站地址
     *
     * @return web_site - 网站地址
     */
    public String getWebSite() {
        return webSite;
    }

    /**
     * 设置网站地址
     *
     * @param webSite 网站地址
     */
    public void setWebSite(String webSite) {
        this.webSite = webSite;
    }

    /**
     * 获取特色科室
     *
     * @return specialty - 特色科室
     */
    public String getSpecialty() {
        return specialty;
    }

    /**
     * 设置特色科室
     *
     * @param specialty 特色科室
     */
    public void setSpecialty(String specialty) {
        this.specialty = specialty;
    }

    /**
     * 获取交通路线
     *
     * @return traffic - 交通路线
     */
    public String getTraffic() {
        return traffic;
    }

    /**
     * 设置交通路线
     *
     * @param traffic 交通路线
     */
    public void setTraffic(String traffic) {
        this.traffic = traffic;
    }

    /**
     * @return app_name
     */
    public String getAppName() {
        return appName;
    }

    /**
     * @param appName
     */
    public void setAppName(String appName) {
        this.appName = appName;
    }

    /**
     * @return app_url
     */
    public String getAppUrl() {
        return appUrl;
    }

    /**
     * @param appUrl
     */
    public void setAppUrl(String appUrl) {
        this.appUrl = appUrl;
    }

    /**
     * @return app_download
     */
    public String getAppDownload() {
        return appDownload;
    }

    /**
     * @param appDownload
     */
    public void setAppDownload(String appDownload) {
        this.appDownload = appDownload;
    }

    /**
     * 获取0不是平台，1是平台
     *
     * @return is_platform - 0不是平台，1是平台
     */
    public String getIsPlatform() {
        return isPlatform;
    }

    /**
     * 设置0不是平台，1是平台
     *
     * @param isPlatform 0不是平台，1是平台
     */
    public void setIsPlatform(String isPlatform) {
        this.isPlatform = isPlatform;
    }

    /**
     * 获取能否挂号 0不能  1可以
     *
     * @return is_order - 能否挂号 0不能  1可以
     */
    public String getIsOrder() {
        return isOrder;
    }

    /**
     * 设置能否挂号 0不能  1可以
     *
     * @param isOrder 能否挂号 0不能  1可以
     */
    public void setIsOrder(String isOrder) {
        this.isOrder = isOrder;
    }

    /**
     * 获取客服电话
     *
     * @return service_tel - 客服电话
     */
    public String getServiceTel() {
        return serviceTel;
    }

    /**
     * 设置客服电话
     *
     * @param serviceTel 客服电话
     */
    public void setServiceTel(String serviceTel) {
        this.serviceTel = serviceTel;
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
     * 获取打开app医生端连接前缀
     *
     * @return app_doctor_url - 打开app医生端连接前缀
     */
    public String getAppDoctorUrl() {
        return appDoctorUrl;
    }

    /**
     * 设置打开app医生端连接前缀
     *
     * @param appDoctorUrl 打开app医生端连接前缀
     */
    public void setAppDoctorUrl(String appDoctorUrl) {
        this.appDoctorUrl = appDoctorUrl;
    }

    /**
     * 获取app医生端下载地址
     *
     * @return app_doctor_download - app医生端下载地址
     */
    public String getAppDoctorDownload() {
        return appDoctorDownload;
    }

    /**
     * 设置app医生端下载地址
     *
     * @param appDoctorDownload app医生端下载地址
     */
    public void setAppDoctorDownload(String appDoctorDownload) {
        this.appDoctorDownload = appDoctorDownload;
    }

    /**
     * 获取站长统计script
     *
     * @return statistics_url - 站长统计script
     */
    public String getStatisticsUrl() {
        return statisticsUrl;
    }

    /**
     * 设置站长统计script
     *
     * @param statisticsUrl 站长统计script
     */
    public void setStatisticsUrl(String statisticsUrl) {
        this.statisticsUrl = statisticsUrl;
    }

    /**
     * 获取医联体id
     *
     * @return union_id - 医联体id
     */
    public Integer getUnionId() {
        return unionId;
    }

    /**
     * 设置医联体id
     *
     * @param unionId 医联体id
     */
    public void setUnionId(Integer unionId) {
        this.unionId = unionId;
    }

    /**
     * 获取医院背景类型选择
     *
     * @return hos_bg_type - 医院背景类型选择
     */
    public String getHosBgType() {
        return hosBgType;
    }

    /**
     * 设置医院背景类型选择
     *
     * @param hosBgType 医院背景类型选择
     */
    public void setHosBgType(String hosBgType) {
        this.hosBgType = hosBgType;
    }

    /**
     * 获取ca签名项目code
     *
     * @return ca_project_code - ca签名项目code
     */
    public String getCaProjectCode() {
        return caProjectCode;
    }

    /**
     * 设置ca签名项目code
     *
     * @param caProjectCode ca签名项目code
     */
    public void setCaProjectCode(String caProjectCode) {
        this.caProjectCode = caProjectCode;
    }

    /**
     * 获取关键词
     *
     * @return keywords - 关键词
     */
    public String getKeywords() {
        return keywords;
    }

    /**
     * 设置关键词
     *
     * @param keywords 关键词
     */
    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    /**
     * 获取简介
     *
     * @return description - 简介
     */
    public String getDescription() {
        return description;
    }

    /**
     * 设置简介
     *
     * @param description 简介
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 获取项目id 公司产品线项目的id 由用户中心分配
     *
     * @return project_id - 项目id 公司产品线项目的id 由用户中心分配
     */
    public Integer getProjectId() {
        return projectId;
    }

    /**
     * 设置项目id 公司产品线项目的id 由用户中心分配
     *
     * @param projectId 项目id 公司产品线项目的id 由用户中心分配
     */
    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    /**
     * 获取用户手机端Logo
     *
     * @return user_app_logo - 用户手机端Logo
     */
    public String getUserAppLogo() {
        return userAppLogo;
    }

    /**
     * 设置用户手机端Logo
     *
     * @param userAppLogo 用户手机端Logo
     */
    public void setUserAppLogo(String userAppLogo) {
        this.userAppLogo = userAppLogo;
    }

    /**
     * 获取网站管理后台左上角logo
     *
     * @return doc_web_logo - 网站管理后台左上角logo
     */
    public String getDocWebLogo() {
        return docWebLogo;
    }

    /**
     * 设置网站管理后台左上角logo
     *
     * @param docWebLogo 网站管理后台左上角logo
     */
    public void setDocWebLogo(String docWebLogo) {
        this.docWebLogo = docWebLogo;
    }

    /**
     * 获取腾讯云推送id
     *
     * @return push_id - 腾讯云推送id
     */
    public String getPushId() {
        return pushId;
    }

    /**
     * 设置腾讯云推送id
     *
     * @param pushId 腾讯云推送id
     */
    public void setPushId(String pushId) {
        this.pushId = pushId;
    }

    /**
     * 获取快速问诊管理员电话
     *
     * @return quick_reservation_admin_phone - 快速问诊管理员电话
     */
    public String getQuickReservationAdminPhone() {
        return quickReservationAdminPhone;
    }

    /**
     * 设置快速问诊管理员电话
     *
     * @param quickReservationAdminPhone 快速问诊管理员电话
     */
    public void setQuickReservationAdminPhone(String quickReservationAdminPhone) {
        this.quickReservationAdminPhone = quickReservationAdminPhone;
    }

    /**
     * 获取用户中心的角色名称
     *
     * @return hospital_role - 用户中心的角色名称
     */
    public String getHospitalRole() {
        return hospitalRole;
    }

    /**
     * 设置用户中心的角色名称
     *
     * @param hospitalRole 用户中心的角色名称
     */
    public void setHospitalRole(String hospitalRole) {
        this.hospitalRole = hospitalRole;
    }

    /**
     * 获取医院简介
     *
     * @return introduction - 医院简介
     */
    public String getIntroduction() {
        return introduction;
    }

    /**
     * 设置医院简介
     *
     * @param introduction 医院简介
     */
    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }
}