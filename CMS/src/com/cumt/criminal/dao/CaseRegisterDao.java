package com.cumt.criminal.dao;

import java.util.List;

import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.util.QueryResultUtil;
/**
 * 刑事案件登记表
 * @author {yuxiaoyan}}
 *
 */
public interface CaseRegisterDao {
	/**
	 * 新加  案件登记表
	 * @param caseRegister
	 * @return
	 */
	public boolean addCaseRegister(CaseRegisterDomain caseRegister);
	/**
	 * 删除 案件登记表
	 * @param caseRegister
	 * @return
	 */
	public boolean deleteCaseRegister(CaseRegisterDomain caseRegister);
	/**
	 * 修改刑事案件登记表
	 * @param oldCR
	 * @param newCR
	 * @return
	 */
	public CaseRegisterDomain editCaseRegister(CaseRegisterDomain oldCR,CaseRegisterDomain newCR);
	/**
	 * 通过id查找刑事案件登记表
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
	 * 查找所有的信息登记表
	 * @param caseRegister
	 * @return
	 */
	public List<CaseRegisterDomain> findAll();
	/**
	 * 
	 * @param firstResult从列表的哪一个索引取数据
	 * @param maxReslt 最多取多少条数据
	 * @return 一页的数据列表
	 */
	public QueryResultUtil findPart(int firstResult,int maxReslt);
	
}
