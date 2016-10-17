package com.cumt.criminal.dao;

import java.util.List;

import com.cumt.criminal.model.StaffDomain;
import com.cumt.criminal.util.QueryResultUtil;

/**
 * 
 * @author {yuxiaoyan}}
 *	员工增删改查接口
 */
public interface StaffDao {

	/**
	 * 添加员工信息
	 * @return
	 */
	public boolean addStaff(Integer ID,String IDCard,String StaffName,String LoginName,String Pwd,String Identity,boolean loginState);
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
	 * 分页查询所有
	 * @param staffDomian
	 */
	public List<StaffDomain> findAll();
	/**
	 * 
	 * @param firstResult从列表的哪一个索引取数据
	 * @param maxReslt 最多取多少条数据
	 * @return 一页的数据列表
	 */
	public QueryResultUtil findAll(int firstResult,int maxReslt);
}
