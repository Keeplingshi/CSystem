<#assign obj=ClassName?uncap_first>

package com.xb.sys.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xb.sys.dao.I${ClassName}Dao;
import com.xb.sys.model.${ClassName};
import com.xb.sys.model.util.DataGrid;
import com.xb.sys.model.util.PageHelper;
import com.xb.sys.service.I${ClassName}Service;

@Service
@Transactional
public class ${ClassName}ServiceImpl implements I${ClassName}Service {

	@Resource
	I${ClassName}Dao ${obj}Dao;

	@Override
	public DataGrid<${ClassName}> doDataGrid(${ClassName} ${obj}, PageHelper ph) {
		return ${obj}Dao.findPageBy(${obj}, ph);
	}

	@Override
	public void doSave(${ClassName} domain) {
		${obj}Dao.save(domain);
	}

	@Override
	public ${ClassName} doGet(String id) {
		return ${obj}Dao.get(id);
	}

	@Override
	public void doDelete(String id) {
		${obj}Dao.delete(id);
	}


	@Override
	public void doUpdate(${ClassName} ${obj}) {
		${obj}Dao.update(${obj});
	}

}

