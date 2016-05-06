package com.dhcc.util;

public class Column {

	public String name; // 表的一个字段;
	public String javaName; // 该字段对应的java属性名称;

	public int sqlType; // 该字段对应的数据库类型
	public int sqlColumnLength;
	public int sqlDecimalLength;
	public boolean sqlNotNull;
	public boolean sqlReadOnly;
	public String javaType; // 该字段对应的java属性其类型
	public String objectOrNot; // 是不是对象
	public String extType; // ext类型
	public String searchOrNot; // 是不是查询对象
	public String valueField;
	public String displayField;
	public String sqlTypeName;
	public String defalutValue;
	public String remarks = ""; // 该字段对应的备注
	public String jdbcType;		//该字段对应的JDBC驱动类型，参见Java.Sql.Type

	public int hashCode() {
		return (name != null) ? name.hashCode() : 0;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public int getSqlColumnLength() {
		return sqlColumnLength;
	}

	public void setSqlColumnLength(int sqlColumnLength) {
		this.sqlColumnLength = sqlColumnLength;
	}

	public int getSqlDecimalLength() {
		return sqlDecimalLength;
	}

	public void setSqlDecimalLength(int sqlDecimalLength) {
		this.sqlDecimalLength = sqlDecimalLength;
	}

	public boolean isSqlNotNull() {
		return sqlNotNull;
	}

	public void setSqlNotNull(boolean sqlNotNull) {
		this.sqlNotNull = sqlNotNull;
	}

	public boolean isSqlReadOnly() {
		return sqlReadOnly;
	}

	public void setSqlReadOnly(boolean sqlReadOnly) {
		this.sqlReadOnly = sqlReadOnly;
	}

	public int getSqlType() {
		return sqlType;
	}

	public void setSqlType(int sqlType) {
		this.sqlType = sqlType;
	}

	public String getSqlTypeName() {
		return sqlTypeName;
	}

	public void setSqlTypeName(String sqlTypeName) {
		this.sqlTypeName = sqlTypeName;
	}

	public String getDefalutValue() {
		return defalutValue;
	}

	public void setDefalutValue(String defalutValue) {
		this.defalutValue = defalutValue;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public String getObjectOrNot() {
		return objectOrNot;
	}

	public void setObjectOrNot(String objectOrNot) {
		this.objectOrNot = objectOrNot;
	}

	public String getValueField() {
		return valueField;
	}

	public void setValueField(String valueField) {
		this.valueField = valueField;
	}

	public String getDisplayField() {
		return displayField;
	}

	public void setDisplayField(String displayField) {
		this.displayField = displayField;
	}

	public String getExtType() {
		return extType;
	}

	public void setExtType(String extType) {
		this.extType = extType;
	}

	public String getSearchOrNot() {
		return searchOrNot;
	}

	public void setSearchOrNot(String searchOrNot) {
		this.searchOrNot = searchOrNot;
	}

	public String getJavaName() {
		String javaName = "";
		if (this.name != null) {
			javaName = StringUtil.toUpperCamelCase(StringUtil.removePrefix(name));
		}
		return javaName;
	}

	public void setJavaName(String javaName) {
		this.javaName = javaName;
	}
	
	
	/**
	 * @return the jdbcType
	 */
	public String getJdbcType() {
		return jdbcType;
	}

	/**
	 * @param jdbcType the jdbcType to set
	 */
	public void setJdbcType(String jdbcType) {
		this.jdbcType = jdbcType;
	}

	/*
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Column [name=" + name + ", sqlTypeName=" + getSqlTypeName()+ ", javaName=" + getJavaName() +",javaType="+getJavaType()+",javaLength="+getSqlColumnLength() +",sqlDecimalLength="+getSqlDecimalLength()+",extType="+getExtType()+",remarks="+getRemarks()+",searchOrNot="+getSearchOrNot()+",objectOrNot="+getObjectOrNot()+",jdbcType="+getJdbcType()+"]";
	}
	
	
}
