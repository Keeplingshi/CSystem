package com.cumt.criminal.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.cumt.criminal.dao.QRecordDao;
import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.model.QrecordDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;


public class QRecordDaoImpl implements QRecordDao{

	private Transaction tx;
	@Override
	public boolean addQRecord(QrecordDomain qrecordDomain) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.save(qrecordDomain);
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
	public boolean deleteQRecord(QrecordDomain qrecordDomain) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			session.delete(qrecordDomain);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return true;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public QrecordDomain queryQRecordById(int id) {
		Session session = HibernateUtil.openSession();
		List<QrecordDomain> qrecordDomainList = null;
		try {
			 tx = session.beginTransaction();
			
			 qrecordDomainList = session.createQuery("from QrecordDomain where caseRegisterId="+id).list();
			 if (qrecordDomainList.size() == 0) {
				 System.out.println(id+"没有");
				return null;
			}else {
				System.out.println(id+"有"+qrecordDomainList.get(0).getId());
			}
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return qrecordDomainList.get(0);
	}

	@Override
	public QrecordDomain editQRecordById(QrecordDomain oldQR,QrecordDomain newQR) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			oldQR = newQR;//更新了旧的刑事案件登记表
			oldQR.setState(newQR.getState());
			oldQR.setResultState(newQR.getResultState());
			session.update(oldQR);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return oldQR;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<QrecordDomain> findAll() {
		Session session = HibernateUtil.openSession();
		List<QrecordDomain> qrecordList = null;
		try {
			 tx = session.beginTransaction();
			
			 qrecordList = session.createQuery("from QrecordDomain").list();
			 
			 tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		return qrecordList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		
		Session session = HibernateUtil.openSession();
		List<QrecordDomain> qrecordList = null;
		try {
			 tx = session.beginTransaction();
			
			 Query query = session.createQuery("from QrecordDomain");
			 if (query.list().size()<maxReslt) {
				maxReslt = query.list().size();
				System.out.println("数据库中的最小："+firstResult+"最大的行："+maxReslt);
			}
			 query.setFirstResult(firstResult-1);
			 query.setMaxResults(VarUtil.PageIndex);
			 
			 qrecordList = query.list();
			 System.out.println("数据库返回数值的长度"+qrecordList.size());
			 queryResultUtil.setCount(maxReslt-firstResult+1);
			 queryResultUtil.setList(qrecordList);
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

	@SuppressWarnings("unchecked")
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
		List<QrecordDomain> qrecordList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from QrecordDomain where state="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 qrecordList = query.list();
			 queryResultUtil.setList(qrecordList);
			 
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
		List<QrecordDomain> qrecordList = null;
		try {
			 tx = session.beginTransaction();
			String hqlString = "from QrecordDomain where resultState="+s;
			System.out.println(hqlString+"------------------------------");
			 Query query = session.createQuery(hqlString);
			 
			 qrecordList = query.list();
			 queryResultUtil.setList(qrecordList);
			 
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
		List<QrecordDomain> qrecordList = null;
		try {
			 tx = session.beginTransaction();
			 String hql = "from QrecordDomain as c where c.handleStaff='"+name+"'";
			 Query query = session.createQuery(hql);
			 
			 qrecordList = query.list();
			 queryResultUtil.setList(qrecordList);
			 
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
		List<QrecordDomain> qrecordList = null;
		try {
			 tx = session.beginTransaction();
			 String hql = "from QrecordDomain as c where c.askTime='"+time+"'";
			 Query query = session.createQuery(hql);
			 
			 qrecordList = query.list();
			 queryResultUtil.setList(qrecordList);
			 
			 tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

}
