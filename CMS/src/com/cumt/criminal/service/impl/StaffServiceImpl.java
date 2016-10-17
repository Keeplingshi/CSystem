package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.StaffDao;
import com.cumt.criminal.dao.impl.StaffDaoImpl;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.model.StaffDomain;
import com.cumt.criminal.service.StaffService;
import com.cumt.criminal.util.QueryResultUtil;

public class StaffServiceImpl implements StaffService{

	private StaffDao staffDao = new StaffDaoImpl();
	
	@Override
	public void addStaff(Integer ID, String IDCard, String StaffName,String LoginName, String Pwd,
			String Identity,boolean loginState) {
		staffDao.addStaff(ID, IDCard,StaffName, LoginName, Pwd, Identity,loginState);
	}

	@Override
	public boolean deleteStaffByID(String ID) {
		return staffDao.deleteStaffByID(ID);
	}

	@Override
	public boolean deleteStaffByName(String LoginName) {
		return staffDao.deleteStaffByName(LoginName);
	}

	@Override
	public StaffDomain queryStaffByName(String LoginName) {
		return staffDao.queryStaffByName(LoginName);
	}


	@Override
	public List<StaffDomain> findAll() {
		return staffDao.findAll();
	}
	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		return staffDao.findAll(firstResult, maxReslt);
	}

	@Override
	public QueryResultUtil queryBytrueName(String name) {
		return staffDao.queryBytrueName(name);
	}

	@Override
	public QueryResultUtil queryByID(int id) {
		return staffDao.queryByID(id);
	}

	@Override
	public QueryResultUtil queryByIDCard(String idcard) {
		return staffDao.queryByIDCard(idcard);
	}

	@Override
	public QueryResultUtil queryLoginState(String userName) {
		return staffDao.queryLoginState(userName);
	}

	@Override
	public boolean editBigIP(StaffDomain old,String BigIP) {
		return staffDao.editBigIP(old,BigIP);
	}

	@Override
	public boolean editIP(StaffDomain old, String ip) {
		return staffDao.editIP(old, ip);
	}

	@Override
	public boolean editStaffById(StaffDomain newOne, StaffDomain OldOne) {
		return staffDao.editStaffById(newOne, OldOne);
	}

}
