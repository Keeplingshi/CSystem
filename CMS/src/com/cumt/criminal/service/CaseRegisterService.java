package com.cumt.criminal.service;

import java.util.List;

import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.util.QueryResultUtil;

public interface CaseRegisterService {

	/**
	 * 新加一个案件登记
	 * @param caseRegister
	 */
	public void addCaseRegister(CaseRegisterDomain caseRegister);
	/**
	 * 删除某一个刑事案件登记表
	 * @param id
	 * @return
	 */
	public boolean delCaseRegister(CaseRegisterDomain caseRegister);
	/**
	 * 修改刑事案件登记表
	 * @param oldCR
	 * @param newCR
	 * @return
	 */
	public CaseRegisterDomain editCaseRegister(CaseRegisterDomain oldCR,CaseRegisterDomain newCR);
	/**
	 * 根据id查找刑事案件
	 * @param id
	 * @return
	 */
	public CaseRegisterDomain queryCaseRegisterById(int id);
	/**
	 * 根据处理状态
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByState(String state);
	/**
	 * 根据犯案时间查找
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByDay(String day);
	/**
	 * 根据报案人
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByName(String name);
	/**
	 * 查找所有的刑事案件登记表
	 * @return
	 */
	public List<CaseRegisterDomain> findAll();
	/**
	 * 查找部分
	 * @param firstResult
	 * @param maxReslt
	 * @return
	 */
	public QueryResultUtil findPart(int firstResult, int maxReslt);


}
