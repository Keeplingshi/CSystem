package com.cumt.criminal.service;

import java.util.List;

import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.util.QueryResultUtil;


public interface LegalInstrumentService {
	/**
	 * 新加一个案件登记
	 * @param caseRegister
	 */
	public void addLegalInstrument(LegalInstrumentDomain legalInstrumentDomain);
	/**
	 * 删除某一个刑事案件登记表
	 * @param id
	 * @return
	 */
	public boolean delLegalInstrument(LegalInstrumentDomain legalInstrumentDomain);
	/**
	 * 修改刑事案件登记表
	 * @param oldCR
	 * @param newCR
	 * @return
	 */
	public LegalInstrumentDomain editLegalInstrument(LegalInstrumentDomain oldLD,LegalInstrumentDomain newLD);
	/**
	 * 根据id查找刑事案件
	 * @param id
	 * @return
	 */
	public LegalInstrumentDomain queryLegalInstrumentById(int id);
	/**
	 * 根据处理状态
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByState(String state);
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
	public List<LegalInstrumentDomain> findAll();
	/**
	 * 查找部分
	 * @param firstResult
	 * @param maxReslt
	 * @return
	 */
	public QueryResultUtil findPart(int firstResult, int maxReslt);
}
