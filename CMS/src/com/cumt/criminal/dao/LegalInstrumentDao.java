package com.cumt.criminal.dao;

import java.util.List;

import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.util.QueryResultUtil;

/**
 * 
 * @author {yuxiaoyan}}
 *
 */
public interface LegalInstrumentDao {
	/**
	 * 新加 刑事法律呈请
	 * @param legalInstrumentDomain
	 * @return
	 */
	public boolean addLegalInstrumentLegalInstrument(LegalInstrumentDomain legalInstrumentDomain);
	/**
	 * 删除 刑事法律呈请
	 * @param legalInstrumentDomain
	 * @return
	 */
	public boolean deleteLegalInstrument(LegalInstrumentDomain legalInstrumentDomain);
	/**
	 * 修改刑事法律呈请
	 * @param legalInstrumentDomain
	 * @return
	 */
	public LegalInstrumentDomain editLegalInstrument(LegalInstrumentDomain oldLD, LegalInstrumentDomain newLD);
	/**
	 * 查找刑事法律呈请
	 * @param legalInstrumentDomain
	 * @return
	 */
	public LegalInstrumentDomain queryLegalInstrument(int id);
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
	 * 查找所有的刑事法律呈请
	 * @return
	 */
	public List<LegalInstrumentDomain> findAll();
	/**
	 * 
	 * @param firstResult从列表的哪一个索引取数据
	 * @param maxReslt 最多取多少条数据
	 * @return 一页的数据列表
	 */
	public QueryResultUtil findAll(int firstResult,int maxReslt);
}
