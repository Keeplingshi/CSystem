package com.cb.csystem.service.bean;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.cb.csystem.dao.IFamilyDao;
import com.cb.csystem.domain.FamilyDomain;
import com.cb.csystem.service.IFamilyService;
import com.cb.system.util.PageInfo;
import com.cb.system.util.ValidateUtil;

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
	public List<FamilyDomain> doSearchPageList(PageInfo pageInfo
			,String searchText,String collegeId,String gradeId)throws Exception {
		// TODO Auto-generated method stub
		
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(FamilyDomain.class);
		detachedCriteria.createAlias("student", "qstu");
		detachedCriteria.createAlias("qstu.classDomain", "qclazz");
		
		if(ValidateUtil.notEmpty(collegeId)){
			//学院过滤
			detachedCriteria.createAlias("qclazz.major", "qmajor");
			detachedCriteria.createAlias("qmajor.college", "qcollege");
			detachedCriteria.add(Restrictions.eq("qcollege.id", collegeId));
		}
		if(ValidateUtil.notEmpty(gradeId)){
			//年级过滤
			detachedCriteria.createAlias("qclazz.grade", "qgrade");
			detachedCriteria.add(Restrictions.eq("qgrade.id", gradeId));
		}
		
		if(ValidateUtil.notEmpty(searchText)){
			//多条件过滤，此处名字，学号
			Disjunction disjunction = Restrictions.disjunction();
			disjunction.add(Restrictions.like("qstu.name", searchText,MatchMode.ANYWHERE).ignoreCase());  
			disjunction.add(Restrictions.like("qstu.stuId", searchText,MatchMode.ANYWHERE).ignoreCase());  
			detachedCriteria.add(disjunction);
		}
		
		return familyDao.getPageList(detachedCriteria, pageInfo);
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
