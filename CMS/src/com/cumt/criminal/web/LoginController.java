package com.cumt.criminal.web;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.cumt.criminal.model.StaffDomain;
import com.cumt.criminal.service.StaffService;
import com.cumt.criminal.service.impl.StaffServiceImpl;
import com.cumt.criminal.util.GetClientIP;

/**
 * 登录和注册处理
 * @author {yuxiaoyan}}
 *
 */
@Controller
public class LoginController{
	
	@RequestMapping(value="/doLogin.do")
	protected ModelAndView doLogin(HttpServletRequest request,HttpServletResponse response) throws Exception {
		StaffService staffService = new StaffServiceImpl();
		
		//获取登录界面传来的用户信息
		String username = request.getParameter("username");//登录名
		String pwd = request.getParameter("passwordMD5");//注册密码
		String pwdCookieString = request.getParameter("password");//注册密码
		String flag=request.getParameter("remember");//是否记住用户名和密码
		String la=request.getParameter("rRadio");//身份选择
		String ip = GetClientIP.getRemortIP(request);//获取局域网ip
		String ipDB = null;//数据库中存储的ip
		StaffDomain staffDomain = staffService.queryStaffByName(username);//查找该用户名在数据库中的用户
		
		if (staffDomain!=null) {
			 ipDB = staffDomain.getIp();//上次登录的ip
			 System.out.println(ipDB+"------------"+ip);
		}else {
			request.setAttribute("info", "该用户名未注册");
			return new ModelAndView("login");
		}
		
		if("y".equals(flag)){
			//创建两个cookie对象
			Cookie nameCookie = new Cookie("useName", username);
			nameCookie.setMaxAge(3*24*60*60);//设置有效期为3天
			
			Cookie pwdCookie = new Cookie("pwd", pwdCookieString);
			pwdCookie.setMaxAge(3*24*60*60);//设置有效期为3天
			
			response.addCookie(nameCookie);
			response.addCookie(pwdCookie);
		}
		//管理员
		if ("2".equals(la)) {
			if (username.equals("admin")&&pwd.equals("96e79218965eb72c92a549dd5a330112")) {
				if (ipDB==null) {//如果没有登录
					request.setAttribute("trueadmin", "trueadmin");
					request.setAttribute("staffDomain", username);
					staffService.editIP(staffDomain, ip);//更新ip地址
					return new ModelAndView("login");//admin
				}else {
					if(ip.equals(ipDB)){
						request.setAttribute("info", "用户已在本机登录");
						request.setAttribute("staffDomain", username);
						return new ModelAndView("login");
					}else{
						request.setAttribute("info", "用户在其他地方登录，现重新登录");
						request.setAttribute("staffDomain", username);
						staffService.editIP(staffDomain, ip);
						return new ModelAndView("login");
					}
				}
			}else {
				request.setAttribute("info", "登录名或者密码错误");
				request.setAttribute("staffDomain", username);
				return new ModelAndView("login");
			}
		}else if("0".equals(la)){//上级
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+pwd+"==="+staffDomain.getLoginPwd());
				if (staffDomain.getLoginPwd().equals(pwd) ) {//如果密码和数据库中匹配
					if (staffDomain.getIdentify().equals("上级")) {//同时选择的身份是上级
						if (ipDB==null) {//如果没有登录
							request.setAttribute("staffDomain", username);
							request.setAttribute("ip", ip);
							staffService.editIP(staffDomain, ip);
							request.setAttribute("trueadmin", "trueshangji");
							return new ModelAndView("login");//AdminIndex
						}else {
							if(ip.equals(ipDB) ){
								request.setAttribute("info", "用户已在本机登录~");
								request.setAttribute("staffDomain", username);
								staffService.editIP(staffDomain, ip);
								return new ModelAndView("login");
							}else{
								request.setAttribute("info", "用户在其他地方登录，现重新登录~");
								request.setAttribute("staffDomain", username);
								staffService.editIP(staffDomain, ip);
								return new ModelAndView("login");
							}
						}
					}else {
						request.setAttribute("info", "权限不匹配");
						request.setAttribute("staffDomain", username);
						return new ModelAndView("login");
					}
				}else {
					request.setAttribute("info", "密码不正确");
					System.out.println("密码不正确");
					request.setAttribute("staffDomain", username);
					return new ModelAndView("login");
				}
		}else if("1".equals(la)){//民警
			System.out.println("~~~~~~~~~~~~~~~~~~~~~~~"+pwd+"==="+staffDomain.getLoginPwd());
				if (staffDomain.getLoginPwd().equals(pwd) ) {
					System.out.println(staffDomain.getIdentify());
					if (staffDomain.getIdentify().equals("民警")) {
						if (ipDB==null) {//如果没有登录
							request.setAttribute("trueadmin", "trueminjing");
							request.setAttribute("staffDomain", username);
							staffService.editIP(staffDomain, ip);
//							request.setAttribute("ip", ip);
							return new ModelAndView("login");//index
						}else {
							if(ip.equals(ipDB) ){
								request.setAttribute("info", "用户已在本机登录.");
								request.setAttribute("staffDomain", username);
								return new ModelAndView("login");
							}else{
								request.setAttribute("info", "用户在其他地方登录，现重新登录.");
								request.setAttribute("staffDomain", username);
								staffService.editIP(staffDomain, ip);
								return new ModelAndView("login");
							}
						}
					}else {
						request.setAttribute("info", "权限不匹配");
						request.setAttribute("staffDomain", username);
						return new ModelAndView("login");
					}
				}else {
					request.setAttribute("info", "密码不正确");
					request.setAttribute("staffDomain", username);
					return new ModelAndView("login");
				}
		}
		return new ModelAndView("login");
		
	}
	
}
