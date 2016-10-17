package com.cumt.criminal.model;

public class StaffDomain implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer Id;
	private String Idcard;
	private String StaffName;
	private String LoginName;
	private String LoginPwd;
	private String Identify;
	private boolean loginState;
	private String ip;
	private String BigIP;
	
	public String getBigIP() {
		return BigIP;
	}

	public void setBigIP(String bigIP) {
		BigIP = bigIP;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public StaffDomain() {
	}

	public StaffDomain(String idcard, String staffName, String loginName,
			String loginPwd, String identify,boolean loginState) {
		this.Idcard = idcard;
		this.StaffName = staffName;
		this.LoginName = loginName;
		this.LoginPwd = loginPwd;
		this.Identify = identify;
		this.loginState = loginState;
	}

	public boolean getLoginState() {
		return loginState;
	}

	public void setLoginState(boolean loginState) {
		this.loginState = loginState;
	}

	public Integer getId() {
		return this.Id;
	}

	public void setId(Integer id) {
		this.Id = id;
	}

	public String getIdcard() {
		return this.Idcard;
	}

	public void setIdcard(String idcard) {
		this.Idcard = idcard;
	}

	public String getStaffName() {
		return this.StaffName;
	}

	public void setStaffName(String staffName) {
		this.StaffName = staffName;
	}

	public String getLoginName() {
		return this.LoginName;
	}

	public void setLoginName(String loginName) {
		this.LoginName = loginName;
	}

	public String getLoginPwd() {
		return this.LoginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.LoginPwd = loginPwd;
	}

	public String getIdentify() {
		return this.Identify;
	}

	public void setIdentify(String identify) {
		this.Identify = identify;
	}

}
