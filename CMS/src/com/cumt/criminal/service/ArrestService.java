package com.cumt.criminal.service;

import java.util.List;

import com.cumt.criminal.model.ArrestDomain;
import com.cumt.criminal.util.QueryResultUtil;

public interface ArrestService {
	/**
	 * 新加 拘留证
	 * @param legalInstrumentDomain
	 * @return
	 */
	public boolean addArrest(ArrestDomain Arrest);
	/**
	 * 删除 拘留证
	 * @param legalInstrumentDomain
	 * @return
	 */
	public boolean deleteArrest(ArrestDomain Arrest);
	/**
	 * 修改拘留证
	 * @param legalInstrumentDomain
	 * @return
	 */
	public ArrestDomain editArrest(ArrestDomain oldA, ArrestDomain newA);
	/**
	 * 查找拘留证
	 * @param legalInstrumentDomain
	 * @return
	 */
	public ArrestDomain queryArrest(int id);
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
	public QueryResultUtil queryByResultState(String resultState);
	/**
	 * 根据报案人
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByName(String name);
	/**
	 * 根据报案人
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByTime(String time);
	/**
	 * 查找所有的拘留证
	 * @return
	 */
	public List<ArrestDomain> findAll();
	/**
	 * 
	 * @param firstResult从列表的哪一个索引取数据
	 * @param maxReslt 最多取多少条数据
	 * @return 一页的数据列表
	 */
	public QueryResultUtil findAll(int firstResult,int maxReslt);
}
