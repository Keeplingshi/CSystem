package com.cb.csystem.domain;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

/**
 * 联系笔记类型
 * @author Administrator
 *
 */
@Entity
@Table(name="LINKNOTETYPE")
public class LinkNoteTypeDomain {

	private String id;	//ID
	private String name;	//名称
	private Set<LinkNoteDomain> linknotes=new HashSet<LinkNoteDomain>(0);
	
	@Id
	@GeneratedValue(generator="system-uuid")
	@GenericGenerator(name = "system-uuid",strategy="uuid")
	@Column(name = "ID", unique = true, nullable = false, precision = 10, scale = 0)
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	@Column(name = "NAME",unique = true, nullable = false, length = 100)
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "linkNoteType", fetch = FetchType.LAZY)
	public Set<LinkNoteDomain> getLinknotes() {
		return linknotes;
	}
	public void setLinknotes(Set<LinkNoteDomain> linknotes) {
		this.linknotes = linknotes;
	}
	
	
}
