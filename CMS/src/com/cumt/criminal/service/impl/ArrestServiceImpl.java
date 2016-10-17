package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.ArrestDao;
import com.cumt.criminal.dao.impl.ArrestDaoImpl;
import com.cumt.criminal.model.ArrestDomain;
import com.cumt.criminal.service.ArrestService;
import com.cumt.criminal.util.QueryResultUtil;

public class ArrestServiceImpl implements ArrestService {
	ArrestDao arrestDao=new ArrestDaoImpl();
	@Override
	public boolean addArrest(ArrestDomain Arrest) {
		arrestDao.addArrest(Arrest);
		return true;
	}

	@Override
	public boolean deleteArrest(ArrestDomain Arrest) {
		arrestDao.deleteArrest(Arrest);
		return true;
	}

	@Override
	public ArrestDomain editArrest(ArrestDomain oldA, ArrestDomain newA) {
		return arrestDao.editArrest(oldA, newA);
	}

	@Override
	public ArrestDomain queryArrest(int id) {
		return arrestDao.queryArrest(id);
	}

	@Override
	public List<ArrestDomain> findAll() {
		return arrestDao.findAll();
	}

	@Override
	public QueryResultUtil findAll(int firstResult, int maxReslt) {
		return arrestDao.findAll(firstResult, maxReslt);
	}

	@Override
	public QueryResultUtil queryByState(String state) {
		return arrestDao.queryByState(state);
	}

	@Override
	public QueryResultUtil queryByResultState(String resultState) {
		return arrestDao.queryByResultState(resultState);
	}

	@Override
	public QueryResultUtil queryByName(String name) {
		return arrestDao.queryByName(name);
	}

	@Override
	public QueryResultUtil queryByTime(String time) {
		return arrestDao.queryByTime(time);
	}

}
