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

@Entity
@Table(name="LINKNOTE")
public class LinkNoteDomain {

	private String id;
	//private String studentId;	//学生
	private StudentDomain student;
	private String familyId;	//家庭成员
	//private String linknoteTypeId;	//类型
	private LinkNoteTypeDomain linkNoteType;
	@DateTimeFormat( pattern = "yyyy-MM-dd" )
	private Date time;	//时间
	private String note;	//备注
	private String userId;	//创建用户
	//private UserDomain userDomain;
	
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
	
//	@Column(name = "STUDENTID", nullable = true, length = 100)
//	public String getStudentId() {
//		return studentId;
//	}
//	public void setStudentId(String studentId) {
//		this.studentId = studentId;
//	}
	
	@Column(name = "FAMILYID", nullable = true, length = 100)
	public String getFamilyId() {
		return familyId;
	}
	public void setFamilyId(String familyId) {
		this.familyId = familyId;
	}
	
//	@Column(name = "LINKNOTETYPEID", nullable = false, length = 100)
//	public String getLinknoteTypeId() {
//		return linknoteTypeId;
//	}
//	public void setLinknoteTypeId(String linknoteTypeId) {
//		this.linknoteTypeId = linknoteTypeId;
//	}
	
	@Column(name = "TIME", nullable = true, length = 200)
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	
	@Column(name = "NOTE", nullable = true, length = 1000)
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "STUDENTID")
	public StudentDomain getStudent() {
		return student;
	}
	public void setStudent(StudentDomain student) {
		this.student = student;
	}
	
	@ManyToOne(cascade = CascadeType.REFRESH)
	@JoinColumn(name = "LINKNOTETYPEID")
	public LinkNoteTypeDomain getLinkNoteType() {
		return linkNoteType;
	}
	public void setLinkNoteType(LinkNoteTypeDomain linkNoteType) {
		this.linkNoteType = linkNoteType;
	}
	
//	@ManyToOne(cascade = CascadeType.REFRESH)
//	@JoinColumn(name = "USERID")
//	public UserDomain getUserDomain() {
//		return userDomain;
//	}
//	public void setUserDomain(UserDomain userDomain) {
//		this.userDomain = userDomain;
//	}
	
	@Column(name = "USERID", nullable = false, length = 100)
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
}
