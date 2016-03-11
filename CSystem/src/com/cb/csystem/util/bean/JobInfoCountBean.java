package com.cb.csystem.util.bean;

/**
 * 就业信息统计类型
 * @author chen
 *
 */
public class JobInfoCountBean {
	
//	/**
//	 * 签约状态：8003  1-已签  2-未签  3-升学(保研)  4-未签(考研)  5-未签(考公)  6-未签(拟出国)	7-不分  8-升学(考取) 9-已签(公务员) 10-已签(出国)
//	 */
//	public static final String CONTRACTSTATUS_TYPE_A="1";
//	public static final String CONTRACTSTATUS_TYPE_B="2";
//	public static final String CONTRACTSTATUS_TYPE_C="3";
//	public static final String CONTRACTSTATUS_TYPE_D="4";
//	public static final String CONTRACTSTATUS_TYPE_E="5";
//	public static final String CONTRACTSTATUS_TYPE_F="6";
//	public static final String CONTRACTSTATUS_TYPE_G="7";
//	public static final String CONTRACTSTATUS_TYPE_H="8";
//	public static final String CONTRACTSTATUS_TYPE_I="9";
//	public static final String CONTRACTSTATUS_TYPE_J="10";
	
	private String className;		//班级名称
	private int classMemberNum;		//班级人数
	private int contractState_A;	//已签人数
	private int contractState_B;	//未签人数
	private int contractState_C;	//升学(保研)人数
	private int contractState_D;	//未签(考研)人数
	private int contractState_E;	//未签(考公)人数
	private int contractState_F;	//未签(拟出国)人数
	private int contractState_G;	//不分人数
	private int contractState_H;	//升学(考取)人数
	private int contractState_I;	//已签(公务员)人数
	private int contractState_J;	//已签(出国)人数
	private double averageSalary;	//已签平均工资
	private String countDate;	//统计日期
	
	public JobInfoCountBean() {
		super();
	}
	

	
	/**
	 * @param className
	 * @param classMemberNum
	 * @param contractState_A
	 * @param contractState_B
	 * @param contractState_C
	 * @param contractState_D
	 * @param contractState_E
	 * @param contractState_F
	 * @param contractState_G
	 * @param contractState_H
	 * @param contractState_I
	 * @param contractState_J
	 * @param averageSalary
	 * @param countDate
	 */
	public JobInfoCountBean(String className, int classMemberNum,
			int contractState_A, int contractState_B, int contractState_C,
			int contractState_D, int contractState_E, int contractState_F,
			int contractState_G, int contractState_H, int contractState_I,
			int contractState_J, double averageSalary, String countDate) {
		super();
		this.className = className;
		this.classMemberNum = classMemberNum;
		this.contractState_A = contractState_A;
		this.contractState_B = contractState_B;
		this.contractState_C = contractState_C;
		this.contractState_D = contractState_D;
		this.contractState_E = contractState_E;
		this.contractState_F = contractState_F;
		this.contractState_G = contractState_G;
		this.contractState_H = contractState_H;
		this.contractState_I = contractState_I;
		this.contractState_J = contractState_J;
		this.averageSalary = averageSalary;
		this.countDate = countDate;
	}



	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public int getClassMemberNum() {
		return classMemberNum;
	}
	public void setClassMemberNum(int classMemberNum) {
		this.classMemberNum = classMemberNum;
	}
	public int getContractState_A() {
		return contractState_A;
	}
	public void setContractState_A(int contractState_A) {
		this.contractState_A = contractState_A;
	}
	public int getContractState_B() {
		return contractState_B;
	}
	public void setContractState_B(int contractState_B) {
		this.contractState_B = contractState_B;
	}
	public int getContractState_C() {
		return contractState_C;
	}
	public void setContractState_C(int contractState_C) {
		this.contractState_C = contractState_C;
	}
	public int getContractState_D() {
		return contractState_D;
	}
	public void setContractState_D(int contractState_D) {
		this.contractState_D = contractState_D;
	}
	public int getContractState_E() {
		return contractState_E;
	}
	public void setContractState_E(int contractState_E) {
		this.contractState_E = contractState_E;
	}
	public int getContractState_F() {
		return contractState_F;
	}
	public void setContractState_F(int contractState_F) {
		this.contractState_F = contractState_F;
	}
	public double getAverageSalary() {
		return averageSalary;
	}
	public void setAverageSalary(double averageSalary) {
		this.averageSalary = averageSalary;
	}
	public String getCountDate() {
		return countDate;
	}
	public void setCountDate(String countDate) {
		this.countDate = countDate;
	}
	public int getContractState_G() {
		return contractState_G;
	}
	public void setContractState_G(int contractState_G) {
		this.contractState_G = contractState_G;
	}
	public int getContractState_H() {
		return contractState_H;
	}
	public void setContractState_H(int contractState_H) {
		this.contractState_H = contractState_H;
	}
	public int getContractState_I() {
		return contractState_I;
	}
	public void setContractState_I(int contractState_I) {
		this.contractState_I = contractState_I;
	}
	public int getContractState_J() {
		return contractState_J;
	}
	public void setContractState_J(int contractState_J) {
		this.contractState_J = contractState_J;
	}
	
	
}
