package com.cb.csystem.service;

import java.util.List;

import com.cb.csystem.domain.FamilyDomain;
import com.cb.system.util.PageInfo;

public interface IFamilyService {
	
	/**
	 * 通过id获取家庭成员
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public FamilyDomain doGetById(String id)throws Exception;
	
	/**
	 * 获取家庭成员列表
	 * @return
	 * @throws Exception
	 */
	public List<FamilyDomain> doGetFilterList() throws Exception;
	
	/**
	 * 分页查询
	 * @return
	 * @throws Exception
	 */
	public List<FamilyDomain> doGetPageList(PageInfo pageInfo)throws Exception;
	
	/**
	 * 保存家庭成员
	 * @param familyDomain
	 * @return
	 * @throws Exception
	 */
	public boolean doSave(FamilyDomain familyDomain) throws Exception;
	
	/**
	 * 删除家庭成员
	 * @param id
	 * @return
	 * @throws Exception
	 */
	public boolean doDeleteById(String id) throws Exception;

	/**
	 * 家庭成员搜索
	 * @param pageInfo
	 * @return
	 * @throws Exception
	 */
	public List<FamilyDomain> doSearchPageList(PageInfo pageInfo) throws Exception;

	/**
	 * 批量删除
	 * @param FamilyIds
	 * @return
	 */
	public boolean doDeleteByIds(String[] familyIds)throws Exception;
}
