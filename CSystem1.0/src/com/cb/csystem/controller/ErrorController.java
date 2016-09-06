/**
 * 
 */
package com.cb.csystem.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 报错控制层
 * @author chenbin
 */
@Controller
public class ErrorController {

	/**
	 * 没有权限页面
	 * @return
	 */
	@RequestMapping("/unauthorized")
	public String unauthorized(){
		return "/unauthorized";
	}
	
	/**
	 * 报错页面
	 * @return
	 */
	@RequestMapping("/error")
	public String error(){
		return "/error";
	}
	
}
