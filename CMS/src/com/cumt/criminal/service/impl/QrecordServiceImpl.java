package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.QRecordDao;
import com.cumt.criminal.dao.impl.QRecordDaoImpl;
import com.cumt.criminal.model.QrecordDomain;
import com.cumt.criminal.service.QrecordService;
import com.cumt.criminal.util.QueryResultUtil;

public class QrecordServiceImpl implements QrecordService {

	private QRecordDao qRecordDao = new QRecordDaoImpl();
	@Override
	public boolean addQRecord(QrecordDomain qrecordDomain) {
		qRecordDao.addQRecord(qrecordDomain);
		return true;
	}

	@Override
	public boolean deleteQRecord(QrecordDomain qrecordDomain) {
		qRecordDao.deleteQRecord(qrecordDomain);
		return true;
	}

	@Override
	public QrecordDomain queryQRecordById(int ID) {
		return qRecordDao.queryQRecordById(ID);
	}

	@Override
	public QrecordDomain editQRecordById(QrecordDomain oldQR,
			QrecordDomain newQR) {
		return qRecordDao.editQRecordById(oldQR, newQR);
	}

	@Override
	public List<QrecordDomain> findAll() {
		return qRecordDao.findAll();
	}

	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		return qRecordDao.findPart(firstResult, maxReslt);
	}

	@Override
	public QueryResultUtil queryByState(String state) {
		return qRecordDao.queryByState(state);
	}

	@Override
	public QueryResultUtil queryByResultState(String resultState) {
		return qRecordDao.queryByResultState(resultState);
	}
	@Override
	public QueryResultUtil queryByName(String name) {
		return qRecordDao.queryByName(name);
	}

	@Override
	public QueryResultUtil queryByTime(String time) {
		return qRecordDao.queryByTime(time);
	}


}
