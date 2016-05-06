package com.xb.sys.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xb.sys.model.CodeBook;
import com.xb.sys.model.util.DataGrid;
import com.xb.sys.model.util.Json;
import com.xb.sys.model.util.PageHelper;
import com.xb.sys.service.ICodeBookService;

@Controller
@RequestMapping("/codeBook")
public class CodeBookController extends BaseController {

	@Resource private ICodeBookService codeBookService;

	/**
	 * 跳转到CodeBook管理页面
	 * 
	 * @return
	 */
	@RequestMapping("/manager")
	public String doManager(Model model) {
		return "/codeBook/codeBookList";
	}

	/**
	 * 获取CodeBook数据表格
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping("/dataGrid")
	@ResponseBody
	public DataGrid<CodeBook> doDataGrid(CodeBook domain, PageHelper ph) {
		return codeBookService.doDataGrid(domain, ph);
	}

	/**
	 * 跳转到添加CodeBook页面
	 * 
	 * @param request
	 * @return
	 */
	@RequestMapping("/add")
	public String doAdd(Model model) {
		return "/codeBook/codeBookAdd";
	}

	/**
	 * 跳转到CodeBook修改页面
	 * 
	 * @return
	 */
	@RequestMapping("/get")
	public String doGet(Model model, String id) {
		CodeBook d = codeBookService.doGet(id);
		model.addAttribute("codeBook", d);
		return "/codeBook/codeBookEdit";
	}

	/**
	 * 添加CodeBook
	 * 
	 * @return
	 */
	@RequestMapping("/save")
	@ResponseBody
	public Json doSave(CodeBook domain) {
		try {
			codeBookService.doSave(domain);
		} catch (Exception e) {
			return Json.error(e);
		}
		return Json.success();
	}

	/**
	 * 删除CodeBook
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Json doDelete(String id) {
		try {
			codeBookService.doDelete(id);
		} catch (Exception e) {
			return Json.error(e);
		}
		return Json.success();
	}

	/**
	 * 修改CodeBook
	 * @param domain
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	public Json doUpdate(CodeBook domain) {
		try {
			codeBookService.doUpdate(domain);
		} catch (Exception e) {
			return Json.error(e);
		}
		return Json.success();
	}

	/**
	 * 跳转到CodeBook明细页面
	 * @param model
	 * @param id
	 * @return
	 */
	@RequestMapping("/view")
	public String doView(Model model, String id) {
		CodeBook d = codeBookService.doGet(id);
		model.addAttribute("codeBook", d);
		return "/codeBook/codeBookView";
	}


}
