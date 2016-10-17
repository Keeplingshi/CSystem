package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.CaseRegisterDao;
import com.cumt.criminal.dao.impl.CaseRegisterDaoImpl;
import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.service.CaseRegisterService;
import com.cumt.criminal.util.QueryResultUtil;

public class CaseRegisterServiceImpl implements CaseRegisterService {

	private CaseRegisterDao caseRegisterDao = new CaseRegisterDaoImpl();
	
	@Override
	public void addCaseRegister(CaseRegisterDomain caseRegister) {
		caseRegisterDao.addCaseRegister(caseRegister);
	}

	@Override
	public boolean delCaseRegister(CaseRegisterDomain caseRegister) {
		caseRegisterDao.deleteCaseRegister(caseRegister);
		return true;
	}
	
	@Override
	public CaseRegisterDomain editCaseRegister(CaseRegisterDomain oldCR,
			CaseRegisterDomain newCR) {
		return caseRegisterDao.editCaseRegister(oldCR, newCR);
	}
	
	@Override
	public CaseRegisterDomain queryCaseRegisterById(int id) {
		return caseRegisterDao.queryCaseRegisterById(id);
	}

	@Override
	public QueryResultUtil queryByState(String state) {
		return caseRegisterDao.queryByState(state);
	}

	@Override
	public QueryResultUtil queryByDay(String day) {
		return caseRegisterDao.queryByDay(day);
	}

	@Override
	public QueryResultUtil queryByName(String name) {
		return caseRegisterDao.queryByName(name);
	}
	
	@Override
	public List<CaseRegisterDomain> findAll() {
		return caseRegisterDao.findAll();
	}

	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		return caseRegisterDao.findPart(firstResult, maxReslt);
	}




}
