package com.cb.csystem.service;

import java.util.Date;
import java.util.List;

import com.cb.csystem.domain.LinkNoteDomain;
import com.cb.system.util.PageInfo;

/**
 * 联系笔记基础服务类
 * @author Administrator
 *
 */
public interface ILinkNoteService {

	/**
	 * 通过id获取联系笔记
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public LinkNoteDomain doGetById(String id)throws Exception;
	
	/**
	 * 获取联系笔记列表
	 * @return
	 * @throws Exception
	 */
	public List<LinkNoteDomain> doGetFilterList() throws Exception;
	
	/**
	 * 分页查询
	 * @return
	 * @throws Exception
	 */
	public List<LinkNoteDomain> doGetPageList(PageInfo pageInfo)throws Exception;
	
	/**
	 * 保存联系笔记
	 * @param LinkNoteDomain
	 * @return
	 * @throws Exception
	 */
	public boolean doSave(LinkNoteDomain linkNoteDomain) throws Exception;
	
	/**
	 * 删除联系笔记
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean doDeleteById(String id) throws Exception;

	/**
	 * 联系笔记搜索
	 * @param pageInfo
	 * @param linkNoteTypeId
	 * @param beginTime
	 * @param endTime
	 * @param searchText
	 * @param sortMode
	 * @param sortValue
	 * @return
	 * @throws Exception
	 */
	public List<LinkNoteDomain> doSearchPageList(PageInfo pageInfo,String userId,
			String linkNoteTypeId, Date beginTime, Date endTime,
			String searchText, String sortMode, String sortValue) throws Exception;

	/**
	 * 批量删除
	 * @param LinkNoteIds
	 * @return
	 */
	public boolean doDeleteByIds(String[] linkNoteIds)throws Exception;

	/**
	 * 搜索
	 * @param userId
	 * @param linkNoteTypeId
	 * @param beginTime
	 * @param endTime
	 * @return
	 */
	public List<LinkNoteDomain> doSearchList(String userId, String linkNoteTypeId,
			Date beginTime, Date endTime)throws Exception;
	
}
