package com.mana.pojo;

import java.io.Serializable;

public class Manager implements Serializable {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column manager.manageid
     *
     * @mbggenerated
     */
    private String manageid;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column manager.manapassword
     *
     * @mbggenerated
     */
    private String manapassword;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table manager
     *
     * @mbggenerated
     */
    private static final long serialVersionUID = 1L;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column manager.manageid
     *
     * @return the value of manager.manageid
     *
     * @mbggenerated
     */
    public String getManageid() {
        return manageid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column manager.manageid
     *
     * @param manageid the value for manager.manageid
     *
     * @mbggenerated
     */
    public void setManageid(String manageid) {
        this.manageid = manageid;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column manager.manapassword
     *
     * @return the value of manager.manapassword
     *
     * @mbggenerated
     */
    public String getManapassword() {
        return manapassword;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column manager.manapassword
     *
     * @param manapassword the value for manager.manapassword
     *
     * @mbggenerated
     */
    public void setManapassword(String manapassword) {
        this.manapassword = manapassword;
    }
}