package com.cumt.criminal.model;

import java.util.Date;



public class CaseRegisterDomain implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private String idcard;
	private String name;
	private Date birthday;
	private Date day;
	private String birthPalce;
	private String workPalce;
	private String degreeEducation;
	private String nation;
	private String politicsStatus;
	private boolean isCriminalRecord;
	private String charge;
	private String chargeMain;
	private String chargeNext;
	private String victimName;
	private String sueName;
	private String nativePalace;
	private String suePhone;
	private String chargeFamilyName;
	private String chargeFamilyPhone;
	private boolean sex;
	private boolean state;
/*private ArrestDomain arrestDomain;
	public ArrestDomain getArrestDomain() {
	return arrestDomain;
}

public void setArrestDomain(ArrestDomain arrestDomain) {
	this.arrestDomain = arrestDomain;
}*/

	public CaseRegisterDomain() {
	}

	public CaseRegisterDomain(Integer id, String idcard, String name,
			Date birthday, Date day, String birthPalce, String nation,
			String politicsStatus, boolean isCriminalRecord, String charge,
			String chargeMain, String chargeNext, String victimName,
			String nativePalace, String chargeFamilyName,
			String chargeFamilyPhone,boolean sex,boolean state) {
		this.id = id;
		this.idcard = idcard;
		this.name = name;
		this.birthday = birthday;
		this.day = day;
		this.birthPalce = birthPalce;
		this.nation = nation;
		this.politicsStatus = politicsStatus;
		this.isCriminalRecord = isCriminalRecord;
		this.charge = charge;
		this.chargeMain = chargeMain;
		this.chargeNext = chargeNext;
		this.victimName = victimName;
		this.nativePalace = nativePalace;
		this.chargeFamilyName = chargeFamilyName;
		this.chargeFamilyPhone = chargeFamilyPhone;
		this.sex = sex;
		this.state = state;
	}


	public boolean getSex() {
		return sex;
	}

	public void setSex(boolean sex) {
		this.sex = sex;
	}

	public boolean getState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIdcard() {
		return this.idcard;
	}

	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public Date getDay() {
		return this.day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

	public String getBirthPalce() {
		return this.birthPalce;
	}

	public void setBirthPalce(String birthPalce) {
		this.birthPalce = birthPalce;
	}

	public String getWorkPalce() {
		return this.workPalce;
	}

	public void setWorkPalce(String workPalce) {
		this.workPalce = workPalce;
	}

	public String getDegreeEducation() {
		return this.degreeEducation;
	}

	public void setDegreeEducation(String degreeEducation) {
		this.degreeEducation = degreeEducation;
	}

	public String getNation() {
		return this.nation;
	}

	public void setNation(String nation) {
		this.nation = nation;
	}

	public String getPoliticsStatus() {
		return this.politicsStatus;
	}

	public void setPoliticsStatus(String politicsStatus) {
		this.politicsStatus = politicsStatus;
	}

	public boolean isIsCriminalRecord() {
		return this.isCriminalRecord;
	}

	public void setIsCriminalRecord(boolean isCriminalRecord) {
		this.isCriminalRecord = isCriminalRecord;
	}

	public String getCharge() {
		return this.charge;
	}

	public void setCharge(String charge) {
		this.charge = charge;
	}

	public String getChargeMain() {
		return this.chargeMain;
	}

	public void setChargeMain(String chargeMain) {
		this.chargeMain = chargeMain;
	}

	public String getChargeNext() {
		return this.chargeNext;
	}

	public void setChargeNext(String chargeNext) {
		this.chargeNext = chargeNext;
	}

	public String getVictimName() {
		return this.victimName;
	}

	public void setVictimName(String victimName) {
		this.victimName = victimName;
	}

	public String getSueName() {
		return this.sueName;
	}

	public void setSueName(String sueName) {
		this.sueName = sueName;
	}

	public String getNativePalace() {
		return this.nativePalace;
	}

	public void setNativePalace(String nativePalace) {
		this.nativePalace = nativePalace;
	}

	public String getSuePhone() {
		return this.suePhone;
	}

	public void setSuePhone(String suePhone) {
		this.suePhone = suePhone;
	}

	public String getChargeFamilyName() {
		return this.chargeFamilyName;
	}

	public void setChargeFamilyName(String chargeFamilyName) {
		this.chargeFamilyName = chargeFamilyName;
	}

	public String getChargeFamilyPhone() {
		return this.chargeFamilyPhone;
	}

	public boolean isCriminalRecord() {
		return isCriminalRecord;
	}

	public void setCriminalRecord(boolean isCriminalRecord) {
		this.isCriminalRecord = isCriminalRecord;
	}

	public void setChargeFamilyPhone(String chargeFamilyPhone) {
		this.chargeFamilyPhone = chargeFamilyPhone;
	}

}
