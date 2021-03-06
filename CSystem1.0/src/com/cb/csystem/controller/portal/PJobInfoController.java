package com.cb.csystem.controller.portal;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import net.sf.json.JSONArray;

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

import com.cb.csystem.domain.ClassDomain;
import com.cb.csystem.domain.CodeBookDomain;
import com.cb.csystem.domain.CollegeDomain;
import com.cb.csystem.domain.GradeDomain;
import com.cb.csystem.domain.JobInfoDomain;
import com.cb.csystem.service.IClassService;
import com.cb.csystem.service.ICollegeService;
import com.cb.csystem.service.IGradeService;
import com.cb.csystem.service.IJobInfoService;
import com.cb.csystem.service.IMajorService;
import com.cb.csystem.util.CodeBookConsts;
import com.cb.csystem.util.CodeBookConstsType;
import com.cb.csystem.util.CodeBookHelper;
import com.cb.csystem.util.Consts;
import com.cb.csystem.util.DBToExcelUtil;
import com.cb.csystem.util.ExcelToDBUtil;
import com.cb.csystem.util.bean.JobInfoCountBean;
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
@RequestMapping("/portal/jobInfo")
public class PJobInfoController {

	@Resource private IJobInfoService jobInfoService;
	@Resource private IMajorService majorService;
	@Resource private ICollegeService collegeService;
	@Resource private IClassService classService;
	@Resource private IGradeService gradeService;
	
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
			,BindingResult bindingResult,Model model)throws Exception{
		
		List<JobInfoDomain> jobInfoList=jobInfoService.doGetPageList(pageInfo);
		List<CollegeDomain> collegeList=collegeService.doGetFilterList();
		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(null);
		List<SelectItem> classList=classService.dogetClasssByMajorId(null);
		List<GradeDomain> gradeList=gradeService.doGetFilterList();
		List<CodeBookDomain> contractStatusList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.CONTRACTSTATUS_TYPE);
		List<CodeBookDomain> protocalStateList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.PROTOCALSTATE_TYPE);
		
		model.addAttribute("jobInfoList", jobInfoList);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("classList", classList);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("contractStatusList", contractStatusList);
		model.addAttribute("protocalStateList", protocalStateList);
		
		return "/portalView/jobInfo/jobInfoList";
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
			,BindingResult bindingResult,Model model,String gradeId,String collegeId,String majorId,String classId,String contractStatusId
			,String protocalStateId,String isPositive,String searchText,String sortMode,String sortValue)throws Exception{
	
		List<JobInfoDomain> jobInfoList=jobInfoService.doSearchjobInfoPageList(pageInfo,gradeId,collegeId,majorId,classId
				,contractStatusId,protocalStateId,isPositive,searchText, sortMode, sortValue);
		List<CollegeDomain> collegeList=collegeService.doGetFilterList();
		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(collegeId);
		List<SelectItem> classList=classService.dogetClasssByMajorId(majorId);
		List<GradeDomain> gradeList=gradeService.doGetFilterList();
		List<CodeBookDomain> contractStatusList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.CONTRACTSTATUS_TYPE);
		List<CodeBookDomain> protocalStateList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.PROTOCALSTATE_TYPE);

		model.addAttribute("jobInfoList", jobInfoList);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("classList", classList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("contractStatusList", contractStatusList);
		model.addAttribute("protocalStateList", protocalStateList);
		
		model.addAttribute("classId", classId);
		model.addAttribute("majorId", majorId);
		model.addAttribute("gradeId", gradeId);
		model.addAttribute("collegeId", collegeId);
		model.addAttribute("contractStatusId", contractStatusId);
		model.addAttribute("protocalStateId", protocalStateId);
		model.addAttribute("isPositive", isPositive);
		model.addAttribute("searchText", searchText);
		model.addAttribute("sortMode", sortMode);
		model.addAttribute("sortValue", sortValue);
		
		return "/portalView/jobInfo/jobInfoList";
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
		
		return "/portalView/jobInfo/jobInfoView";
	}
	
	/**
	 * 新增就业页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoAdd")
	public String dojobInfoAdd(Model model)throws Exception{
		
		return "/portalView/jobInfo/jobInfoAdd";
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
		
		return "/portalView/jobInfo/jobInfoEdit";
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
	
	/**
	 * 删除单条数据
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public String doDelete(@PathVariable String id)throws Exception{
		
		if(jobInfoService.doDeleteById(id)){
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
	@RequestMapping("/deleteJobInfos")
	@ResponseBody
	public String doDeleteJobInfos(@RequestParam(value = "jobInfoIds[]") String[] jobInfoIds)throws Exception{
		
		if(jobInfoService.doDeleteByIds(jobInfoIds)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}
	
	/**
	 * 根据签约状态获取协议书状态
	 * @param model
	 * @param college_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getProtocalState")
	@ResponseBody
	public String doGetProtocalState(String contractStatusValue)throws Exception{
		
		List<SelectItem> protocalStateList=jobInfoService.doGetProtocalState(contractStatusValue);
		
		JSONArray jsonArray=JSONArray.fromObject(protocalStateList);
		return jsonArray.toString();
		
	}
	
	/**
	 * 标记积极不积极
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/markIsPositive/{id}")
	@ResponseBody
	public String doMarkIsPositive(@PathVariable String id)throws Exception{
		
		JobInfoDomain jobInfoDomain=jobInfoService.doGetById(id);
		if(jobInfoDomain==null){
			return Consts.ERROR;
		}
		//null或者1，设置成2
		//2，设置成1
		if(jobInfoDomain.getIsPositive()==null){
			jobInfoDomain.setIsPositive(new Integer(CodeBookConsts.ISPOSITIVE_TYPE_B));
		}else{
			if(CodeBookConsts.ISPOSITIVE_TYPE_A.equals(jobInfoDomain.getIsPositive().toString())){
				jobInfoDomain.setIsPositive(new Integer(CodeBookConsts.ISPOSITIVE_TYPE_B));
			}else{
				jobInfoDomain.setIsPositive(new Integer(CodeBookConsts.ISPOSITIVE_TYPE_A));
			}		
		}

		if(jobInfoService.doSave(jobInfoDomain)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}

	/**
	 * 从excel中导入就业信息页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoExcelView")
	public String dojobInfoExcelView(Model model)throws Exception{
		
		List<CollegeDomain> collegeList=collegeService.doGetFilterList();
		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(null);
		List<SelectItem> classList=classService.dogetClasssByMajorId(null);
		List<GradeDomain> gradeList=gradeService.doGetFilterList();
		
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("classList", classList);
		model.addAttribute("gradeList", gradeList);
		
		return "/portalView/jobInfo/jobInfoExcelView";
	}
	
	/**
	 * 下载就业导入模板
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/downloadJobInfo")
	public void dodownloadJobInfo(HttpServletResponse response)throws Exception{
		FileUtil.fileDownload(response, Consts.DBTOEXCEL_PATH+Consts.JOBINFO_EXCEL, Consts.JOBINFO_EXCEL);
	}
	
	/**
	 * 将excel文件中就业信息写入数据库
	 * @param request
	 * @return
	 */
	@RequestMapping("/jobInfoExcelSave")
	@ResponseBody
	public String dojobInfoExcelSave(@RequestParam(value = "file", required = false) MultipartFile file,String classId)
	{
		try{
			ClassDomain classDomain=classService.doGetById(classId);
			ExcelToDBUtil.jobInfoexcelToDB(file,classDomain);
		}catch (Exception e) {
			return Consts.ERROR;
		}
		
		return Consts.SUCCESS;
	}
	
	/**
	 * 就业信息导出页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoDBToExcelView")
	public String doJobInfoDBToExcelView(Model model)throws Exception{
		
		List<CollegeDomain> collegeList=collegeService.doGetFilterList();
		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(null);
		List<SelectItem> classList=classService.dogetClasssByMajorId(null);
		List<GradeDomain> gradeList=gradeService.doGetFilterList();
		List<CodeBookDomain> contractStatusList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.CONTRACTSTATUS_TYPE);
		List<CodeBookDomain> protocalStateList=CodeBookHelper.getCodeBookByType(CodeBookConstsType.PROTOCALSTATE_TYPE);

		model.addAttribute("contractStatusList", contractStatusList);
		model.addAttribute("protocalStateList", protocalStateList);
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("classList", classList);
		model.addAttribute("gradeList", gradeList);
		
		return "/portalView/jobInfo/jobInfoDBToExcelView";
	}
	
	/**
	 * 生成就业信息导出文件
	 * @param gradeId
	 * @param collegeId
	 * @param majorId
	 * @param classId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoDBToExcel")
	@ResponseBody
	public String dojobInfoDBToExcel(HttpSession session,String gradeId,String collegeId,String majorId,String classId
			,String contractStatusId,String protocalStateId,String isPositive)throws Exception{
		
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		String filename=username+"_"+System.currentTimeMillis()+".xls";
		
		List<JobInfoDomain> jobInfoDomains=jobInfoService.doSearchJobInfoList(gradeId,collegeId, majorId, classId,contractStatusId,protocalStateId,isPositive);
		List<SelectItem> selectItems=jobInfoService.doJobInfoCount(gradeId, collegeId, majorId, classId,contractStatusId,protocalStateId,isPositive);
		String fileOutputName=DBToExcelUtil.jobInfoDBToExcel(jobInfoDomains, selectItems,Consts.DBTOEXCEL_PATH+filename,filename);
		
		if(fileOutputName.equals(filename)){
			return fileOutputName;
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
	public String dojobInfoCountView(Model model,String gradeId,String collegeId,String majorId,String classId)throws Exception{
		
		List<SelectItem> jobInfoCountList=jobInfoService.doJobInfoCount(gradeId, collegeId, majorId, classId,null,null,null);
		
		List<CollegeDomain> collegeList=collegeService.doGetFilterList();
		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(collegeId);
		List<SelectItem> classList=classService.dogetClasssByMajorId(majorId);
		List<GradeDomain> gradeList=gradeService.doGetFilterList();
		
		model.addAttribute("jobInfoCountList", jobInfoCountList);
		
		model.addAttribute("collegeList", collegeList);
		model.addAttribute("majorList", majorList);
		model.addAttribute("classList", classList);
		model.addAttribute("gradeList", gradeList);
		
		model.addAttribute("gradeId", gradeId);
		model.addAttribute("collegeId", collegeId);
		model.addAttribute("classId", classId);
		model.addAttribute("majorId", majorId);
		
		return "/portalView/jobInfo/jobInfoCountView";
	}
	
	/**
	 * 就业统计信息导出
	 * @param gradeId
	 * @param collegeId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/jobInfoCountDBToExcel")
	@ResponseBody
	public String dojobInfoCountDBToExcel(HttpSession session,String gradeId,String collegeId)throws Exception{
		
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		String filename=username+"_"+System.currentTimeMillis()+".xls";
		
		List<JobInfoCountBean> jobInfoCountBeans=jobInfoService.doJobInfoCountByClassInfo(gradeId, collegeId);
		String fileOutputName=DBToExcelUtil.jobInfoCountDBToExcel(jobInfoCountBeans, Consts.DBTOEXCEL_PATH+filename,filename);
		
		if(fileOutputName.equals(filename)){
			return fileOutputName;
		}
		
		return Consts.ERROR;
	}
	
	/**
	 * 下载就业统计信息
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/{fileOutputName}/downloadJobCount")
	public void dodownloadJobCount(HttpServletResponse response,@PathVariable String fileOutputName)throws Exception{
		
		FileUtil.fileDownload(response, Consts.DBTOEXCEL_PATH+fileOutputName, Consts.JOBCOUNT_EXCEL);
		FileUtil.delFile(Consts.DBTOEXCEL_PATH+fileOutputName);
	}
	

	

}
