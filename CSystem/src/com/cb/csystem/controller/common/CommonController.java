package com.cb.csystem.controller.common;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.cb.csystem.domain.UserDomain;
import com.cb.csystem.service.IClassService;
import com.cb.csystem.service.IJobInfoService;
import com.cb.csystem.service.IMajorService;
import com.cb.csystem.service.IUserService;
import com.cb.csystem.util.Consts;
import com.cb.system.util.EndecryptUtils;
import com.cb.system.util.SelectItem;

/**
 * 公共页面控制层
 * @author chen
 *
 */
@Controller
@RequestMapping("/common")
public class CommonController {

	@Resource private IUserService userService;
	@Resource private IJobInfoService jobInfoService;
	@Resource private IMajorService majorService;
	@Resource private IClassService classService;
	
	/**
	 * 修改用户密码界面
	 * @param model
	 * @param userId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifyPasswordView")
	public String domodifyPasswordView(Model model,HttpSession session)throws Exception{
		
		String username=(String) session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		model.addAttribute("userDomain", userDomain);
		
		return "/commonView/modifyPasswordView";
	}
	
	/**
	 * 修改密码
	 * @param session
	 * @param oldpassword
	 * @param password
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/modifuPassword")
	@ResponseBody
	public String domodifuPassword(HttpSession session,String oldpassword,String password)throws Exception{
		
		String username=(String) session.getAttribute(Consts.CURRENT_USER);
		UserDomain userDomain=userService.doGetUserByUsername(username);
		if(userDomain!=null){
			if(EndecryptUtils.md5(oldpassword).equals(userDomain.getPassword())){
				userDomain.setPassword(EndecryptUtils.md5(password));
				if(userService.doSave(userDomain)){
					return Consts.SUCCESS;
				}
			}			
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
	 * 根据学院查找专业
	 * @param model
	 * @param college_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getMajorByCollege")
	@ResponseBody
	public String dogetMajorByCollege(Model model,String college_id)throws Exception{
		
		List<SelectItem> majorList=majorService.dogetMajorsByCollegeId(college_id);
		
		JSONArray jsonArray=JSONArray.fromObject(majorList);
		return jsonArray.toString();
		
	}
	
	/**
	 * 根据专业查找相应班级
	 * @param model
	 * @param major_id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/getClassByMajor")
	@ResponseBody
	public String dogetClassByMajor(Model model,String major_id)throws Exception{
		
		List<SelectItem> classList=classService.dogetClasssByMajorId(major_id);
		
		JSONArray jsonArray=JSONArray.fromObject(classList);
		return jsonArray.toString();
		
	}
	
}
