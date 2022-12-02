package com.ezen.springboard.vo;

import java.sql.Date;

public class UserVO {
	private String userId;
	private String userPwd;
	private String userNm;
	private String userEmail1;
	private String userEmail2;
	private String userEmail;
	private Date userRgd;
	private int rprtCnt;
	private String userRole;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserNm() {
		return userNm;
	}
	public void setUserNm(String userNm) {
		this.userNm = userNm;
	}
	public String getUserEmail1() {
		return userEmail1;
	}
	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}
	public String getUserEmail() {
		return getUserEmail1() + "@" + getUserEmail2();
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public Date getUserRgd() {
		return userRgd;
	}
	public void setUserRgd(Date userRgd) {
		this.userRgd = userRgd;
	}
	public int getRprtCnt() {
		return rprtCnt;
	}
	public void setRprtCnt(int rprtCnt) {
		this.rprtCnt = rprtCnt;
	}
	public String getUserRole() {
		return userRole;
	}
	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userPwd=" + userPwd + ", userNm=" + userNm + ", userEmail=" + userEmail
				+ ", userRgd=" + userRgd + ", rprtCnt=" + rprtCnt + ", userRole=" + userRole + "]";
	}
	
	
}