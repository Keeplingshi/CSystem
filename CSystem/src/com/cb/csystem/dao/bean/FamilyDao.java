package com.cb.csystem.dao.bean;

import org.springframework.stereotype.Repository;

import com.cb.csystem.dao.IFamilyDao;
import com.cb.csystem.domain.FamilyDomain;
import com.cb.system.dao.bean.BaseDao;

@Repository
public class FamilyDao extends BaseDao<FamilyDomain> implements IFamilyDao {

}
