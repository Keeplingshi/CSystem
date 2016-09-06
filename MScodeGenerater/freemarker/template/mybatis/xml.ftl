<#assign obj=ClassName?uncap_first>
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" 
"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${package}.model.${ClassName}">
    <!-- Result Map-->
    <resultMap id="${obj}Map" type="${package}.model.${ClassName}">
    </resultMap>
    
    <!--添加数据-->
    <insert id="save" parameterType="${obj}">
		INSERT INTO ${ClassName}
		(<#list columnList as l><#if "${l_index+1}"=="1"><#else><#if l_has_next>${l.name},<#else>${l.name}</#if></#if></#list>)
		VALUES 
		(<#list columnList as l><#if "${l_index+1}"=="1"><#else><#if l_has_next>${"#"}{${l.name}},<#else>${"#"}{${l.name}}</#if><#t/></#if></#list>)
	</insert>
	
	
	 <!-- 删除 -->
  	<delete id="deleteByIds" parameterType="string">
		DELETE FROM
		${ClassName}
		WHERE ID in 
		<foreach item="ids" collection="array" open="(" separator="," close=")"> 
		${"#"}{ids}
		</foreach> 
	</delete>
	
	
    <!--修改数据-->
    <update id="update" parameterType="${obj}" >
		UPDATE ${ClassName} SET
	 <#list columnList as l><#if "${l_index+1}"=="1"><#else><#if l_has_next>${l.name}=${"#"}{${l.name}},<#else>${l.name}=${"#"}{${l.name}}</#if></#if></#list>
		where id=${"#"}{id}
	</update>
	
	
	<!-- 根据ID查询 -->
	<select id="getById" parameterType="String" resultMap="codeBookMap">
		SELECT *
		FROM ${ClassName} where id =  ${"#"}{id}
	</select>
	
	
	
	
		<!-- 分页查询 -->
	<select id="findPageBy" resultMap="${obj}Map" parameterType="${obj}">
		SELECT
		*
		FROM
		${ClassName}
		where 1=1
		
		<#list columnList as l>
		 <#if "${l_index+1}"=="1"><#else>
		 
		 <#if l_has_next>
		 
		 <if test="${l.name} != null and '' != ${l.name} ">   
            <![CDATA[   
              AND ${l.name}  like  '%${"$"}{${l.name}}%'
            ]]>
		</if>
		<#else>
		</#if></#if>
		 </#list>
		
		
		order by id asc
		   <![CDATA[
		LIMIT ${"#"}{startRow} ,${"#"}{rows}  
			  ]]>
	</select>
	<!-- 分页查询纪录查询总记录数 -->
	<select id="getCountBy" resultType="int" parameterType="${obj}">
		select count(ID)
		from ${ClassName} WHERE 1 = 1
		
		 <#list columnList as l>
		 <#if "${l_index+1}"=="1"><#else>
		 
		 <#if l_has_next>
		 
		 <if test="${l.name} != null and '' != ${l.name} ">   
            <![CDATA[   
              AND ${l.name}  like  '%${"$"}{${l.name}}%'
            ]]>
		</if>
		<#else>
		</#if></#if>
		 </#list>
		
	</select>
</mapper>
