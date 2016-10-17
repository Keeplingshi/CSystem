package com.cumt.criminal.util;

import java.util.List;


public class QueryResultUtil {
	private int count = 0;
	private List list;
	
	public QueryResultUtil() {
		super();
	}
	public QueryResultUtil(int count, List list) {
		super();
		this.count = count;
		this.list = list;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}
}
