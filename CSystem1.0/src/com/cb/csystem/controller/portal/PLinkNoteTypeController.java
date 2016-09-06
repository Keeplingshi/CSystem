package com.cb.csystem.controller.portal;

import java.util.List;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cb.csystem.domain.LinkNoteTypeDomain;
import com.cb.csystem.service.ILinkNoteTypeService;
import com.cb.csystem.util.Consts;

/**
 * 联系笔记类型控制层
 * @author portalistrator
 *
 */
@Controller
@RequestMapping("/portal/linkNoteType")
public class PLinkNoteTypeController {

	@Resource private ILinkNoteTypeService linkNoteTypeService;
	
	/**
	 * 违纪列表
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteTypeList")
	public String getlinkNoteTypeList(Model model)throws Exception{
		
		List<LinkNoteTypeDomain> linkNoteTypeList=linkNoteTypeService.doGetFilterList();
		model.addAttribute("linkNoteTypeList", linkNoteTypeList);
		
		return "/portalView/linkNoteType/linkNoteTypeList";
	}
	
	/**
	 * 违纪详情页面
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteTypeView/{id}")
	public String dolinkNoteTypeView(Model model,@PathVariable String id) throws Exception{
		
		//获取linkNoteType信息
		LinkNoteTypeDomain linkNoteTypeDomain=linkNoteTypeService.doGetById(id);
		model.addAttribute("linkNoteTypeDomain", linkNoteTypeDomain);
		
		return "/portalView/linkNoteType/linkNoteTypeView";
	}
	
	/**
	 * 违纪修改页面
	 * @param model
	 * @param id
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteTypeEdit/{id}")
	public String dolinkNoteTypeEdit(Model model,@PathVariable String id) throws Exception{
		
		//获取linkNoteType信息
		LinkNoteTypeDomain linkNoteTypeDomain=linkNoteTypeService.doGetById(id);
		model.addAttribute("linkNoteTypeDomain", linkNoteTypeDomain);
		
		return "/portalView/linkNoteType/linkNoteTypeEdit";
	}
	
	/**
	 * 新增违纪页面
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/linkNoteTypeAdd")
	public String dolinkNoteTypeAdd(Model model)throws Exception{
		
		return "/portalView/linkNoteType/linkNoteTypeAdd";
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
	public String doSave(@Valid @ModelAttribute("domain") LinkNoteTypeDomain domain,
			BindingResult result)throws Exception{
		if (result.hasErrors()) {// 如果校验失败,则返回
			return Consts.ERROR;
		} else {
			if(linkNoteTypeService.doSave(domain)){
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
		
		if(linkNoteTypeService.doDeleteById(id)){
			return Consts.SUCCESS;
		}
		
		return Consts.ERROR;
	}
	
}
