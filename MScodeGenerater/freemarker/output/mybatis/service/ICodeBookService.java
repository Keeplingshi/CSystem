package com.xb.sys.service;
import com.xb.sys.model.CodeBook;
import com.xb.sys.model.util.DataGrid;
import com.xb.sys.model.util.PageHelper;


/**
 *用户信息Dao接口
 *
 *@Author:xiebin
 *@Date：2015-10-31
*/

public interface ICodeBookService {
	/**
	 * 获取BUG数据表格
	 * 
	 * @param codeBook
	 *            参数
	 * @param ph
	 *            分页帮助类
	 * @return
	 */
	public DataGrid<CodeBook> doDataGrid(CodeBook codeBook, PageHelper ph);

	/**
	 * 添加codeBook
	 * 
	 * @param codeBook
	 */
	public void doSave(CodeBook codeBook);

	/**
	 * 获得BUG对象
	 * 
	 * @param id
	 * @return
	 */
	public CodeBook doGet(String id);

	/**
	 * 修改BUG
	 * 
	 * @param codeBook
	 */
	public void doUpdate(CodeBook codeBook);

	/**
	 * 删除BUG
	 * 
	 * @param id
	 */
	public void doDelete(String id);

}



