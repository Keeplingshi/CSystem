package com.cumt.criminal.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cumt.criminal.dao.DetentionDao;
import com.cumt.criminal.model.DetentionDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;

public class DetentionDaoImpl implements DetentionDao {
	
	private Transaction tx;
	@Override
	public boolean addDetention(DetentionDomain detention) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.save(detention);
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
	public boolean deleteDetention(DetentionDomain detention) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(detention);
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
	public DetentionDomain editDetention(DetentionDomain oldD,
			DetentionDomain newD) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			oldD = newD;//更新了旧的刑事案件登记表
			session.update(oldD);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return oldD;
	}

	@SuppressWarnings("unchecked")
	@Override
	public DetentionDomain queryDetention(int id) {
		Session session = HibernateUtil.openSession();
		List<DetentionDomain> DetentionList = null;
		try {
			 tx = session.beginTransaction();
			
			 DetentionList = session.createQuery("from DetentionDomain where caseRegisterId="+id).list();
			 if (DetentionList.size() == 0) {
				 System.out.println(id+"没有");
				return null;
			}else {
				System.out.println(id+"有"+DetentionList.get(0).getId());
			}
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return DetentionList.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<DetentionDomain> findAll() {
		Session session = HibernateUtil.openSession();
		List<DetentionDomain> DetentionList = null;
		try {
			 tx = session.beginTransaction();
			
			 DetentionList = session.createQuery("from DetentionDomain").list();
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return DetentionList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil findAll(int firstResult, int maxReslt) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<DetentionDomain> DetentionList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from DetentionDomain");
			 if (query.list().size()<maxReslt) {
				maxReslt = query.list().size();
				System.out.println("数据库中的最小："+firstResult+"最大的行："+maxReslt);
			}
			 query.setFirstResult(firstResult-1);
			 query.setMaxResults(VarUtil.PageIndex);
			 
			 DetentionList = query.list();
			 System.out.println("数据库返回数值的长度"+DetentionList.size());
			 queryResultUtil.setCount(maxReslt-firstResult+1);
			 queryResultUtil.setList(DetentionList);
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
		List<DetentionDomain> detentionDomains = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from DetentionDomain where state="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 detentionDomains = query.list();
			 queryResultUtil.setList(detentionDomains);
			 
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
		List<DetentionDomain> detentionDomains = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from DetentionDomain where resultState="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 detentionDomains = query.list();
			 queryResultUtil.setList(detentionDomains);
			 
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
		List<DetentionDomain> detentionDomains = null;
		try {
			 tx = session.beginTransaction();
			 String hql = "from DetentionDomain as c where c.handleName='"+name+"'";
			 System.out.println(hql+"=========");
			 Query query = session.createQuery(hql);
			 
			 detentionDomains = query.list();
			 queryResultUtil.setList(detentionDomains);
			 
			 tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

	@Override
	public QueryResultUtil queryByTime(String time) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<DetentionDomain> detentionDomains = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from DetentionDomain where time='"+time+"'");
			 
			 detentionDomains = query.list();
			 queryResultUtil.setList(detentionDomains);
			 
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
