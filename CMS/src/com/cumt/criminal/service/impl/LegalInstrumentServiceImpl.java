package com.cumt.criminal.service.impl;

import java.util.List;

import com.cumt.criminal.dao.LegalInstrumentDao;
import com.cumt.criminal.dao.impl.LegalInstrumentDaoImpl;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.service.LegalInstrumentService;
import com.cumt.criminal.util.QueryResultUtil;

public class LegalInstrumentServiceImpl implements LegalInstrumentService {

	private LegalInstrumentDao legalInstrumentDao = new LegalInstrumentDaoImpl();
	@Override
	public void addLegalInstrument(LegalInstrumentDomain legalInstrumentDomain) {
		legalInstrumentDao.addLegalInstrumentLegalInstrument(legalInstrumentDomain);
	}
	@Override
	public boolean delLegalInstrument(
			LegalInstrumentDomain legalInstrumentDomain) {
		legalInstrumentDao.deleteLegalInstrument(legalInstrumentDomain);
		return true;
	}
	@Override
	public LegalInstrumentDomain editLegalInstrument(
			LegalInstrumentDomain oldLD, LegalInstrumentDomain newLD) {
		return legalInstrumentDao.editLegalInstrument(oldLD,newLD);
	}
	@Override
	public LegalInstrumentDomain queryLegalInstrumentById(int id) {
		return legalInstrumentDao.queryLegalInstrument(id);
	}
	@Override
	public List<LegalInstrumentDomain> findAll() {
		return legalInstrumentDao.findAll();
	}
	@Override
	public QueryResultUtil findPart(int firstResult, int maxReslt) {
		return legalInstrumentDao.findAll(firstResult, maxReslt);
	}
	@Override
	public QueryResultUtil queryByState(String state) {
		return legalInstrumentDao.queryByState(state);
	}
	@Override
	public QueryResultUtil queryByName(String name) {
		return legalInstrumentDao.queryByName(name);
	}

}
