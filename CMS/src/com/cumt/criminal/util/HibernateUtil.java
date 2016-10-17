package com.cumt.criminal.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

@SuppressWarnings("deprecation")
public class HibernateUtil {
	//全局只需要一个就好
	private static SessionFactory sessionFactory;
	
	//获取sessionFactory
	static{
		Configuration cfg = new Configuration();
		cfg.configure("com/cumt/config/hibernate.cfg.xml");
	    sessionFactory = cfg.buildSessionFactory();
	}
	/**
	 * 获取全局唯一的sessionFactory
	 * @return
	 */
	public static SessionFactory getSessionFactory(){
		
		return sessionFactory;
	}
	
	public static Session openSession(){
		return sessionFactory.openSession();
	}
	
}
