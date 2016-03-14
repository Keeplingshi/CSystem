package com.cb.csystem.service.bean;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cb.csystem.dao.ILinkNoteTypeDao;
import com.cb.csystem.domain.LinkNoteTypeDomain;
import com.cb.csystem.service.ILinkNoteTypeService;

/**
 * 
 * @author Administrator
 *
 */
@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Throwable.class)
public class LinkNoteTypeService implements ILinkNoteTypeService {

	@Resource private ILinkNoteTypeDao iLinkNoteTypeDao;
	
	/**
	 * @see ILinkNoteTypeService#doGetById(String)
	 */
	@Override
	public LinkNoteTypeDomain doGetById(String id) throws Exception {
		// TODO Auto-generated method stub
		return iLinkNoteTypeDao.getById(id);
	}

	/**
	 * @see ILinkNoteTypeService#doGetFilterList()
	 */
	@Override
	public List<LinkNoteTypeDomain> doGetFilterList() throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(LinkNoteTypeDomain.class);
		return iLinkNoteTypeDao.getFilterList(detachedCriteria);
	}

	/**
	 * @see ILinkNoteTypeService#doSave(LinkNoteTypeDomain)
	 */
	@Override
	public boolean doSave(LinkNoteTypeDomain linkNoteTypeDomain)
			throws Exception {
		// TODO Auto-generated method stub
		if(linkNoteTypeDomain.getId()==null){
			return iLinkNoteTypeDao.save(linkNoteTypeDomain);
		}else{
			return iLinkNoteTypeDao.update(linkNoteTypeDomain);
		}
	}

	/**
	 * @see ILinkNoteTypeService#doDeleteById(String)
	 */
	@Override
	public boolean doDeleteById(String id) throws Exception {
		// TODO Auto-generated method stub
		return iLinkNoteTypeDao.deleteById(id);
	}

}
