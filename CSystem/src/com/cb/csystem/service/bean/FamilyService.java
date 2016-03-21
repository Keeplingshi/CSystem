package com.cb.csystem.service.bean;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cb.csystem.dao.IFamilyDao;
import com.cb.csystem.domain.FamilyDomain;
import com.cb.csystem.service.IFamilyService;
import com.cb.system.util.PageInfo;

@Service
@Transactional(propagation=Propagation.REQUIRED,rollbackFor=Throwable.class)
public class FamilyService implements IFamilyService{

	@Resource private IFamilyDao familyDao;
	
	/**
	 * @see IFamilyService#doGetById(String)
	 */
	@Override
	public FamilyDomain doGetById(String id) throws Exception {
		// TODO Auto-generated method stub
		
		return familyDao.getById(id);
	}

	/**
	 * @see IFamilyService#doGetFilterList()
	 */
	@Override
	public List<FamilyDomain> doGetFilterList() throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(FamilyDomain.class);
		return familyDao.getFilterList(detachedCriteria);
	}

	/**
	 * @see IFamilyService#doGetPageList(PageInfo)
	 */
	@Override
	public List<FamilyDomain> doGetPageList(PageInfo pageInfo) throws Exception {
		// TODO Auto-generated method stub
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(FamilyDomain.class);
		return familyDao.getPageList(detachedCriteria, pageInfo);
	}

	/**
	 * @see IFamilyService#doSave(FamilyDomain)
	 */
	@Override
	public boolean doSave(FamilyDomain familyDomain) throws Exception {
		// TODO Auto-generated method stub
		
		if(familyDomain.getId()==null){
			return familyDao.save(familyDomain);
		}else{
			return familyDao.update(familyDomain);
		}
	}

	/**
	 * @see IFamilyService#doDeleteById(String)
	 */
	@Override
	public boolean doDeleteById(String id) throws Exception {
		// TODO Auto-generated method stub
		return familyDao.deleteById(id);
	}

	/**
	 * @see IFamilyService#doSearchPageList(PageInfo)
	 */
	@Override
	public List<FamilyDomain> doSearchPageList(PageInfo pageInfo)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * @see IFamilyService#doDeleteByIds(String[])
	 */
	@Override
	public boolean doDeleteByIds(String[] familyIds) throws Exception {
		// TODO Auto-generated method stub
		boolean b=false;
		for(String id:familyIds){
			b=familyDao.deleteById(id);
			if(!b){
				return false;
			}
		}
		
		return b;
	}

}
