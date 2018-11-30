package com.zjh.internethospitalapi.entity;

import javax.persistence.*;

@Table(name = "user_reservation_img")
public class UserReservationImg {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name = "user_reservation_id")
    private Integer userReservationId;

    @Column(name = "img_id")
    private Integer imgId;

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
     * @return user_reservation_id
     */
    public Integer getUserReservationId() {
        return userReservationId;
    }

    /**
     * @param userReservationId
     */
    public void setUserReservationId(Integer userReservationId) {
        this.userReservationId = userReservationId;
    }

    /**
     * @return img_id
     */
    public Integer getImgId() {
        return imgId;
    }

    /**
     * @param imgId
     */
    public void setImgId(Integer imgId) {
        this.imgId = imgId;
    }
}