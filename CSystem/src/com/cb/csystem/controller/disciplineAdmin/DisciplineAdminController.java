package com.cb.csystem.controller.disciplineAdmin;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
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

import com.cb.csystem.domain.CollegeDomain;
import com.cb.csystem.domain.DisciplineDomain;
import com.cb.csystem.domain.DisciplineTypeDomain;
import com.cb.csystem.domain.GradeDomain;
import com.cb.csystem.domain.StudentDomain;
import com.cb.csystem.domain.UserDomain;
import com.cb.csystem.service.IClassService;
import com.cb.csystem.service.ICollegeService;
import com.cb.csystem.service.IDisciplineService;
import com.cb.csystem.service.IDisciplineTypeService;
import com.cb.csystem.service.IGradeService;
import com.cb.csystem.service.IMajorService;
import com.cb.csystem.service.IStudentService;
import com.cb.csystem.service.IUserService;
import com.cb.csystem.util.Consts;
import com.cb.system.util.PageInfo;
import com.cb.system.util.SelectItem;

/**
 * 违纪控制层
 * @author Administrator
 *
 */
@Controller
@RequestMapping("/disciplineAdmin/discipline")
public class DisciplineAdminController {

	@Resource private IUserService userService;
	@Resource private IDisciplineService disciplineService;
	@Resource private IDisciplineTypeService disciplineTypeService;
	@Resource private IGradeService gradeService;
	@Resource private IMajorService majorService;
	@Resource private ICollegeService collegeService;
	@Resource private IClassService classService;
	@Resource private IStudentService studentService;
	
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
	
	@RequestMapping("/disciplineList")
	public String dodisciplineList(@ModelAttribute("pageInfo") PageInfo pageInfo
			,HttpSession session,BindingResult bindingResult,Model model)throws Exception{
		
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		String userId=userDomain.getId();
		
		if(userDomain.getCollege()!=null){
			
			String collegeId=userDomain.getCollege().getId();
			
			List<DisciplineDomain> disciplineList=disciplineService.doSearchPageList(pageInfo, userId, null, collegeId, null, null, null, null, null, null, null, null);
			List<DisciplineTypeDomain> disciplineTypeList=disciplineTypeService.doGetFilterList();
			List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(null);
			List<SelectItem> classList=classService.dogetClasssByMajorId(null);
			List<GradeDomain> gradeList=gradeService.doGetFilterList();
			
			model.addAttribute("disciplineList", disciplineList);
			model.addAttribute("disciplineTypeList", disciplineTypeList);
			model.addAttribute("majorList", majorList);
			model.addAttribute("classList", classList);
			model.addAttribute("gradeList", gradeList);
		}
		
		return "/disciplineAdminView/discipline/disciplineList";
	}
	
	/**
	 * 违纪列表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disciplineSearchList")
	public String getdisciplineSearchList(@ModelAttribute("pageInfo") PageInfo pageInfo,Model model
			,HttpSession session,String gradeId,String majorId,String classId,String disciplineTypeId
			,@RequestParam(value ="beginTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date beginTime
			,@RequestParam(value ="endTime") @DateTimeFormat(pattern="yyyy-MM-dd") Date endTime
			,String searchText,String sortMode,String sortValue)throws Exception{
		
		//获取用户名
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		String userId=userDomain.getId();
		
		if(userDomain!=null){
			if(userDomain.getCollege()!=null){
				String collegeId=userDomain.getCollege().getId();
				
				List<DisciplineDomain> disciplineList=disciplineService.doSearchPageList(pageInfo,userId,gradeId
						,collegeId,majorId,classId,disciplineTypeId,beginTime,endTime,searchText,sortMode,sortValue);
				List<DisciplineTypeDomain> disciplineTypeList=disciplineTypeService.doGetFilterList();
				List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(null);
				List<SelectItem> classList=classService.dogetClasssByMajorId(null);
				List<GradeDomain> gradeList=gradeService.doGetFilterList();
				
				model.addAttribute("disciplineList", disciplineList);
				model.addAttribute("disciplineTypeList", disciplineTypeList);
				model.addAttribute("majorList", majorList);
				model.addAttribute("classList", classList);
				model.addAttribute("gradeList", gradeList);
				
				model.addAttribute("gradeId", gradeId);
				model.addAttribute("majorId", majorId);
				model.addAttribute("classId", classId);
				model.addAttribute("disciplineTypeId", disciplineTypeId);
				model.addAttribute("beginTime", beginTime);
				model.addAttribute("endTime", endTime);
				model.addAttribute("searchText", searchText);
				model.addAttribute("sortMode", sortMode);
				model.addAttribute("sortValue", sortValue);
			}
		}
		
		return "/disciplineAdminView/discipline/disciplineList";
	}
	

	
	/**
	 * 违纪详情页面
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disciplineView/{id}")
	public String dodisciplineView(Model model,@PathVariable String id) throws Exception{
		
		//获取discipline信息
		DisciplineDomain disciplineDomain=disciplineService.doGetById(id);
		model.addAttribute("disciplineDomain", disciplineDomain);
		
		return "/disciplineAdminView/discipline/disciplineView";
	}
	
	/**
	 * 新增违纪页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disciplineAdd")
	public String dodisciplineAdd(Model model)throws Exception{
		
		List<DisciplineTypeDomain> disciplineTypeList=disciplineTypeService.doGetFilterList();
		model.addAttribute("disciplineTypeList", disciplineTypeList);
		
		return "/disciplineAdminView/discipline/disciplineAdd";
	}
	
	/**
	 * 修改违纪
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disciplineEdit/{id}")
	public String dodisciplineEdit(Model model,@PathVariable String id)throws Exception{
		
		//获取discipline信息
		DisciplineDomain disciplineDomain=disciplineService.doGetById(id);
		model.addAttribute("disciplineDomain", disciplineDomain);
		List<DisciplineTypeDomain> disciplineTypeList=disciplineTypeService.doGetFilterList();
		model.addAttribute("disciplineTypeList", disciplineTypeList);
		
		return "/disciplineAdminView/discipline/disciplineEdit";
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
	public String doSave(@Valid @ModelAttribute("domain") DisciplineDomain domain,
			HttpSession session,BindingResult result)throws Exception{
		if (result.hasErrors()) {// 如果校验失败,则返回
			return Consts.ERROR;
		} else {
			
			String username=(String)session.getAttribute(Consts.CURRENT_USER);
			UserDomain userDomain=userService.doGetUserByUsername(username);
			domain.setUserId(userDomain.getId());
			
			if(disciplineService.doSave(domain)){
				return Consts.SUCCESS;
			}
		}
		return Consts.ERROR;
	}
	
	/**
	 * 学生查询
	 * @param pagedialogInfo
	 * @param model
	 * @param gradeId
	 * @param collegeId
	 * @param majorId
	 * @param classId
	 * @param searchText
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/studentDiscipline")
	public String dostudentDiscipline(@ModelAttribute("pagedialogInfo") PageInfo pagedialogInfo,Model model,
			HttpSession session,String gradeId,String majorId,String classId,String searchText)throws Exception{
		
		//获取用户名
		String username=(String)session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		
		if(userDomain!=null){
			if(userDomain.getCollege()!=null){
				String collegeId=userDomain.getCollege().getId();
				
				List<GradeDomain> gradeList=gradeService.doGetFilterList();
				List<CollegeDomain> collegeList=collegeService.doGetFilterList();
				List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(collegeId);
				List<SelectItem> classList=classService.dogetClasssByMajorId(majorId);
				List<StudentDomain> studentList=studentService.doSearchstudentPageList(pagedialogInfo, gradeId, collegeId, majorId, classId, searchText, null, null);
				
				model.addAttribute("gradeList", gradeList);
				model.addAttribute("collegeList", collegeList);
				model.addAttribute("majorList", majorList);
				model.addAttribute("classList", classList);
				model.addAttribute("studentList", studentList);
				model.addAttribute("classId", classId);
				model.addAttribute("majorId", majorId);
				model.addAttribute("collegeId", collegeId);
				model.addAttribute("searchText", searchText);
			}
		}
		
		return "/disciplineAdminView/discipline/studentDiscipline";
	}
	
	
	
}
