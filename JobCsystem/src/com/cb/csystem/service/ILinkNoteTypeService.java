package com.cb.csystem.service;

import java.util.List;

import com.cb.csystem.domain.LinkNoteTypeDomain;

/**
 * 联系笔记基础服务类
 * @author Administrator
 *
 */
public interface ILinkNoteTypeService {

	/**
	 * 通过id获取联系笔记类型
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public LinkNoteTypeDomain doGetById(String id)throws Exception;
	
	/**
	 * 获取联系笔记类型列表
	 * @return
	 * @throws Exception
	 */
	public List<LinkNoteTypeDomain> doGetFilterList() throws Exception;
	
	/**
	 * 保存联系笔记类型
	 * @param LinkNoteTypeDomain
	 * @return
	 * @throws Exception
	 */
	public boolean doSave(LinkNoteTypeDomain linkNoteTypeDomain) throws Exception;
	
	/**
	 * 删除联系笔记类型
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean doDeleteById(String id) throws Exception;
	
}
