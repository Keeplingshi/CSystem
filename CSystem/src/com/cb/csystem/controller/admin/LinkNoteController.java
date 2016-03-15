package com.cb.csystem.controller.admin;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.format.annotation.DateTimeFormat;
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

import com.cb.csystem.domain.LinkNoteDomain;
import com.cb.csystem.domain.LinkNoteTypeDomain;
import com.cb.csystem.domain.UserDomain;
import com.cb.csystem.service.ILinkNoteService;
import com.cb.csystem.service.ILinkNoteTypeService;
import com.cb.csystem.service.IUserService;
import com.cb.csystem.util.Consts;
import com.cb.csystem.util.DBToExcelUtil;
import com.cb.system.util.FileUtil;
import com.cb.system.util.PageInfo;

/**
 * 联系笔记控制层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/admin/linkNote")
public class LinkNoteController {
	
	@Resource private IUserService userService;
	@Resource private ILinkNoteService linkNoteService;
	@Resource private ILinkNoteTypeService linkNoteTypeService;
	
	/**
	 * 过滤起前台pageInfo
	 * 使@ModelAttribute("pageInfo") PageInfo pageInfo在前台使用name="pageInfo.currentPageNo"来进行传参数
	 * @param binder
	 */
	@InitBinder("pageInfo")  
	public void initPageInfoBinder(WebDataBinder binder) {  
	    binder.setFieldDefaultPrefix("pageInfo.");
	}
	
	@InitBinder("pagedialogInfo")  
	public void initPageDialogInfoBinder(WebDataBinder binder) {  
	    binder.setFieldDefaultPrefix("pagedialogInfo.");
	}
	
	/**
	 * 联系笔记列表
	 * @param pageInfo
	 * @param bindingResult
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteList")
	public String dolinkNoteList(@ModelAttribute("pageInfo") PageInfo pageInfo
			,BindingResult bindingResult,HttpSession session,Model model)throws Exception{
		
		//获取用户
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		if(userDomain!=null){
			
			String userId=userDomain.getId();
			List<LinkNoteDomain> linkNoteList=linkNoteService.doSearchPageList(pageInfo, userId, null, null, null, null, null, null);
			List<LinkNoteTypeDomain> linkNoteTypeList=linkNoteTypeService.doGetFilterList();
			
			model.addAttribute("linkNoteList", linkNoteList);
			model.addAttribute("linkNoteTypeList", linkNoteTypeList);
		}
		
		return "/adminView/linkNote/linkNoteList";
	}
	
	/**
	 * 联系笔列表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteSearchList")
	public String getlinkNoteSearchList(@ModelAttribute("pageInfo") PageInfo pageInfo,Model model
			,HttpSession session,String linkNoteTypeId
			,@RequestParam(value ="beginTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date beginTime
			,@RequestParam(value ="endTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date endTime
			,String searchText,String sortMode,String sortValue)throws Exception{
		
		//获取用户
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		if(userDomain!=null){
			
			String userId=userDomain.getId();
			
			List<LinkNoteDomain> linkNoteList=linkNoteService.doSearchPageList(pageInfo, userId, linkNoteTypeId, beginTime, endTime, searchText, sortMode, sortValue);
			List<LinkNoteTypeDomain> linkNoteTypeList=linkNoteTypeService.doGetFilterList();
			
			model.addAttribute("linkNoteList", linkNoteList);
			model.addAttribute("linkNoteTypeList", linkNoteTypeList);
			
			model.addAttribute("linkNoteTypeId", linkNoteTypeId);
			model.addAttribute("beginTime", beginTime);
			model.addAttribute("endTime", endTime);
			model.addAttribute("searchText", searchText);
			model.addAttribute("sortMode", sortMode);
			model.addAttribute("sortValue", sortValue);
		}
		
		return "/adminView/linkNote/linkNoteList";
	}
	
	/**
	 * 联系笔详情页面
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteView/{id}")
	public String dolinkNoteView(Model model,@PathVariable String id) throws Exception{
		
		//获取linkNote信息
		LinkNoteDomain linkNoteDomain=linkNoteService.doGetById(id);
		model.addAttribute("linkNoteDomain", linkNoteDomain);
		
		return "/adminView/linkNote/linkNoteView";
	}
	
	/**
	 * 新增联系笔页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteAdd")
	public String dolinkNoteAdd(Model model)throws Exception{
		
		List<LinkNoteTypeDomain> linkNoteTypeList=linkNoteTypeService.doGetFilterList();
		model.addAttribute("linkNoteTypeList", linkNoteTypeList);
		
		return "/adminView/linkNote/linkNoteAdd";
	}
	
	/**
	 * 修改联系笔
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteEdit/{id}")
	public String dolinkNoteEdit(Model model,@PathVariable String id)throws Exception{
		
		//获取linkNote信息
		LinkNoteDomain linkNoteDomain=linkNoteService.doGetById(id);
		model.addAttribute("linkNoteDomain", linkNoteDomain);
		List<LinkNoteTypeDomain> linkNoteTypeList=linkNoteTypeService.doGetFilterList();
		model.addAttribute("linkNoteTypeList", linkNoteTypeList);
		
		return "/adminView/linkNote/linkNoteEdit";
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
	public String doSave(@Valid @ModelAttribute("domain") LinkNoteDomain domain,
			HttpSession session,BindingResult result)throws Exception{
		if (result.hasErrors()) {// 如果校验失败,则返回
			return Consts.ERROR;
		} else {
			
			String username=(String)session.getAttribute(Consts.CURRENT_USER);
			UserDomain userDomain=userService.doGetUserByUsername(username);
			domain.setUserId(userDomain.getId());
			if(linkNoteService.doSave(domain)){
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
		
		if(linkNoteService.doDeleteById(id)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}
	
	/**
	 * 批量删除
	 * @param userIds
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deletelinkNotes")
	@ResponseBody
	public String dodeletelinkNotes(@RequestParam(value = "linkNoteIds[]") String[] linkNoteIds)throws Exception{
		
		if(linkNoteService.doDeleteByIds(linkNoteIds)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}

	/**
	 * 联系笔记统计报表页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteDBToExcelView")
	public String dolinkNoteDBToExcelView(Model model)throws Exception{
		
		List<LinkNoteTypeDomain> linkNoteTypeList=linkNoteTypeService.doGetFilterList();
		model.addAttribute("linkNoteTypeList", linkNoteTypeList);
		
		return "/adminView/linkNote/linkNoteDBToExcelView";
	}
	
	/**
	 * 导出excel报表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteExcel")
	@ResponseBody
	public String dolinkNoteExcel(Model model,HttpServletResponse response
			,HttpSession session,String linkNoteTypeId
			,@RequestParam(value ="beginTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date beginTime
			,@RequestParam(value ="endTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date endTime)throws Exception{
		
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		String filename=username+"_"+System.currentTimeMillis()+".xls";
		String title="联系笔记";
		
		List<LinkNoteDomain> linkNoteDomains=linkNoteService.doSearchList(userDomain.getId(),linkNoteTypeId,beginTime, endTime);
		
		String fileOutputName=DBToExcelUtil.linkNoteDBToExcel(linkNoteDomains, Consts.DBTOEXCEL_PATH+filename, filename,title);
		if(fileOutputName.equals(filename)){
			return fileOutputName;
		}
		
		return Consts.ERROR;
	}
	
	/**
	 * 下载联系笔记报表
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/{fileOutputName}/downloadlinkNote")
	public void dodownloadlinkNote(HttpServletResponse response,@PathVariable String fileOutputName)throws Exception{
		FileUtil.fileDownload(response, Consts.DBTOEXCEL_PATH+fileOutputName, Consts.LINKNOTE_EXCEL);
		FileUtil.delFile(Consts.DBTOEXCEL_PATH+fileOutputName);
	}
	
}
