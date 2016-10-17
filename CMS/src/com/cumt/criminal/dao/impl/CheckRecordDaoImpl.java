package com.cumt.criminal.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cumt.criminal.dao.CheckRecordDao;
import com.cumt.criminal.model.CheckrecordDomian;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.model.QrecordDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;

public class CheckRecordDaoImpl implements CheckRecordDao {
	private Transaction tx;
	@Override
	public boolean addCheckDomain(CheckrecordDomian checkrecordDomian) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.save(checkrecordDomian);
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
	public boolean deleteCheckDomain(CheckrecordDomian checkrecordDomian) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(checkrecordDomian);
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
	public CheckrecordDomian editCheckDomain(CheckrecordDomian oldCR,
			CheckrecordDomian newCR) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
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
	public CheckrecordDomian queryCheckDomain(int id) {
		Session session = HibernateUtil.openSession();
		List<CheckrecordDomian> checkrecordDomainList = null;
		try {
			 tx = session.beginTransaction();
			
			 checkrecordDomainList = session.createQuery("from CheckrecordDomian where caseRegisterId="+id).list();
			 if (checkrecordDomainList.size() == 0) {
				 System.out.println(id+"没有");
				return null;
			}else {
				System.out.println(id+"有"+checkrecordDomainList.get(0).getId());
			}
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return checkrecordDomainList.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<CheckrecordDomian> findAll() {
		Session session = HibernateUtil.openSession();
		List<CheckrecordDomian> CheckrecordDomainList = null;
		try {
			 tx = session.beginTransaction();
			
			 CheckrecordDomainList = session.createQuery("from CheckrecordDomian").list();
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return CheckrecordDomainList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<CheckrecordDomian> checkRecordList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from CheckrecordDomian");
			 if (query.list().size()<maxReslt) {
				maxReslt = query.list().size();
				System.out.println("数据库中的最小："+firstResult+"最大的行："+maxReslt);
			}
			 query.setFirstResult(firstResult-1);
			 query.setMaxResults(VarUtil.PageIndex);
			 
			 checkRecordList = query.list();
			 System.out.println("数据库返回数值的长度"+checkRecordList.size());
			 queryResultUtil.setCount(maxReslt-firstResult+1);
			 queryResultUtil.setList(checkRecordList);
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

	@Override
	public QueryResultUtil queryByState(String state) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		boolean s = false;
		if("未审核".equals(state)){
			s = false;
		}else {
			s = true;
		}
		Session session = HibernateUtil.openSession();
		List<CheckrecordDomian> checkList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from CheckrecordDomian where state="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 checkList = query.list();
			 queryResultUtil.setList(checkList);
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

	@Override
	public QueryResultUtil queryByResultState(String resultState) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		boolean s = false;
		if("未通过".equals(resultState)){
			s = false;
		}else {
			s = true;
		}
		Session session = HibernateUtil.openSession();
		List<CheckrecordDomian> checkList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from CheckrecordDomian where resultState="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 checkList = query.list();
			 queryResultUtil.setList(checkList);
			 
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
