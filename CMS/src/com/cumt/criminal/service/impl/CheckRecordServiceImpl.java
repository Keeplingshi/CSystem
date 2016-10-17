package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.CheckRecordDao;
import com.cumt.criminal.dao.impl.CheckRecordDaoImpl;
import com.cumt.criminal.model.CheckrecordDomian;
import com.cumt.criminal.service.CheckRecordService;
import com.cumt.criminal.util.QueryResultUtil;

public class CheckRecordServiceImpl implements CheckRecordService {
	CheckRecordDao checkRecordDao = new CheckRecordDaoImpl();

	@Override
	public boolean addCheckDomain(CheckrecordDomian checkrecordDomian) {
		checkRecordDao.addCheckDomain(checkrecordDomian);
		return true;
	}

	@Override
	public boolean deleteCheckDomain(CheckrecordDomian checkrecordDomian) {
		checkRecordDao.deleteCheckDomain(checkrecordDomian);
		return true;
	}

	@Override
	public CheckrecordDomian editCheckDomain(CheckrecordDomian oldCR,
			CheckrecordDomian newCR) {
		return checkRecordDao.editCheckDomain(oldCR, newCR);
	}

	@Override
	public CheckrecordDomian queryCheckDomain(int id) {
		return checkRecordDao.queryCheckDomain(id);
	}

	@Override
	public List<CheckrecordDomian> findAll() {
		return checkRecordDao.findAll();
	}

	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		return checkRecordDao.findPart(firstResult, maxReslt);
	}

	@Override
	public QueryResultUtil queryByState(String state) {
		return checkRecordDao.queryByState(state);
	}

	@Override
	public QueryResultUtil queryByResultState(String resultState) {
		return checkRecordDao.queryByResultState(resultState);
	}




}
