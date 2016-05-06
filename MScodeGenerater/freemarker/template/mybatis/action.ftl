<#assign obj=ClassName?uncap_first>
package ${package}.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xb.sys.model.${ClassName};
import com.xb.sys.model.util.DataGrid;
import com.xb.sys.model.util.Json;
import com.xb.sys.model.util.PageHelper;
import com.xb.sys.service.I${ClassName}Service;

@Controller
@RequestMapping("/${obj}")
public class ${ClassName}Controller extends BaseController {

	@Resource private I${ClassName}Service ${obj}Service;

	/**
	 * 跳转到${ClassName}管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String doManager(Model model) {
		return "/${obj}/${obj}List";
	}

	/**
	 * 获取${ClassName}数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid<${ClassName}> doDataGrid(${ClassName} domain, PageHelper ph) {
		return ${obj}Service.doDataGrid(domain, ph);
	}

	/**
	 * 跳转到添加${ClassName}页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	public String doAdd(Model model) {
		return "/${obj}/${obj}Add";
	}

	/**
	 * 跳转到${ClassName}修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/get")
	public String doGet(Model model, String id) {
		${ClassName} d = ${obj}Service.doGet(id);
		model.addAttribute("${obj}", d);
		return "/${obj}/${obj}Edit";
	}

	/**
	 * 添加${ClassName}
	 * 
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Json doSave(${ClassName} domain) {
		try {
			${obj}Service.doSave(domain);
		} catch (Exception e) {
			return Json.error(e);
		}
		return Json.success();
	}

	/**
	 * 删除${ClassName}
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json doDelete(String id) {
		try {
			${obj}Service.doDelete(id);
		} catch (Exception e) {
			return Json.error(e);
		}
		return Json.success();
	}

	/**
	 * 修改${ClassName}
	 * @param domain
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json doUpdate(${ClassName} domain) {
		try {
			${obj}Service.doUpdate(domain);
		} catch (Exception e) {
			return Json.error(e);
		}
		return Json.success();
	}

	/**
	 * 跳转到${ClassName}明细页面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/view")
	public String doView(Model model, String id) {
		${ClassName} d = ${obj}Service.doGet(id);
		model.addAttribute("${obj}", d);
		return "/${obj}/${obj}View";
	}


}
