package com.cumt.criminal.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import com.cumt.criminal.dao.ArrestDao;
import com.cumt.criminal.model.ArrestDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;

public class ArrestDaoImpl implements ArrestDao {
	private Transaction tx;
	@Override
	public boolean addArrest(ArrestDomain Arrest) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.save(Arrest);
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
	public boolean deleteArrest(ArrestDomain Arrest) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(Arrest);
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
	public ArrestDomain editArrest(ArrestDomain oldA, ArrestDomain newA) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			oldA = newA;//更新了旧的刑事案件登记表
			session.update(oldA);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return oldA;
	}

	@SuppressWarnings("unchecked")
	@Override
	public ArrestDomain queryArrest(int id) {
		Session session = HibernateUtil.openSession();
		List<ArrestDomain> ArrestDomainList = null;
		try {
			 tx = session.beginTransaction();
			
			 ArrestDomainList = session.createQuery("from ArrestDomain where caseRegisterId="+id).list();
			 if (ArrestDomainList.size() == 0) {
				 System.out.println(id+"没有");
				return null;
			}else {
				System.out.println(id+"有"+ArrestDomainList.get(0).getId());
			}
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return ArrestDomainList.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ArrestDomain> findAll() {
		Session session = HibernateUtil.openSession();
		List<ArrestDomain> ArrestDomainList = null;
		try {
			 tx = session.beginTransaction();
			
			 ArrestDomainList = session.createQuery("from ArrestDomain").list();
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return ArrestDomainList;
	}

	@Override
	public QueryResultUtil findAll(int firstResult, int maxReslt) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		Session session = HibernateUtil.openSession();
		List<ArrestDomain> ArrestDomainList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from ArrestDomain");
			 if (query.list().size()<maxReslt) {
				maxReslt = query.list().size();
				System.out.println("数据库中的最小："+firstResult+"最大的行："+maxReslt);
			}
			 query.setFirstResult(firstResult-1);
			 query.setMaxResults(VarUtil.PageIndex);
			 
			 ArrestDomainList = query.list();
			 System.out.println("数据库返回数值的长度"+ArrestDomainList.size());
			 queryResultUtil.setCount(maxReslt-firstResult+1);
			 queryResultUtil.setList(ArrestDomainList);
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
		List<ArrestDomain> arrestList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from ArrestDomain where state="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 arrestList = query.list();
			 queryResultUtil.setList(arrestList);
			 
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
		List<ArrestDomain> arrestList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from ArrestDomain where resultState="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 arrestList = query.list();
			 queryResultUtil.setList(arrestList);
			 
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
		List<ArrestDomain> arrestList = null;
		try {
			 tx = session.beginTransaction();
			 String hql = "from ArrestDomain as c where c.handleName='"+name+"'";
			 System.out.println(hql+"=========");
			 Query query = session.createQuery(hql);
			 
			 arrestList = query.list();
			 queryResultUtil.setList(arrestList);
			 
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
		List<ArrestDomain> arrestList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from ArrestDomain where time='"+time+"'");
			 
			 arrestList = query.list();
			 queryResultUtil.setList(arrestList);
			 
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
