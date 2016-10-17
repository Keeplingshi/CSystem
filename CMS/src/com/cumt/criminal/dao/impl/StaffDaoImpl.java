package com.cumt.criminal.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cumt.criminal.dao.StaffDao;
import com.cumt.criminal.model.StaffDomain;
import com.cumt.criminal.util.HibernateUtil;
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;


/**
 * 
 * @author {yuxiaoyan}}
 */
public class StaffDaoImpl implements StaffDao{
	
	private StaffDomain staffDomain;//定义表对应的实体
	private Transaction tx;
	private static ApplicationContext applicationContext;
	static{
		 applicationContext = new ClassPathXmlApplicationContext("com/cumt/config/applicationContext.xml");
	}
	
	@Override
	public boolean addStaff(Integer ID,String IDCard,String StaffName,String LoginName,String Pwd,String Identity,boolean loginState) {
		
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			staffDomain = new StaffDomain();
			
			staffDomain.setId(ID);
			staffDomain.setIdcard(IDCard);
			staffDomain.setStaffName(StaffName);
			staffDomain.setLoginName(LoginName);
			staffDomain.setLoginPwd(Pwd);
			staffDomain.setIdentify(Identity);
			staffDomain.setLoginState(loginState);
			session.save(staffDomain);
			
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
	public boolean deleteStaffByID(String ID) {
		Session session = HibernateUtil.openSession();
		try {
			 tx = session.beginTransaction();
			
			 StaffDomain staffDomain =  (StaffDomain) session.get(StaffDomain.class, Integer.parseInt(ID));
			session.delete(staffDomain);
			
			tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return true;
	}

	@Override
	public boolean deleteStaffByName(String LoginName) {
		Session session = HibernateUtil.openSession();
		try {
			 tx = session.beginTransaction();
			
//			session.delete(arg0);
			
			tx.commit();
			
		} catch (Exception e) {
			tx.rollback();
		}finally{
			session.close();
		}
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public StaffDomain queryStaffByName(String Name) {
		 List<StaffDomain> list = null;
		Session session = HibernateUtil.openSession();
		try {
		     tx = session.beginTransaction();
		     String hql="from StaffDomain as staff where staff.LoginName='"+Name+"'";   //from后面是对象，不是表名
			 Query query=session.createQuery(hql);
			list = query.list();
			if (list.size()==0) {
				System.out.println("查询结果为空");
				return null;
			}else {
				System.out.println("查询到结果");
			}
		    tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
			
		}finally{
			session.close();
		}
		
		return list.get(0);
	}

	@Override
	public boolean editStaffById(StaffDomain newOne,StaffDomain OldOne) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			OldOne = newOne;//更新了旧的刑事案件登记表
			session.update(OldOne);
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
	public List<StaffDomain> findAll() {
		Session session = HibernateUtil.openSession();
		List<StaffDomain> staffList = null;
		try {
			 tx = session.beginTransaction();
			staffList = session.createQuery("from StaffDomain").list();
			tx.commit();
			
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return staffList;
	}

	@SuppressWarnings("unchecked")
	@Override
	public QueryResultUtil findAll(int firstResult, int maxReslt) {
		
		Session session = HibernateUtil.openSession();
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		try {
			 tx = session.beginTransaction();
			 Query query = session.createQuery("from StaffDomain");
			 if (query.list().size()<maxReslt) {
					maxReslt = query.list().size();
				}
			 
			 		query.setFirstResult(firstResult-1);
			 		query.setMaxResults(VarUtil.PageIndex);
			List<StaffDomain> list = query.list();
			
			queryResultUtil.setCount(maxReslt-firstResult+1);
			queryResultUtil.setList(list);
			tx.commit();
			
		} catch (Exception e) 
		{   e.printStackTrace();
			tx.rollback();
		}finally{
			session.close();
		}
		return queryResultUtil;
	}

	@Override
	public QueryResultUtil queryBytrueName(String name) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		 List<StaffDomain> list = null;
			Session session = HibernateUtil.openSession();
			try {
			     tx = session.beginTransaction();
			     String hql="from StaffDomain as staff where staff.StaffName='"+name+"'";   //from后面是对象，不是表名
				 System.out.println(hql);Query query=session.createQuery(hql);
				list = query.list();
				queryResultUtil.setList(list);
				if (list.size()==0) {
					System.out.println("查询结果为空");
					return null;
				}else {
					System.out.println("查询到结果");
				}
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
	public QueryResultUtil queryByID(int id) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		 List<StaffDomain> list = null;
			Session session = HibernateUtil.openSession();
			try {
			     tx = session.beginTransaction();
			     String hql="from StaffDomain as staff where staff.Id='"+id+"'";   //from后面是对象，不是表名
				 Query query=session.createQuery(hql);
				 System.out.println(hql);
				list = query.list();
				queryResultUtil.setList(list);
				if (list.size()==0) {
					System.out.println("查询结果为空");
					return null;
				}else {
					System.out.println("查询到结果");
				}
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
	public QueryResultUtil queryByIDCard(String idcard) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		 List<StaffDomain> list = null;
			Session session = HibernateUtil.openSession();
			try {
			     tx = session.beginTransaction();
			     String hql="from StaffDomain as staff where staff.Idcard='"+idcard+"'";   //from后面是对象，不是表名
				 Query query=session.createQuery(hql);
				list = query.list();
				queryResultUtil.setList(list);
				if (list.size()==0) {
					System.out.println("查询结果为空");
					return null;
				}else {
					System.out.println("查询到结果");
				}
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
	public QueryResultUtil queryLoginState(String userName) {
		QueryResultUtil queryResultUtil = new QueryResultUtil();
		 List<StaffDomain> list = null;
			Session session = HibernateUtil.openSession();
			try {
			     tx = session.beginTransaction();
			     String hql="from StaffDomain as staff where staff.LoginName='"+userName+"'";   //from后面是对象，不是表名
				 Query query=session.createQuery(hql);
				list = query.list();
				queryResultUtil.setList(list);
				if (list.size()==0) {
					System.out.println("查询结果为空");
					return null;
				}else {
					System.out.println("查询到结果");
				}
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
	public boolean editBigIP(StaffDomain old,String BigIP) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			old.setIp(BigIP);;
			session.update(old);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return true;	}

	@Override
	public boolean editIP(StaffDomain old, String ip) {
		Session session = HibernateUtil.openSession();
		try {
			tx = session.beginTransaction();
			old.setIp(ip);;
			session.update(old);
			tx.commit();
			session.flush();
			session.close();
			
		} catch (Exception e) {
			tx.rollback();
			 e.printStackTrace(); 
		}
		return true;
	}
	
}
