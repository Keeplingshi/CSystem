<#assign obj=ClassName?uncap_first>
package ${package}.dao.impl;
import org.springframework.stereotype.Repository;

import ${package}.dao.I${ClassName}Dao;
import ${package}.model.${ClassName};

/**
 *${modelName}Mapper类
 *
 *@Author:${author}
 *@Date：${date}
*/



@Repository
public class ${ClassName}DaoImpl  extends BaseDaoImpl<${ClassName}> implements I${ClassName}Dao {

}





