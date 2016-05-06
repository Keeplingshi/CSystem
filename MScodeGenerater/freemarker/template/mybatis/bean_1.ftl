package ${package}.domain;

import java.util.Date;
/**
 *${modelName}实体类
 *
 *@Author:${author}
 *@Date：${date}
*/


public class ${ClassName}{
	
	private static final long serialVersionUID = 1L;
	
	<#list columnList as column>
	private ${column.javaType} ${column.javaName}; //${column.remarks};	
	</#list>

	public ${ClassName}() {
	}
	
	<#list columnList as column>
	public ${column.javaType} get${column.javaName?cap_first}(){
		return ${column.javaName}; 
	}
	
	public void set${column.javaName?cap_first}(${column.javaType} ${column.javaName}){
		this.${column.javaName}=${column.javaName};
	}
	
	</#list>

}
