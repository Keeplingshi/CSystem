package com.cumt.criminal.dao;

import java.util.List;

import com.cumt.criminal.model.CheckrecordDomian;
import com.cumt.criminal.util.QueryResultUtil;

/**
 * 
 * @author {yuxiaoyan}}
 *
 */
public interface CheckRecordDao {
	/**
	 * 新加 检查笔录
	 * @param checkrecordDomian
	 * @return
	 */
	public boolean addCheckDomain(CheckrecordDomian checkrecordDomian);
	/**
	 * 删除 检查笔录
	 * @param checkrecordDomian
	 * @return
	 */
	public boolean deleteCheckDomain(CheckrecordDomian checkrecordDomian);
	/** 
	 * 修改 检查笔录
	 * @param checkrecordDomian
	 * @return
	 */
	public CheckrecordDomian editCheckDomain(CheckrecordDomian oldCR, CheckrecordDomian newCR);
	/**
	 * 查找  检查笔录
	 * @param checkrecordDomian
	 * @return
	 */
	public CheckrecordDomian queryCheckDomain(int id);
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
	 * 查找所有的检查笔录
	 * @return
	 */
	public List<CheckrecordDomian> findAll();
	/**
	 * 
	 * @param firstResult从列表的哪一个索引取数据
	 * @param maxReslt 最多取多少条数据
	 * @return 一页的数据列表
	 */
	public QueryResultUtil findPart(int firstResult,int maxReslt);
}
