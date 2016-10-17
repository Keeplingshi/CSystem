package com.cumt.criminal.model;

import java.util.Date;

public class QrecordDomain implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private int caseRegisterId;
	private String handleStaff;
	private Date askTime;
	private String askedPerson;
	private String content;
	private boolean state;
	private boolean resultState;

	public QrecordDomain() {
	}

	public QrecordDomain(int caseRegisterId, String handleStaff, Date askTime,
			String askedPerson, String content, boolean state,
			boolean resultState) {
		this.caseRegisterId = caseRegisterId;
		this.handleStaff = handleStaff;
		this.askTime = askTime;
		this.askedPerson = askedPerson;
		this.content = content;
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

	public String getHandleStaff() {
		return this.handleStaff;
	}

	public void setHandleStaff(String handleStaff) {
		this.handleStaff = handleStaff;
	}

	public Date getAskTime() {
		return this.askTime;
	}

	public void setAskTime(Date askTime) {
		this.askTime = askTime;
	}

	public String getAskedPerson() {
		return this.askedPerson;
	}

	public void setAskedPerson(String askedPerson) {
		this.askedPerson = askedPerson;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

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
