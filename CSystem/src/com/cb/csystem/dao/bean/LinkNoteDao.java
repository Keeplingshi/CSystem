package com.cb.csystem.dao.bean;

import org.springframework.stereotype.Repository;

import com.cb.csystem.dao.ILinkNoteDao;
import com.cb.csystem.domain.LinkNoteDomain;
import com.cb.system.dao.bean.BaseDao;

@Repository
public class LinkNoteDao extends BaseDao<LinkNoteDomain> implements ILinkNoteDao {

}
