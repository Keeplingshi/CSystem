package com.cb.csystem.domain;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 家庭信息
 * @author Administrator
 *
 */
@Entity
@Table(name="FAMILY")
public class FamilyDomain {

	private String id;
	private StudentDomain student;	//家庭成员关联学生
	private String name;		//姓名
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date birthday;	//出生日期
	private String job;		//职务
	private String relation;	//与学生关系
	private String occupation;	//职业
	//private String nationality;	//民族
	//private String politicalStatus;	//政治面貌
	private String IDnumber;	//身份证号
	private String jobAddress;	//工作地址
	private String telePhone;	//联系电话1
	private String cellphone;	//手机
	
	//家庭基本信息情况
	private String address;	//家庭地址
	private String postCode;	//邮编
	private String economicStatus;	//家庭经济情况
	
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name = "system-uuid",strategy="uuid")
	@Column(name = "ID", unique = true, nullable = false, precision = 10, scale = 0)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "STUDENTID")
	public StudentDomain getStudent() {
		return student;
	}
	public void setStudent(StudentDomain student) {
		this.student = student;
	}
	
	@Column(name = "NAME", nullable = true, length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Column(name = "BIRTHDAY", nullable = true, length = 100)
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	
	@Column(name = "JOB", nullable = true, length = 100)
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	
	@Column(name = "RELATION", nullable = true, length = 100)
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	
	@Column(name = "OCCUPATION", nullable = true, length = 100)
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	
//	@Column(name = "NATIONALITY", nullable = true, length = 100)
//	public String getNationality() {
//		return nationality;
//	}
//	public void setNationality(String nationality) {
//		this.nationality = nationality;
//	}
	
//	/**
//	 * @return the politicalStatus
//	 */
//	@Column(name = "POLITICALSTATUS", nullable = true, length = 10)
//	public String getPoliticalStatus() {
//		return politicalStatus;
//	}
//	/**
//	 * @param politicalStatus the politicalStatus to set
//	 */
//	public void setPoliticalStatus(String politicalStatus) {
//		this.politicalStatus = politicalStatus;
//	}
	
	@Column(name = "IDNUMBER", nullable = true, length = 100)
	public String getIDnumber() {
		return IDnumber;
	}
	public void setIDnumber(String iDnumber) {
		IDnumber = iDnumber;
	}
	
	@Column(name = "JOBADDRESS", nullable = true, length = 1000)
	public String getJobAddress() {
		return jobAddress;
	}
	public void setJobAddress(String jobAddress) {
		this.jobAddress = jobAddress;
	}
	
	@Column(name = "TELEPHONE", nullable = true, length = 100)
	public String getTelePhone() {
		return telePhone;
	}
	public void setTelePhone(String telePhone) {
		this.telePhone = telePhone;
	}
	
	@Column(name = "CELLPHONE", nullable = true, length = 20)
	public String getCellphone() {
		return cellphone;
	}
	public void setCellphone(String cellphone) {
		this.cellphone = cellphone;
	}
	
	@Column(name = "ADDRESS", nullable = true, length = 1000)
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Column(name = "POSTCODE", nullable = true, length = 20)
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	
	@Column(name = "ECONOMICSTATUS", nullable = true, length = 1000)
	public String getEconomicStatus() {
		return economicStatus;
	}
	public void setEconomicStatus(String economicStatus) {
		this.economicStatus = economicStatus;
	}
	
	
	
}
