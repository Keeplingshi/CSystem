package com.cumt.criminal.service;

import java.util.List;

import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.model.StaffDomain;
import com.cumt.criminal.util.QueryResultUtil;


public interface StaffService {
	/**
	 * 添加员工信息
	 * @return
	 */
	public void addStaff(Integer ID,String IDCard,String StaffName,String LoginName,String Pwd,String Identity,boolean loginState);
	/**
	 * 通过员工ID删除员工
	 * @param ID
	 * @return
	 */
	public boolean deleteStaffByID(String ID);
	/**
	 * 通过员工登录名删除员工
	 * @param LoginName
	 * @return
	 */
	public boolean deleteStaffByName(String LoginName);
	/**
	 * 通过员工登录名查找员工
	 * @param LoginName
	 * @return
	 */
	public StaffDomain queryStaffByName(String LoginName);
	/**
	 * 根据真实姓名
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryBytrueName(String name);
	/**
	 * 根据犯案时间查找
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByID(int id);
	/**
	 * 根据身份证号查找
	 * @param name
	 * @return
	 */
	public QueryResultUtil queryByIDCard(String idcard);
	/**
	 * 查询员工的登录状态
	 * @param userName
	 * @return
	 */
	public QueryResultUtil queryLoginState(String userName);
	/**
	 * 通过员工的id修改员工
	 * @param ID
	 * @return
	 */
	public boolean editStaffById(StaffDomain newOne,StaffDomain OldOne);
	/**
	 * 通过员工登录名修改登录状态
	 * @param username
	 * @return
	 */
	public boolean editBigIP(StaffDomain old,String BigIP);
	/**
	 * 修改ip
	 * @param old
	 * @param ip
	 * @return
	 */
	public boolean editIP(StaffDomain old,String ip);
	/**
	 * 查找所有的
	 * @return
	 */
	public List<StaffDomain> findAll();
	/**
	 * 查找部分
	 * @param firstResult
	 * @param maxReslt
	 * @return
	 */
	public QueryResultUtil findPart(int firstResult, int maxReslt);
}
