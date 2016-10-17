package com.cumt.criminal.model;

public class LegalInstrumentDomain implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private int caseRegisterId;
	private String content;
	private String staffName;
	private boolean state;
	private boolean result_state;
	
	public LegalInstrumentDomain() {
	}

	public LegalInstrumentDomain(int id,int caseRegisterId, String content, String staffName,boolean state,boolean result_state) {
		this.id = id;
		this.caseRegisterId = caseRegisterId;
		this.content = content;
		this.staffName = staffName;
		this.state = state;
		this.result_state = result_state;
	}

	public boolean getState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	public boolean getResult_state() {
		return result_state;
	}

	public void setResult_state(boolean result_state) {
		this.result_state = result_state;
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

	public String getStaffName() {
		return this.staffName;
	}

	public void setStaffName(String staffName) {
		this.staffName = staffName;
	}

}
