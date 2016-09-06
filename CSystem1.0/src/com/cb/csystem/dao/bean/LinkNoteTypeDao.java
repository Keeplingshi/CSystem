package com.cb.csystem.dao.bean;

import org.springframework.stereotype.Repository;

import com.cb.csystem.dao.ILinkNoteTypeDao;
import com.cb.csystem.domain.LinkNoteTypeDomain;
import com.cb.system.dao.bean.BaseDao;

@Repository
public class LinkNoteTypeDao extends BaseDao<LinkNoteTypeDomain> implements ILinkNoteTypeDao {

}
