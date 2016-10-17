package com.cumt.criminal.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cumt.criminal.dao.LegalInstrumentDao;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;

public class LegalInstrumentDaoImpl implements LegalInstrumentDao {

	private Transaction tx;
	@Override
	public boolean addLegalInstrumentLegalInstrument(
			LegalInstrumentDomain legalInstrumentDomain) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.save(legalInstrumentDomain);
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
	public boolean deleteLegalInstrument(
			LegalInstrumentDomain legalInstrumentDomain) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(legalInstrumentDomain);
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
	public LegalInstrumentDomain editLegalInstrument(LegalInstrumentDomain oldLD, LegalInstrumentDomain newLD) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			oldLD = newLD;//更新了旧的刑事案件登记表
			session.update(oldLD);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return oldLD;
	}

	@SuppressWarnings("unchecked")
	@Override
	public LegalInstrumentDomain queryLegalInstrument(int id) {
		Session session = HibernateUtil.openSession();
		List<LegalInstrumentDomain> LegalInstrumentList = null;
		try {
			 tx = session.beginTransaction();
			
			 LegalInstrumentList = session.createQuery("from LegalInstrumentDomain where id="+id).list();
			 if (LegalInstrumentList.size() == 0) {
				 System.out.println(id+"没有");
				return null;
			}else {
				System.out.println(id+"有"+LegalInstrumentList.get(0).getId());
			}
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return LegalInstrumentList.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<LegalInstrumentDomain> findAll() {
		Session session = HibernateUtil.openSession();
		List<LegalInstrumentDomain> LegalInstrumentList = null;
		try {
			 tx = session.beginTransaction();
			
			 LegalInstrumentList = session.createQuery("from LegalInstrumentDomain").list();
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return LegalInstrumentList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil findAll(int firstResult, int maxReslt) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<LegalInstrumentDomain> LegalInstrumentList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from LegalInstrumentDomain");
			 if (query.list().size()<maxReslt) {
				maxReslt = query.list().size();
				System.out.println("数据库中的最小："+firstResult+"最大的行："+maxReslt);
			}
			 query.setFirstResult(firstResult-1);
			 query.setMaxResults(VarUtil.PageIndex);
			 
			 LegalInstrumentList = query.list();
			 System.out.println("数据库返回数值的长度"+LegalInstrumentList.size());
			 queryResultUtil.setCount(maxReslt-firstResult+1);
			 queryResultUtil.setList(LegalInstrumentList);
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
		if("未通过".equals(state)){
			s = false;
		}else {
			s = true;
		}
		Session session = HibernateUtil.openSession();
		List<LegalInstrumentDomain> legalInstrumentList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from LegalInstrumentDomain where result_state="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 legalInstrumentList = query.list();
			 queryResultUtil.setList(legalInstrumentList);
			 
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
	public QueryResultUtil queryByName(String name) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<LegalInstrumentDomain> legalInstrumentList = null;
		try {
			 tx = session.beginTransaction();
			 String hql = "from LegalInstrumentDomain as c where c.staffName='"+name+"'";
			 System.out.println(hql+"=========");
			 Query query = session.createQuery(hql);
			 
			 legalInstrumentList = query.list();
			 queryResultUtil.setList(legalInstrumentList);
			 System.out.println(legalInstrumentList.size());
			 tx.commit();
			 System.out.println("===========");
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

}
