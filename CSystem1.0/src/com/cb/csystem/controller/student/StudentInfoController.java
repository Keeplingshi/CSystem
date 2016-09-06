package com.cb.csystem.controller.student;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cb.csystem.domain.StudentDomain;
import com.cb.csystem.service.IStudentService;

/**
 * 学生信息控制层
 * @author chen
 *
 */
@Controller
@RequestMapping("/studentinfo")
public class StudentInfoController {

	@Resource private IStudentService studentService;
	
	/**
	 * 学生主页
	 * @param model
	 * @return
	 */
	@RequestMapping("/studentIndex/{id}")
	public String dostudentIndex(Model model,@PathVariable String id) throws Exception{
		
		//获取student信息
		StudentDomain studentDomain=studentService.doGetById(id);
		model.addAttribute("studentDomain", studentDomain);
		
		return "/studentView/studentIndex";
	}
	
}
