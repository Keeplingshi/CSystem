package com.cumt.criminal.service;

import java.util.List;

import com.cumt.criminal.model.QrecordDomain;
import com.cumt.criminal.util.QueryResultUtil;

public interface QrecordService {
	/**
	 * 添加询问记录信息
	 * @return
	 */
	public boolean addQRecord(QrecordDomain qrecordDomain);
	/**
	 * 通过ID删除询问记录
	 * @param ID
	 * @return
	 */
	public boolean deleteQRecord(QrecordDomain qrecordDomain);
	/**
	 * 通过询问记录id查找员工
	 * @param ID
	 * @return
	 */
	public QrecordDomain queryQRecordById(int ID);
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
	 * 通过询问记录的id修改询问记录
	 * @param ID
	 * @return
	 */
	public QrecordDomain editQRecordById(QrecordDomain oldQR,QrecordDomain newQR);
	/**
	 * 分页查询所有
	 * @param staffDomian
	 */
	public List<QrecordDomain> findAll();
	/**
	 * 
	 * @param firstResult从列表的哪一个索引取数据
	 * @param maxReslt 最多取多少条数据
	 * @return 一页的数据列表
	 */
	public QueryResultUtil findPart(int firstResult,int maxReslt);
}
