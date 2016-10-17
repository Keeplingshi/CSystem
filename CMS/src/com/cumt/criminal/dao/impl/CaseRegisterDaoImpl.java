package com.cumt.criminal.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cumt.criminal.dao.CaseRegisterDao;
import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;

public class CaseRegisterDaoImpl implements CaseRegisterDao{
	private Transaction tx = null;
	
	@Override
	public boolean addCaseRegister(CaseRegisterDomain caseRegister) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.save(caseRegister);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return true;
	}

	@Override
	public boolean deleteCaseRegister(CaseRegisterDomain caseRegister) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(caseRegister);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return true;
	}

	@Override
	public CaseRegisterDomain editCaseRegister(CaseRegisterDomain oldCR,
			CaseRegisterDomain newCR) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			System.out.println(newCR.getState()+"qqqqqqqqqqq"+oldCR.getState());
			oldCR = newCR;//更新了旧的刑事案件登记表
			session.update(oldCR);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return oldCR;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public CaseRegisterDomain queryCaseRegisterById(int id) {
		Session session = HibernateUtil.openSession();
		List<CaseRegisterDomain> caseRegisterList = null;
		try {
			 tx = session.beginTransaction();
			
			 caseRegisterList = session.createQuery("from CaseRegisterDomain where id="+id).list();
			 if (caseRegisterList.size() == 0) {
				 System.out.println(id+"没有");
				return null;
			}else {
				System.out.println(id+"有"+caseRegisterList.get(0).getId());
			}
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return caseRegisterList.get(0);
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil queryByState(String state) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		boolean s = false;
		if("未通过".equals(state)){
			s = false;
		}else {
			s = true;
		}
		Session session = HibernateUtil.openSession();
		List<CaseRegisterDomain> caseRegisterList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from CaseRegisterDomain where state="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 caseRegisterList = query.list();
			 queryResultUtil.setList(caseRegisterList);
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil queryByDay(String day) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<CaseRegisterDomain> caseRegisterList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from CaseRegisterDomain where day='"+day+"'");
			 
			 caseRegisterList = query.list();
			 queryResultUtil.setList(caseRegisterList);
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil queryByName(String Name) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<CaseRegisterDomain> caseRegisterList = null;
		try {
			 tx = session.beginTransaction();
			 String hql = "from CaseRegisterDomain as c where c.name='"+Name+"'";
			 System.out.println(hql+"=========");
			 Query query = session.createQuery(hql);
			 
			 caseRegisterList = query.list();
			 queryResultUtil.setList(caseRegisterList);
			 
			 tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

	
	@SuppressWarnings("unchecked")
	@Override
	public List<CaseRegisterDomain> findAll() {
		Session session = HibernateUtil.openSession();
		List<CaseRegisterDomain> caseRegisterList = null;
		try {
			 tx = session.beginTransaction();
			
			 caseRegisterList = session.createQuery("from CaseRegisterDomain").list();
			 
			 tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return caseRegisterList;
	}

	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		
		Session session = HibernateUtil.openSession();
		List<CaseRegisterDomain> caseRegisterList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from CaseRegisterDomain");
			 System.out.println("="+query.list().size());
			 if (query.list().size()<maxReslt) {
				maxReslt = query.list().size();
				System.out.println("数据库中的最小："+firstResult+"最大的行："+maxReslt);
			}
			 query.setFirstResult(firstResult-1);
			 query.setMaxResults(VarUtil.PageIndex);
			 System.out.println("firstResult:"+(firstResult-1)+" maxReslt:"+(maxReslt-1));
			 caseRegisterList = query.list();
			 System.out.println("数据库返回数值的长度"+caseRegisterList.size());
			 queryResultUtil.setCount(maxReslt-firstResult+1);
			 queryResultUtil.setList(caseRegisterList);
			 System.out.println("数据库返回数值的长度"+queryResultUtil.getList().size());
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}





}
