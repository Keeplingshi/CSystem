package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.DetentionDao;
import com.cumt.criminal.dao.impl.DetentionDaoImpl;
import com.cumt.criminal.model.DetentionDomain;
import com.cumt.criminal.service.DetentionService;
import com.cumt.criminal.util.QueryResultUtil;

public class DetentionServiceImpl implements DetentionService {
	DetentionDao detentionDao = new DetentionDaoImpl();
	public DetentionServiceImpl(){
		
	}
	@Override
	public boolean addDetention(DetentionDomain Detention) {
		detentionDao.addDetention(Detention);
		return true;
	}

	@Override
	public boolean deleteDetention(DetentionDomain Detention) {
		detentionDao.deleteDetention(Detention);
		return true;
	}

	@Override
	public DetentionDomain editDetention(DetentionDomain oldD,
			DetentionDomain newD) {
		return detentionDao.editDetention(oldD, newD);
	}

	@Override
	public DetentionDomain queryDetention(int id) {
		return detentionDao.queryDetention(id);
	}

	@Override
	public List<DetentionDomain> findAll() {
		return detentionDao.findAll();
	}

	@Override
	public QueryResultUtil findAll(int firstResult, int maxReslt) {
		return detentionDao.findAll(firstResult, maxReslt);
	}
	@Override
	public QueryResultUtil queryByState(String state) {
		return detentionDao.queryByState(state);
	}
	@Override
	public QueryResultUtil queryByName(String name) {
		return detentionDao.queryByName(name);
	}
	@Override
	public QueryResultUtil queryByResultState(String resultState) {
		return detentionDao.queryByResultState(resultState);
	}
	@Override
	public QueryResultUtil queryByTime(String time) {
		return detentionDao.queryByTime(time);
	}

}
