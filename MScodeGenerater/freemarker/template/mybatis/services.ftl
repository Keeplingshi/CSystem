<#assign obj=ClassName?uncap_first>
package ${package}.service;
import ${package}.model.${ClassName};
import ${package}.model.util.DataGrid;
import ${package}.model.util.PageHelper;


/**
 *${modelName}Dao接口
 *
 *@Author:${author}
 *@Date：${date}
*/

public interface I${ClassName}Service {
	/**
	 * 获取BUG数据表格
	 * 
	 * @param ${obj}
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid<${ClassName}> doDataGrid(${ClassName} ${obj}, PageHelper ph);

	/**
	 * 添加${obj}
	 * 
	 * @param ${obj}
	 */
	public void doSave(${ClassName} ${obj});

	/**
	 * 获得BUG对象
	 * 
	 * @param id
	 * @return
	 */
	public ${ClassName} doGet(String id);

	/**
	 * 修改BUG
	 * 
	 * @param ${obj}
	 */
	public void doUpdate(${ClassName} ${obj});

	/**
	 * 删除BUG
	 * 
	 * @param id
	 */
	public void doDelete(String id);

}



