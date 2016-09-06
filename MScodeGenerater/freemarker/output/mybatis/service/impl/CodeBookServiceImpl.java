
package com.xb.sys.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xb.sys.dao.ICodeBookDao;
import com.xb.sys.model.CodeBook;
import com.xb.sys.model.util.DataGrid;
import com.xb.sys.model.util.PageHelper;
import com.xb.sys.service.ICodeBookService;

@Service
@Transactional
public class CodeBookServiceImpl implements ICodeBookService {

	@Resource
	ICodeBookDao codeBookDao;

	@Override
	public DataGrid<CodeBook> doDataGrid(CodeBook codeBook, PageHelper ph) {
		return codeBookDao.findPageBy(codeBook, ph);
	}

	@Override
	public void doSave(CodeBook domain) {
		codeBookDao.save(domain);
	}

	@Override
	public CodeBook doGet(String id) {
		return codeBookDao.get(id);
	}

	@Override
	public void doDelete(String id) {
		codeBookDao.delete(id);
	}


	@Override
	public void doUpdate(CodeBook codeBook) {
		codeBookDao.update(codeBook);
	}

}

