package com.cb.csystem.controller.monitor;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cb.csystem.domain.CodeBookDomain;
import com.cb.csystem.domain.JobInfoDomain;
import com.cb.csystem.domain.UserDomain;
import com.cb.csystem.service.IJobInfoService;
import com.cb.csystem.service.IUserService;
import com.cb.csystem.util.CodeBookConstsType;
import com.cb.csystem.util.CodeBookHelper;
import com.cb.csystem.util.Consts;
import com.cb.csystem.util.DBToExcelUtil;
import com.cb.system.util.DateUtil;
import com.cb.system.util.FileUtil;
import com.cb.system.util.PageInfo;
import com.cb.system.util.SelectItem;

/**
 * 就业信息控制层
 * @author chen
 *
 */
@Controller
@RequestMapping("/monitor/jobInfo")
public class MJobInfoController {

	@Resource private IUserService userService;
	@Resource private IJobInfoService jobInfoService;
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
	 * 就业列表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoList")
	public String getjobInfoList(@ModelAttribute("pageInfo") PageInfo pageInfo
			,BindingResult bindingResult,Model model,HttpSession session)throws Exception{
		
		//获取当前登录用户名
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		if(userDomain!=null){
			if(userDomain.getClassDomain()!=null){
				
				List<JobInfoDomain> jobInfoList=jobInfoService.doSearchjobInfoPageList(pageInfo, null, null, null, userDomain.getClassDomain().getId(),null,null,null, null, null, null);
				//List<SelectItem> classList=classService.dogetClasssByMajorId(userDomain.getClassDomain().getMajor().getId());
				List<CodeBookDomain> contractStatusList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.CONTRACTSTATUS_TYPE);
				List<CodeBookDomain> protocalStateList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.PROTOCALSTATE_TYPE);
				
				model.addAttribute("contractStatusList", contractStatusList);
				model.addAttribute("protocalStateList", protocalStateList);
				model.addAttribute("jobInfoList", jobInfoList);
				//model.addAttribute("classList", classList);
				model.addAttribute("classId", userDomain.getClassDomain().getId());
				model.addAttribute("userDomain", userDomain);
			}
		}
		
		return "/monitorView/jobInfo/jobInfoList";
	}
	
	/**
	 * 搜索
	 * @param pageInfo
	 * @param bindingResult
	 * @param model
	 * @param collegeId
	 * @param majorId
	 * @param searchText
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoSearchList")
	public String dojobInfoSearchList(@ModelAttribute("pageInfo") PageInfo pageInfo
			,BindingResult bindingResult,Model model,HttpSession session,String contractStatusId
			,String protocalStateId,String searchText,String sortMode,String sortValue)throws Exception{
	
		//获取当前登录用户名
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		if(userDomain!=null){
			if(userDomain.getClassDomain()!=null){
				
				List<JobInfoDomain> jobInfoList=new ArrayList<JobInfoDomain>();
//				if(ValidateUtil.isEmpty(classId)){
//					jobInfoList=jobInfoService.doSearchjobInfoPageList(pageInfo,null, null, userDomain.getClassDomain().getMajor().getId(),contractStatusId,protocalStateId, null, searchText, sortMode, sortValue);
//				}else{
//					jobInfoList=jobInfoService.doSearchjobInfoPageList(pageInfo,null, null, null, classId,contractStatusId,protocalStateId, searchText, sortMode, sortValue);
//				}
				jobInfoList=jobInfoService.doSearchjobInfoPageList(pageInfo,null, null, null,userDomain.getClassDomain().getId(),contractStatusId, protocalStateId,null, searchText, sortMode, sortValue);
				//List<SelectItem> classList=classService.dogetClasssByMajorId(userDomain.getClassDomain().getMajor().getId());
				List<CodeBookDomain> contractStatusList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.CONTRACTSTATUS_TYPE);
				List<CodeBookDomain> protocalStateList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.PROTOCALSTATE_TYPE);
				
				model.addAttribute("contractStatusList", contractStatusList);
				model.addAttribute("protocalStateList", protocalStateList);
				
				model.addAttribute("contractStatusId", contractStatusId);
				model.addAttribute("protocalStateId", protocalStateId);
				model.addAttribute("jobInfoList", jobInfoList);
//				model.addAttribute("classList", classList);
//				model.addAttribute("classId", classId);
				model.addAttribute("searchText", searchText);
				model.addAttribute("sortMode", sortMode);
				model.addAttribute("sortValue", sortValue);
				model.addAttribute("userDomain", userDomain);
			}
		}
		
		return "/monitorView/jobInfo/jobInfoList";
	}
	
	/**
	 * 就业详情页面
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoView/{id}")
	public String dojobInfoView(Model model,@PathVariable String id) throws Exception{
		
		JobInfoDomain jobInfoDomain=jobInfoService.doGetById(id);
		model.addAttribute("jobInfoDomain", jobInfoDomain);
		
		return "/monitorView/jobInfo/jobInfoView";
	}
	
	/**
	 * 修改就业
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoEdit/{id}")
	public String dojobInfoEdit(Model model,@PathVariable String id)throws Exception{
		
		JobInfoDomain jobInfoDomain=jobInfoService.doGetById(id);
		model.addAttribute("jobInfoDomain", jobInfoDomain);
		model.addAttribute("contractStatusList", CodeBookHelper.getCodeBookByType(CodeBookConstsType.CONTRACTSTATUS_TYPE));
		model.addAttribute("protocalStateList", CodeBookHelper.getCodeBookByType(CodeBookConstsType.PROTOCALSTATE_TYPE));
		model.addAttribute("nowStateList", CodeBookHelper.getCodeBookByType(CodeBookConstsType.NOWSTATE_TYPE));
		
		return "/monitorView/jobInfo/jobInfoEdit";
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
	public String doSave(@Valid @ModelAttribute("domain") JobInfoDomain domain,
			BindingResult result,HttpSession session)throws Exception{
		if (result.hasErrors()) {// 如果校验失败,则返回
			return Consts.ERROR;
		} else {
			//获取当前登录用户名
			String username=(String) session.getAttribute(Consts.CURRENT_USER);
			String modifyTime=DateUtil.getSdfMinute()+" "+username;
			domain.setModifyTime(modifyTime);
			if(jobInfoService.doSave(domain)){
				return Consts.SUCCESS;
			}
		}
		return Consts.ERROR;
	}
	
//	/**
//	 * 就业信息导出页面
//	 * @param model
//	 * @return
//	 * @throws Exception
//	 */
//	@RequestMapping("/jobInfoDBToExcelView")
//	public String doJobInfoDBToExcelView(Model model)throws Exception{
//		
//		List<CollegeDomain> collegeList=collegeService.doGetFilterList();
//		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(null);
//		List<SelectItem> classList=classService.dogetClasssByMajorId(null);
//		List<GradeDomain> gradeList=gradeService.doGetFilterList();
//		
//		model.addAttribute("collegeList", collegeList);
//		model.addAttribute("majorList", majorList);
//		model.addAttribute("classList", classList);
//		model.addAttribute("gradeList", gradeList);
//		
//		return "/monitorView/jobInfo/jobInfoDBToExcelView";
//	}
	
	/**
	 * 导出就业信息
	 * @param gradeId
	 * @param collegeId
	 * @param majorId
	 * @param classId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoDBToExcel")
	@ResponseBody
	public String dojobInfoDBToExcel(HttpServletResponse response,HttpSession session)throws Exception{
		
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		String filename=username+"_"+System.currentTimeMillis()+".xls";
		
		if(userDomain!=null){
			if(userDomain.getClassDomain()!=null){
				List<JobInfoDomain> jobInfoDomains=jobInfoService.doSearchJobInfoList(null,null, null, userDomain.getClassDomain().getId(),null,null,null);
				List<SelectItem> selectItems=jobInfoService.doJobInfoCount(null,null, null, userDomain.getClassDomain().getId(),null,null,null);
				String fileOutputName=DBToExcelUtil.jobInfoDBToExcel(jobInfoDomains, selectItems,Consts.DBTOEXCEL_PATH+filename,filename);
				
				if(fileOutputName.equals(filename)){
					return fileOutputName;
				}
			}
		}

		return Consts.ERROR;
	}
	
	/**
	 * 下载就业信息
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/{fileOutputName}/downloadJobInfo")
	public void dodownloadJobInfoInfo(HttpServletResponse response,@PathVariable String fileOutputName)throws Exception{
		FileUtil.fileDownload(response, Consts.DBTOEXCEL_PATH+fileOutputName, Consts.JOBINFO_EXCEL);
		FileUtil.delFile(Consts.DBTOEXCEL_PATH+fileOutputName);
	}
	
	/**
	 * 就业统计信息
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoCountView")
	public String dojobInfoCountView(Model model,HttpSession session)throws Exception{
		
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		if(userDomain!=null){
			if(userDomain.getClassDomain()!=null){
				List<SelectItem> jobInfoCountList=jobInfoService.doJobInfoCount(null, null, null, userDomain.getClassDomain().getId(),null,null,null);
//				if(ValidateUtil.isEmpty(classId)){
//					jobInfoCountList=jobInfoService.doJobInfoCount(null, null, userDomain.getClassDomain().getMajor().getId(), null);
//				}else{
//					jobInfoCountList=jobInfoService.doJobInfoCount(null, null, null, classId);
//				}
				//List<SelectItem> classList=classService.dogetClasssByMajorId(userDomain.getClassDomain().getMajor().getId());
				
				model.addAttribute("jobInfoCountList", jobInfoCountList);
				//model.addAttribute("classList", classList);
				//model.addAttribute("classId", classId);
			}
		}
		
		return "/monitorView/jobInfo/jobInfoCountView";
	}
	
}
