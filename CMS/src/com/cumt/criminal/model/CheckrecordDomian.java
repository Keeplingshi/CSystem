package com.cumt.criminal.model;
// default package
// Generated 2016-4-29 14:48:37 by Hibernate Tools 4.0.0

/**
 * Checkrecord generated by hbm2java
 */
public class CheckrecordDomian implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private int caseRegisterId;
	private String content;
//	private String result;
	private boolean state;
	private boolean resultState;

	public CheckrecordDomian() {
	}

	public CheckrecordDomian(int id, int caseRegisterId, String content,
			String result, boolean state, boolean resultState) {
		this.id = id;
		this.caseRegisterId = caseRegisterId;
		this.content = content;
//		this.result = result;
		this.state = state;
		this.resultState = resultState;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public int getCaseRegisterId() {
		return this.caseRegisterId;
	}

	public void setCaseRegisterId(int caseRegisterId) {
		this.caseRegisterId = caseRegisterId;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}
/*
	public String getResult() {
		return this.result;
	}

	public void setResult(String result) {
		this.result = result;
	}*/

	public boolean getState() {
		return this.state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public boolean getResultState() {
		return this.resultState;
	}

	public void setResultState(boolean resultState) {
		this.resultState = resultState;
	}

}
