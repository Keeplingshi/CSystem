package com.cb.csystem.service.bean;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cb.csystem.dao.ILinkNoteDao;
import com.cb.csystem.domain.LinkNoteDomain;
import com.cb.csystem.service.ILinkNoteService;
import com.cb.csystem.util.Consts;
import com.cb.system.util.PageInfo;
import com.cb.system.util.ValidateUtil;

/**
 * 联系笔记基础服务类
 * @author Administrator
 *
 */
@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Throwable.class)
public class LinkNoteService implements ILinkNoteService{

	@Resource private ILinkNoteDao linkNoteDao;
	
	/**
	 * @see ILinkNoteService#doGetById(String)
	 */
	@Override
	public LinkNoteDomain doGetById(String id) throws Exception {
		// TODO Auto-generated method stub
		return linkNoteDao.getById(id);
	}

	/**
	 * @see ILinkNoteService#doGetFilterList()
	 */
	@Override
	public List<LinkNoteDomain> doGetFilterList() throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(LinkNoteDomain.class);
		detachedCriteria.addOrder(Order.desc("time"));
		return linkNoteDao.getFilterList(detachedCriteria);
	}

	/**
	 * @see ILinkNoteService#doGetPageList(PageInfo)
	 */
	@Override
	public List<LinkNoteDomain> doGetPageList(PageInfo pageInfo)
			throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(LinkNoteDomain.class);
		//默认按时间排序
		detachedCriteria.addOrder(Order.desc("time"));
		return linkNoteDao.getPageList(detachedCriteria, pageInfo);
	}

	/**
	 * @see ILinkNoteService#doSave(LinkNoteDomain)
	 */
	@Override
	public boolean doSave(LinkNoteDomain linkNoteDomain) throws Exception {
		// TODO Auto-generated method stub
		if(linkNoteDomain.getId()==null){
			return linkNoteDao.save(linkNoteDomain);
		}else{
			return linkNoteDao.update(linkNoteDomain);
		}
	}

	/**
	 * @see ILinkNoteService#doDeleteById(String)
	 */
	@Override
	public boolean doDeleteById(String id) throws Exception {
		// TODO Auto-generated method stub
		return linkNoteDao.deleteById(id);
	}

	/**
	 * @see ILinkNoteService#doSearchPageList(PageInfo, String, String, Date, Date, String, String, String)
	 */
	@Override
	public List<LinkNoteDomain> doSearchPageList(PageInfo pageInfo,
			String userId, String linkNoteTypeId, Date beginTime, Date endTime,
			String searchText, String sortMode, String sortValue)
			throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(LinkNoteDomain.class);
		if(ValidateUtil.isEmpty(userId)){
			return null;
		}
		detachedCriteria.add(Restrictions.eq("userId", userId));
		
		if(ValidateUtil.notEmpty(searchText)){
			detachedCriteria.createAlias("student", "qstu");
			//多条件过滤，此处名字，学号，公司
			Disjunction disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("qstu.name", searchText,MatchMode.ANYWHERE).ignoreCase());  
			disjunction.add(Restrictions.like("qstu.stuId", searchText,MatchMode.ANYWHERE).ignoreCase());  
			detachedCriteria.add(disjunction);
		}
		//类型
		if(ValidateUtil.notEmpty(linkNoteTypeId)){
			detachedCriteria.add(Restrictions.eq("linkNoteType.id", linkNoteTypeId));
		}
		//时间
		if(beginTime!=null){
			//大于等于
			detachedCriteria.add(Restrictions.ge("time", beginTime));
		}
		if(endTime!=null){
			//小于等于
			detachedCriteria.add(Restrictions.le("time", endTime));
		}
		
		//排序
		if(ValidateUtil.notEmpty(sortValue)){
			if(Consts.SORT_ASC.equals(sortMode)){
				detachedCriteria.addOrder(Order.asc(sortValue));
			}else{
				detachedCriteria.addOrder(Order.desc(sortValue));
			}
		}else{
			detachedCriteria.addOrder(Order.desc("time"));
		}
		
		return linkNoteDao.getPageList(detachedCriteria, pageInfo);
	}

	/**
	 * @see ILinkNoteService#doDeleteByIds(String[])
	 */
	@Override
	public boolean doDeleteByIds(String[] linkNoteIds) throws Exception {
		// TODO Auto-generated method stub
		boolean b=false;
		for(String id:linkNoteIds){
			b=linkNoteDao.deleteById(id);
			if(!b){
				return false;
			}
		}
		return b;
	}

	/**
	 * @see com.cb.csystem.service.ILinkNoteService#doSearchList(java.lang.String, java.lang.String, java.util.Date, java.util.Date)
	 */
	@Override
	public List<LinkNoteDomain> doSearchList(String userId,
			String linkNoteTypeId, Date beginTime, Date endTime)
			throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(LinkNoteDomain.class);
		if(ValidateUtil.isEmpty(userId)){
			return null;
		}
		detachedCriteria.add(Restrictions.eq("userId", userId));
		//类型
		if(ValidateUtil.notEmpty(linkNoteTypeId)){
			detachedCriteria.add(Restrictions.eq("linkNoteType.id", linkNoteTypeId));
		}
		//时间
		if(beginTime!=null){
			//大于等于
			detachedCriteria.add(Restrictions.ge("time", beginTime));
		}
		if(endTime!=null){
			//小于等于
			detachedCriteria.add(Restrictions.le("time", endTime));
		}
		detachedCriteria.addOrder(Order.desc("time"));
		
		return linkNoteDao.getFilterList(detachedCriteria);
	}

}
