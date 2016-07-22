package com.cb.csystem.controller.portal;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cb.csystem.domain.FamilyDomain;
import com.cb.csystem.service.IFamilyService;
import com.cb.csystem.util.Consts;
import com.cb.csystem.util.ExcelToDBUtil;
import com.cb.system.util.FileUtil;
import com.cb.system.util.PageInfo;

/**
 * 家庭控制层
 * @author chen
 *
 */
@Controller
@RequestMapping("/portal/family")
public class PFamilyController {

	@Resource private IFamilyService familyService;
	
	/**
	 * 过滤起前台pageInfo
	 * 使@ModelAttribute("pageInfo") PageInfo pageInfo在前台使用name="pageInfo.currentPageNo"来进行传参数
	 * @param binder
	 */
	@InitBinder("pageInfo")  
	public void initPageInfoBinder(WebDataBinder binder) {  
	    binder.setFieldDefaultPrefix("pageInfo.");
	}
	
	/**
	 * 家庭列表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/familyList")
	public String getfamilyList(@ModelAttribute("pageInfo") PageInfo pageInfo
			,BindingResult bindingResult,Model model)throws Exception{
		
		List<FamilyDomain> familyList=familyService.doGetPageList(pageInfo);
		model.addAttribute("familyList", familyList);
		
		return "/portalView/family/familyList";
	}
	
	/**
	 * 搜索列表
	 * @param pageInfo
	 * @param bindingResult
	 * @param model
	 * @param collegeId
	 * @param searchText
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/familySearchList")
	public String dofamilySearchList(@ModelAttribute("pageInfo") PageInfo pageInfo
			,BindingResult bindingResult,Model model,String searchText)throws Exception{
		
		List<FamilyDomain> familyList=familyService.doSearchPageList(pageInfo,searchText,null,null);
		model.addAttribute("familyList", familyList);
		
		model.addAttribute("searchText", searchText);
		
		return "/portalView/family/familyList";
	}
	
	/**
	 * 家庭成员详情页面
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/familyView/{id}")
	public String dofamilyView(Model model,@PathVariable String id) throws Exception{
		
		//获取family信息
		FamilyDomain familyDomain=familyService.doGetById(id);
		model.addAttribute("familyDomain", familyDomain);
		
		return "/portalView/family/familyView";
	}
	
	/**
	 * 新增家庭成员页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/familyAdd")
	public String dofamilyAdd(Model model)throws Exception{
		
		return "/portalView/family/familyAdd";
	}
	
	/**
	 * 修改家庭成员
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/familyEdit/{id}")
	public String dofamilyEdit(Model model,@PathVariable String id)throws Exception{
		
		//获取family信息
		FamilyDomain familyDomain=familyService.doGetById(id);
		model.addAttribute("familyDomain", familyDomain);
		
		return "/portalView/family/familyEdit";
	}
	
	/**
	 * 保存
	 * @param domain
	 * @param result
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	@ResponseBody
	public String doSave(@Valid @ModelAttribute("domain") FamilyDomain domain,
			BindingResult result)throws Exception{
		if (result.hasErrors()) {// 如果校验失败,则返回
			return Consts.ERROR;
		} else {
			if(familyService.doSave(domain)){
				return Consts.SUCCESS;
			}
		}
		return Consts.ERROR;
	}
	
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public String doDelete(@PathVariable String id)throws Exception{
		
		if(familyService.doDeleteById(id)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}
	
	/**
	 * 批量删除
	 * @param familyIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deleteFamilies")
	@ResponseBody
	public String doDeleteFamilies(@RequestParam(value = "familyIds[]") String[] familyIds)throws Exception{
		
		if(familyService.doDeleteByIds(familyIds)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}
	
	/**
	 * 家庭成员上传文件页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/familyExcelToDBView")
	public String dofamilyExcelToDBView()throws Exception{
		
		return "/portalView/family/familyExcelToDBView";
	}
	
	/**
	 * 下载家庭成员信息导入模板
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/downloadfamilyExcel")
	public void dodownloadStudentExcel(HttpServletResponse response)throws Exception{
		FileUtil.fileDownload(response, Consts.DOWNLOAD_PATH+Consts.Family_EXCEL, Consts.Family_EXCEL);
	}
	
	/**
	 * 家庭成员导入信息
	 * @param file
	 * @return
	 */
	@RequestMapping("/familyExcelSave")
	@ResponseBody
	public String dofamilyExcelSave(@RequestParam(value = "file", required = false) MultipartFile file)
	{
		String result=null;
		try{
			result=ExcelToDBUtil.familyExcelToDB(file);
		}catch (Exception e) {
			e.printStackTrace();
			return Consts.ERROR;
		}
		
		return result;
	}
}
