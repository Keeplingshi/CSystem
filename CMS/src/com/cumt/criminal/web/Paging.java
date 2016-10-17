package com.cumt.criminal.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.cumt.criminal.model.ArrestDomain;
import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.model.CheckrecordDomian;
import com.cumt.criminal.model.DetentionDomain;
import com.cumt.criminal.model.LegalInstrumentDomain;
import com.cumt.criminal.model.QrecordDomain;
import com.cumt.criminal.model.StaffDomain;
import com.cumt.criminal.service.ArrestService;
import com.cumt.criminal.service.CaseRegisterService;
import com.cumt.criminal.service.CheckRecordService;
import com.cumt.criminal.service.DetentionService;
import com.cumt.criminal.service.LegalInstrumentService;
import com.cumt.criminal.service.QrecordService;
import com.cumt.criminal.service.StaffService;
import com.cumt.criminal.service.impl.ArrestServiceImpl;
import com.cumt.criminal.service.impl.CaseRegisterServiceImpl;
import com.cumt.criminal.service.impl.CheckRecordServiceImpl;
import com.cumt.criminal.service.impl.DetentionServiceImpl;
import com.cumt.criminal.service.impl.LegalInstrumentServiceImpl;
import com.cumt.criminal.service.impl.QrecordServiceImpl;
import com.cumt.criminal.service.impl.StaffServiceImpl;
import com.cumt.criminal.util.JsonDateProcessor;
@Controller
public class Paging {
	
	private StaffService staffService = new StaffServiceImpl();
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
	
	@RequestMapping(value="/pagingStaff.do")
	protected ModelAndView doStaffPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		
		@SuppressWarnings("unchecked")
		List<StaffDomain> staffDomainList = staffService.findPart(firstResult, maxReslt).getList();
		
		JSONArray jsonArray =null;
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonArray = JSONArray.fromObject(staffDomainList,jsonConfig);
		System.out.println("管理员查询"+jsonArray.toString()+"------------");

		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
	
	
	@RequestMapping(value="/paging.do")
	protected ModelAndView doCRPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		System.out.println("firstResult:"+firstResult+"  maxRsult:"+maxReslt);
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray =null;
		
		String flag=request.getParameter("flag");
		if ("police".equals(flag)) {
			List<CaseRegisterDomain> caseRegisterDomainList = caseRegisterService.findPart(firstResult, maxReslt).getList();
			System.out.println("==="+caseRegisterDomainList.size());
			jsonArray = JSONArray.fromObject(caseRegisterDomainList, jsonConfig);
		}else {
			List<CaseRegisterDomain> caseRegisterDomainList = caseRegisterService.findAll();
			List<CaseRegisterDomain> falseCRList =new ArrayList<CaseRegisterDomain>();
			for (CaseRegisterDomain cR:caseRegisterDomainList) {
				if (!cR.getState()) {
					falseCRList.add(cR);
				}
			}
			List<CaseRegisterDomain> lastPart = new ArrayList<CaseRegisterDomain>();
			int size = falseCRList.size();
			if(size == firstResult){
				lastPart.add(falseCRList.get(firstResult-1));
			}else if (size > firstResult && size <=maxReslt) {
				for (int i = firstResult-1; i < size; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else if(size > maxReslt){
				for (int i = firstResult-1; i < maxReslt; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else {
				lastPart = null;
			}
			jsonArray = JSONArray.fromObject(lastPart, jsonConfig);
		}
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
	
	@RequestMapping(value="/pagingLD.do")
	protected ModelAndView doLDPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		
		String flag=request.getParameter("flag");
		
		JSONArray jsonArray =null;
		if ("police".equals(flag)) {
			List<LegalInstrumentDomain> legalInstrumentDomainList = legalInstrumentService.findPart(firstResult, maxReslt).getList();
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonArray = JSONArray.fromObject(legalInstrumentDomainList,jsonConfig);
		}else {
			List<LegalInstrumentDomain> legalInstrumentDomainList = legalInstrumentService.findAll();
			List<LegalInstrumentDomain> falseCRList =new ArrayList<LegalInstrumentDomain>();
			for (LegalInstrumentDomain cR:legalInstrumentDomainList) {
				if (!cR.getResult_state()) {
					falseCRList.add(cR);
				}
			}
			List<LegalInstrumentDomain> lastPart = new ArrayList<LegalInstrumentDomain>();
			int size = falseCRList.size();
			if(size == firstResult){
				lastPart.add(falseCRList.get(firstResult-1));
			}else if (size > firstResult && size <=maxReslt) {
				for (int i = firstResult-1; i < size; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else if(size > maxReslt){
				for (int i = firstResult-1; i < maxReslt; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else {
				lastPart = null;
			}
			JsonConfig jsonConfig = new JsonConfig();
			jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonArray = JSONArray.fromObject(lastPart,jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
	
	@RequestMapping(value="/pagingQR.do")
	protected ModelAndView doQRPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		
		@SuppressWarnings("unchecked")
	
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray =null;
		
		String flag=request.getParameter("flag");
		if ("police".equals(flag)) {
			List<QrecordDomain> qrecordDomainList = qrecordService.findPart(firstResult, maxReslt).getList();
			jsonArray = JSONArray.fromObject(qrecordDomainList, jsonConfig);
		}else {
			List<QrecordDomain> qrecordDomainList = qrecordService.findAll();
			List<QrecordDomain> falseCRList =new ArrayList<QrecordDomain>();
			for (QrecordDomain cR:qrecordDomainList) {
				if (!cR.getResultState()) {
					falseCRList.add(cR);
				}
			}
			List<QrecordDomain> lastPart = new ArrayList<QrecordDomain>();
			int size = falseCRList.size();
			if(size == firstResult){
				lastPart.add(falseCRList.get(firstResult-1));
			}else if (size > firstResult && size <=maxReslt) {
				for (int i = firstResult-1; i < size; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else if(size > maxReslt){
				for (int i = firstResult-1; i < maxReslt; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else {
				lastPart = null;
			}
			jsonArray = JSONArray.fromObject(lastPart,jsonConfig);
		}
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
	@RequestMapping(value="/pagingCheckR.do")
	protected ModelAndView doCheckRPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		
		JSONArray jsonArray =null;
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		String flag=request.getParameter("flag");
		if ("police".equals(flag)) {
			List<CheckrecordDomian> checkRecordDomainList = checkRecordService.findPart(firstResult, maxReslt).getList();
			jsonArray = JSONArray.fromObject(checkRecordDomainList,jsonConfig);
		}else {
			List<CheckrecordDomian> checkRecordDomainList = checkRecordService.findAll();
			List<CheckrecordDomian> falseCRList =new ArrayList<CheckrecordDomian>();
			for (CheckrecordDomian cR:checkRecordDomainList) {
				if (!cR.getResultState()) {
					falseCRList.add(cR);
				}
			}
			List<CheckrecordDomian> lastPart = new ArrayList<CheckrecordDomian>();
			int size = falseCRList.size();
			if(size == firstResult){
				lastPart.add(falseCRList.get(firstResult-1));
			}else if (size > firstResult && size <=maxReslt) {
				for (int i = firstResult-1; i < size; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else if(size > maxReslt){
				for (int i = firstResult-1; i < maxReslt; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else {
				lastPart = null;
			}
			jsonArray = JSONArray.fromObject(lastPart,jsonConfig);
		}
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
	@RequestMapping(value="/pagingDetention.do")
	protected ModelAndView doDetentionPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray =null;
		
		String flag=request.getParameter("flag");
		if ("police".equals(flag)) {
			List<DetentionDomain> detentionDomainList = detentionService.findAll(firstResult, maxReslt).getList();
			jsonArray = JSONArray.fromObject(detentionDomainList,jsonConfig);
		}else {
			List<DetentionDomain> detentionDomainList = detentionService.findAll();
			List<DetentionDomain> falseCRList =new ArrayList<DetentionDomain>();
			for (DetentionDomain cR:detentionDomainList) {
				if (!cR.isResultState()) {
					falseCRList.add(cR);
				}
			}
			List<DetentionDomain> lastPart = new ArrayList<DetentionDomain>();
			int size = falseCRList.size();
			if(size == firstResult){
				lastPart.add(falseCRList.get(firstResult-1));
			}else if (size > firstResult && size <=maxReslt) {
				for (int i = firstResult-1; i < size; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else if(size > maxReslt){
				for (int i = firstResult-1; i < maxReslt; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else {
				lastPart = null;
			}
			jsonArray = JSONArray.fromObject(lastPart,jsonConfig);
		}
		
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
	@RequestMapping(value="/pagingArrest.do")
	protected ModelAndView doArrestPaging(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int pageSize = Integer.parseInt(request.getParameter("pageSize"));
		
		int firstResult =Integer.parseInt(request.getParameter("pageIndex"))*pageSize+1;
		int maxReslt =(Integer.parseInt(request.getParameter("pageIndex"))+1)*pageSize;
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray =null;
		
		String flag=request.getParameter("flag");
		if ("police".equals(flag)) {
			List<ArrestDomain> arrestDomainList = arrestService.findAll(firstResult, maxReslt).getList();
			jsonArray = JSONArray.fromObject(arrestDomainList,jsonConfig);
		}else {
			List<ArrestDomain> arrestDomainList = arrestService.findAll();
			List<ArrestDomain> falseCRList =new ArrayList<ArrestDomain>();
			for (ArrestDomain cR:arrestDomainList) {
				if (!cR.isResultState()) {
					falseCRList.add(cR);
				}
			}
			List<ArrestDomain> lastPart = new ArrayList<ArrestDomain>();
			int size = falseCRList.size();
			if(size == firstResult){
				lastPart.add(falseCRList.get(firstResult-1));
			}else if (size > firstResult && size <=maxReslt) {
				for (int i = firstResult-1; i < size; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else if(size > maxReslt){
				for (int i = firstResult-1; i < maxReslt; i++) {
					lastPart.add(falseCRList.get(i));
				}
			}else {
				lastPart = null;
			}
			jsonArray = JSONArray.fromObject(lastPart,jsonConfig);
		}
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;//new ModelAndView("imgtable")
	}
}
