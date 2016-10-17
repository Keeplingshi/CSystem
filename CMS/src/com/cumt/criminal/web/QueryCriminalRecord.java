package com.cumt.criminal.web;

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
import com.cumt.criminal.util.QueryResultUtil;
import com.cumt.criminal.util.VarUtil;

/**
 * 刑事案件记录对应的controller
 * @author {yuxiaoyan}}
 *
 */
@Controller
public class QueryCriminalRecord{

	private StaffService staffService = new StaffServiceImpl();
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();
	
	@RequestMapping(value="/queryOneStaff.do")
	protected ModelAndView doqueryOneStaff(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		String username = request.getParameter("loginName");
		System.out.println("====="+username);
		StaffDomain staffDomain = staffService.queryStaffByName(username);
		jsonArray = JSONArray.fromObject(staffDomain, jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	@RequestMapping(value="/queryAllStaff.do")
	protected ModelAndView doAllStaff(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<StaffDomain> staffDomainList = staffService.findAll();
		jsonArray = JSONArray.fromObject(staffDomainList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/queryStaff.do")
	protected ModelAndView doQueryStaff(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag=request.getParameter("flag");
		
		//先获取第八页放在第一页
		List<StaffDomain> staffDomainList = staffService.findPart(1, VarUtil.PageIndex).getList();
		System.out.println(staffDomainList.size());
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("search".equals(flag)) {
			String info = request.getParameter("info");
			System.out.println("info的信息是："+info);
			if ("staffID".equals(info)) {
				int staffID = Integer.parseInt(request.getParameter("staffID"));
				QueryResultUtil q = staffService.queryByID(staffID);
				if (q!=null) {
					staffDomainList = q.getList();
				}else {
					return null;
				}
				
				List<StaffDomain> temp = new ArrayList<StaffDomain>();
				if(staffDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(staffDomainList.get(i));
					}
				}else {
					temp = staffDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if ("staffName".equals(info)) {
				String staffName =new String(request.getParameter("staffName").getBytes("ISO-8859-1"),"UTF-8"); 
				QueryResultUtil q = staffService.queryBytrueName(staffName);
				if (q!=null) {
					staffDomainList = q.getList();
				}else {
					return null;
				}
				List<StaffDomain> temp = new ArrayList<StaffDomain>();
				if(staffDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(staffDomainList.get(i));
					}
				}else {
					temp = staffDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if ("idcard".equals(info)) {
				String idcard = request.getParameter("idcard");
				QueryResultUtil q = staffService.queryByIDCard(idcard);
				if (q!=null) {
					staffDomainList = q.getList();
				}else {
					return null;
				}
				List<StaffDomain> temp = new ArrayList<StaffDomain>();
				if(staffDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(staffDomainList.get(i));
					}
				}else {
					temp = staffDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if ("loginname".equals(info)) {
				String loginname = request.getParameter("loginname");
				jsonArray = JSONArray.fromObject(staffService.queryStaffByName(loginname), jsonConfig);
			}
		}else {
			jsonArray = JSONArray.fromObject(staffDomainList, jsonConfig);
		}
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}

	@RequestMapping(value="/query.do")
	protected ModelAndView doQueryCRRecord(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String flag=request.getParameter("flag");
		@SuppressWarnings("unchecked")
		//先获取第八页放在第一页
		
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("".equals(flag)) {
			List<CaseRegisterDomain> caseRegisterDomainList = caseRegisterService.findPart(1, VarUtil.PageIndex).getList();
//			jsonConfig.setExcludes(excludes);
			jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
			jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			jsonArray = JSONArray.fromObject(caseRegisterDomainList, jsonConfig);
		}else if("search".equals(flag)){
			String info = request.getParameter("info");//获取搜索类别
			CaseRegisterDomain caseRegisterDomain =null;
			if("id".equals(info)){
				int id = Integer.parseInt(request.getParameter("id"));
			    caseRegisterDomain = caseRegisterService.queryCaseRegisterById(id);
			    jsonArray = JSONArray.fromObject(caseRegisterDomain, jsonConfig);
			}else if("day".equals(info)){
				String day = new String (request.getParameter("day").getBytes("ISO-8859-1"),"UTF-8");
			    @SuppressWarnings("unchecked")
				List<CaseRegisterDomain> caseRegisterList = caseRegisterService.queryByDay(day).getList();
			    //搜索前6条
			    List<CaseRegisterDomain> temp = new ArrayList<CaseRegisterDomain>();
				if(caseRegisterList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(caseRegisterList.get(i));
					}
				}else {
					temp = caseRegisterList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
				
			}else if("name".equals(info)){
				String name = new String (request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<CaseRegisterDomain> caseRegisterList = caseRegisterService.queryByName(name).getList();
				 //搜索前6条
			    List<CaseRegisterDomain> temp = new ArrayList<CaseRegisterDomain>();
				if(caseRegisterList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(caseRegisterList.get(i));
					}
				}else {
					temp = caseRegisterList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("state".equals(info)){
				String state =new String (request.getParameter("state").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<CaseRegisterDomain> caseRegisterList =  caseRegisterService.queryByState(state).getList();
				 //搜索前6条
			    List<CaseRegisterDomain> temp = new ArrayList<CaseRegisterDomain>();
				if(caseRegisterList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(caseRegisterList.get(i));
					}
				}else {
					temp = caseRegisterList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			
		}else {
			List<CaseRegisterDomain> falseCRList =new ArrayList<CaseRegisterDomain>();
			List<CaseRegisterDomain> caseRegisterDomainList = caseRegisterService.findAll();
			//查询到所以的未审核通过的
			for (CaseRegisterDomain cR:caseRegisterDomainList) {
				if (!cR.getState()) {
					falseCRList.add(cR);
				}
			}
			List<CaseRegisterDomain> partCaseRegisterDomains = new ArrayList<CaseRegisterDomain>();
				if (falseCRList.size()>VarUtil.PageIndex) {//未通过的多于6个，则取前6个
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						partCaseRegisterDomains.add(falseCRList.get(i));
					}
				}else{
					partCaseRegisterDomains = falseCRList;
				}
			jsonArray = JSONArray.fromObject(partCaseRegisterDomains, jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}

	@RequestMapping(value="/queryLawDocument.do")
	protected ModelAndView doQueryLawDocument(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag=request.getParameter("flag");
		@SuppressWarnings("unchecked")
		//先获取第八页放在第一页
		List<LegalInstrumentDomain> legalInstrumentDomainList = legalInstrumentService.findPart(1, VarUtil.PageIndex).getList();
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("".equals(flag)) {
			jsonArray = JSONArray.fromObject(legalInstrumentDomainList, jsonConfig);
			System.out.println("普通员工"+jsonArray.toString()+"------------");
		}else if("search".equals(flag)){
			
			String info = request.getParameter("info");//获取搜索类别
			System.out.println("=================info"+info);
			LegalInstrumentDomain legalInstrumentDomain =null;
			if("id".equals(info)){
				int id = Integer.parseInt(request.getParameter("id"));
				legalInstrumentDomain = legalInstrumentService.queryLegalInstrumentById(id);
			    jsonArray = JSONArray.fromObject(legalInstrumentDomain, jsonConfig);
			}else if("staffName".equals(info)){
				String name = new String (request.getParameter("staffName").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<LegalInstrumentDomain> legalInstrumentList = legalInstrumentService.queryByName(name).getList();
				System.out.println(legalInstrumentList.size()); 
				//搜索前6条
			    List<LegalInstrumentDomain> temp = new ArrayList<LegalInstrumentDomain>();
				if(legalInstrumentList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(legalInstrumentList.get(i));
						System.out.println(i);
					}
				}else {
					temp = legalInstrumentList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("resultState".equals(info)){
				String resultState =new String (request.getParameter("resultState").getBytes("ISO-8859-1"),"UTF-8");
				System.out.println(resultState);
				@SuppressWarnings("unchecked")
				List<LegalInstrumentDomain> legalInstrumentList = legalInstrumentService.queryByState(resultState).getList();
				 //搜索前6条
			    List<LegalInstrumentDomain> temp = new ArrayList<LegalInstrumentDomain>();
				if(legalInstrumentList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(legalInstrumentList.get(i));
					}
				}else {
					temp = legalInstrumentList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
		}else {
			//还没有处理的呈请文书
			List<LegalInstrumentDomain> falseldList =new ArrayList<LegalInstrumentDomain>();
			List<LegalInstrumentDomain> legalInstrumentDomainListA = legalInstrumentService.findAll();
			for (LegalInstrumentDomain ld:legalInstrumentDomainListA) {
				if (!ld.getResult_state()) {
					falseldList.add(ld);
				}
			}
			//搜索前6条
		    List<LegalInstrumentDomain> temp = new ArrayList<LegalInstrumentDomain>();
			if(falseldList.size()> VarUtil.PageIndex){
				for (int i = 0; i < VarUtil.PageIndex; i++) {
					temp.add(falseldList.get(i));
				}
			}else {
				temp = falseldList;
			}
			jsonArray = JSONArray.fromObject(temp, jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryQRecord.do")
	protected ModelAndView doQueryQRecord(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag=request.getParameter("flag");
		@SuppressWarnings("unchecked")
		//先获取第八页放在第一页
		List<QrecordDomain> qrecordDomainList = qrecordService.findPart(1, 6).getList();
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("".equals(flag)) {
			jsonArray = JSONArray.fromObject(qrecordDomainList, jsonConfig);
			System.out.println("普通员工"+jsonArray.toString()+"------------");
		}else if("search".equals(flag)){
			
			String info = request.getParameter("info");//获取搜索类别
			QrecordDomain qrecordDomain =null;
			if("id".equals(info)){
				int id = Integer.parseInt(request.getParameter("id"));
				qrecordDomain = qrecordService.queryQRecordById(id);
			    jsonArray = JSONArray.fromObject(qrecordDomain, jsonConfig);
			}else if("state".equals(info)){
				String state = new String (request.getParameter("state").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<QrecordDomain> qrecordList = qrecordService.queryByState(state).getList();
				 //搜索前6条
			    List<QrecordDomain> temp = new ArrayList<QrecordDomain>();
				if(qrecordList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(qrecordList.get(i));
					}
				}else{
					temp = qrecordList;
				}	
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("resultState".equals(info)){
				String resultState =new String (request.getParameter("resultState").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<QrecordDomain> qrecordList = qrecordService.queryByResultState(resultState).getList();
				 //搜索前6条
			    List<QrecordDomain> temp = new ArrayList<QrecordDomain>();
				if(qrecordList.size()> VarUtil.PageIndex){
						for (int i = 0; i < VarUtil.PageIndex; i++) {
							temp.add(qrecordList.get(i));
						}
				}else {
					temp = qrecordList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("askTime".equals(info)){
				String askTime =new String (request.getParameter("askTime").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<QrecordDomain> qrecordList = qrecordService.queryByTime(askTime).getList();
				 //搜索前6条
			    List<QrecordDomain> temp = new ArrayList<QrecordDomain>();
				if(qrecordList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(qrecordList.get(i));
					}
				}else {
					temp = qrecordList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			else if("askPerson".equals(info)){
				String askPerson =new String (request.getParameter("askPerson").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<QrecordDomain> qrecordList = qrecordService.queryByName(askPerson).getList();
				 //搜索前6条
			    List<QrecordDomain> temp = new ArrayList<QrecordDomain>();
				if(qrecordList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(qrecordList.get(i));
					}
				}else {
					temp = qrecordList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			
		}else {
			//还没有处理的呈请文书
			List<QrecordDomain> qrecordDomainList1 = qrecordService.findAll();
			List<QrecordDomain> falseldList =new ArrayList<QrecordDomain>();
			for (QrecordDomain qr:qrecordDomainList1) {
				if (!qr.getState()||!qr.getResultState()) {
					falseldList.add(qr);
				}
			}
			//搜索前6条
		    List<QrecordDomain> temp = new ArrayList<QrecordDomain>();
			if(falseldList.size()> VarUtil.PageIndex){
				for (int i = 0; i < VarUtil.PageIndex; i++) {
					temp.add(falseldList.get(i));
				}
			}else {
				temp = falseldList;
			}
			jsonArray = JSONArray.fromObject(temp, jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryCheckRecord.do")
	protected ModelAndView doQueryCheckRecord(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag=request.getParameter("flag");
		@SuppressWarnings("unchecked")
		//先获取第八页放在第一页
		List<CheckrecordDomian> checkRecordList = checkRecordService.findPart(1, VarUtil.PageIndex).getList();
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("".equals(flag)) {
			jsonArray = JSONArray.fromObject(checkRecordList, jsonConfig);
			System.out.println("普通员工"+jsonArray.toString()+"------------");
		}else if("search".equals(flag)){
			
			String info = request.getParameter("info");//获取搜索类别
			CheckrecordDomian checkrecordDomian =null;
			if("id".equals(info)){
				int id = Integer.parseInt(request.getParameter("id"));
				checkrecordDomian = checkRecordService.queryCheckDomain(id);
			    jsonArray = JSONArray.fromObject(checkrecordDomian, jsonConfig);
			}else if("state".equals(info)){
				String state = new String (request.getParameter("state").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<CheckrecordDomian> checkList = checkRecordService.queryByState(state).getList();
				 //搜索前6条
			    List<CheckrecordDomian> temp = new ArrayList<CheckrecordDomian>();
				if(checkList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(checkList.get(i));
					}
				}else {
					temp = checkList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);

			}else if("resultState".equals(info)){
				String resultState =new String (request.getParameter("resultState").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<CheckrecordDomian> checkList = checkRecordService.queryByResultState(resultState).getList();
				 //搜索前6条
			    List<CheckrecordDomian> temp = new ArrayList<CheckrecordDomian>();
				if(checkList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(checkList.get(i));
					}
				}else {
					temp = checkList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			
		}else {
			//还没有处理的呈请文书
			List<CheckrecordDomian> checkRecordList1 = checkRecordService.findAll();
			List<CheckrecordDomian> falseldList =new ArrayList<CheckrecordDomian>();
			for (CheckrecordDomian cr:checkRecordList1) {
				if (!cr.getState()||!cr.getResultState()) {
					falseldList.add(cr);
				}
			}
			//搜索前6条
		    List<CheckrecordDomian> temp = new ArrayList<CheckrecordDomian>();
			if(falseldList.size()> VarUtil.PageIndex){
				for (int i = 0; i < VarUtil.PageIndex; i++) {
					temp.add(falseldList.get(i));
				}
			}else {
				temp = falseldList;
			}
			jsonArray = JSONArray.fromObject(temp, jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryDetention.do")
	protected ModelAndView doQueryDetention(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag=request.getParameter("flag");
		@SuppressWarnings("unchecked")
		//先获取第八页放在第一页
		List<DetentionDomain> detentionList = detentionService.findAll(1,6).getList();
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("".equals(flag)) {
			jsonArray = JSONArray.fromObject(detentionList, jsonConfig);
			System.out.println("普通员工"+jsonArray.toString()+"------------");
		}else if("search".equals(flag)){
			
			String info = request.getParameter("info");//获取搜索类别
			DetentionDomain detentionDomain =null;
			if("id".equals(info)){
				int id = Integer.parseInt(request.getParameter("id"));
				detentionDomain = detentionService.queryDetention(id);
			    jsonArray = JSONArray.fromObject(detentionDomain, jsonConfig);
			}else if("state".equals(info)){
				String state = new String (request.getParameter("state").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<DetentionDomain> checkList = detentionService.queryByState(state).getList();
				 //搜索前6条
			    List<DetentionDomain> temp = new ArrayList<DetentionDomain>();
				if(checkList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(checkList.get(i));
					}
				}else {
					temp = checkList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("resultState".equals(info)){
				String resultState =new String (request.getParameter("resultState").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<DetentionDomain> checkList = detentionService.queryByResultState(resultState).getList();
			     //搜索前6条
			    List<DetentionDomain> temp = new ArrayList<DetentionDomain>();
				if(checkList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(checkList.get(i));
					}
				}else {
					temp = checkList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("handlePerson".equals(info)){
				String handlePerson =new String (request.getParameter("handlePerson").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<DetentionDomain> checkList = detentionService.queryByName(handlePerson).getList();
				 //搜索前6条
			    List<DetentionDomain> temp = new ArrayList<DetentionDomain>();
				if(checkList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(checkList.get(i));
					}
				}else {
					temp = checkList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			else if("time".equals(info)){
				String time =new String (request.getParameter("time").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<DetentionDomain> checkList = detentionService.queryByTime(time).getList();
				 //搜索前6条
			    List<DetentionDomain> temp = new ArrayList<DetentionDomain>();
				if(checkList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(checkList.get(i));
					}
				}else {
					temp = checkList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
		}else {
			//还没有处理的呈请文书
			List<DetentionDomain> detentionList1 = detentionService.findAll();
			List<DetentionDomain> falseldList =new ArrayList<DetentionDomain>();
			for (DetentionDomain detention:detentionList1) {
				if (!detention.isState()||!detention.isResultState()) {
					falseldList.add(detention);
				}
			}
			//搜索前6条
		    List<DetentionDomain> temp = new ArrayList<DetentionDomain>();
			if(falseldList.size()> VarUtil.PageIndex){
				for (int i = 0; i < VarUtil.PageIndex; i++) {
					temp.add(falseldList.get(i));
				}
			}else {
				temp = falseldList;
			}
			jsonArray = JSONArray.fromObject(temp, jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryArrest.do")
	protected ModelAndView doQueryArrest(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String flag=request.getParameter("flag");
		@SuppressWarnings("unchecked")
		//先获取第八页放在第一页
		List<ArrestDomain> arrestList = arrestService.findAll(1, 6).getList();
		//处理list的日期形式
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		JSONArray jsonArray = null;
		
		if ("".equals(flag)) {
			jsonArray = JSONArray.fromObject(arrestList, jsonConfig);
			System.out.println("普通员工"+jsonArray.toString()+"------------");
		}else if("search".equals(flag)){
			
			String info = request.getParameter("info");//获取搜索类别
			System.out.println("--------"+info);
			ArrestDomain arrestDomain =null;
			if("id".equals(info)){
				int id = Integer.parseInt(request.getParameter("id"));
				arrestDomain = arrestService.queryArrest(id);
			    jsonArray = JSONArray.fromObject(arrestDomain, jsonConfig);
			}else if("state".equals(info)){
				String state = new String (request.getParameter("state").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<ArrestDomain> arrestDomainList = arrestService.queryByState(state).getList();
				 //搜索前6条
			    List<ArrestDomain> temp = new ArrayList<ArrestDomain>();
				if(arrestDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(arrestDomainList.get(i));
					}
				}else {
					temp = arrestDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("resultState".equals(info)){
				String resultState =new String (request.getParameter("resultState").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<ArrestDomain> arrestDomainList = arrestService.queryByResultState(resultState).getList();
				//搜索前6条
			    List<ArrestDomain> temp = new ArrayList<ArrestDomain>();
				if(arrestDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(arrestDomainList.get(i));
					}
				}else {
					temp = arrestDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}else if("handlePerson".equals(info)){
				String handlePerson =new String (request.getParameter("handlePerson").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<ArrestDomain> arrestDomainList = arrestService.queryByName(handlePerson).getList();
				//搜索前6条
			    List<ArrestDomain> temp = new ArrayList<ArrestDomain>();
				if(arrestDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(arrestDomainList.get(i));
					}
				}else {
					temp = arrestDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			else if("time".equals(info)){
				String time =new String (request.getParameter("time").getBytes("ISO-8859-1"),"UTF-8");
				@SuppressWarnings("unchecked")
				List<ArrestDomain> arrestDomainList = arrestService.queryByTime(time).getList();
				//搜索前6条
			    List<ArrestDomain> temp = new ArrayList<ArrestDomain>();
				if(arrestDomainList.size()> VarUtil.PageIndex){
					for (int i = 0; i < VarUtil.PageIndex; i++) {
						temp.add(arrestDomainList.get(i));
					}
				}else {
					temp = arrestDomainList;
				}
				jsonArray = JSONArray.fromObject(temp, jsonConfig);
			}
			System.out.println("普通员工搜索"+jsonArray.toString()+"------------");
		}else {
			//还没有处理的呈请文书
			List<ArrestDomain> arrestList1 = arrestService.findAll();
			List<ArrestDomain> falseldList =new ArrayList<ArrestDomain>();
			for (ArrestDomain arrest:arrestList1) {
				if (!arrest.isState()||!arrest.isResultState()) {
					falseldList.add(arrest);
				}
			}
			//搜索前6条
		    List<ArrestDomain> temp = new ArrayList<ArrestDomain>();
			if(falseldList.size()> VarUtil.PageIndex){
				for (int i = 0; i < VarUtil.PageIndex; i++) {
					temp.add(falseldList.get(i));
				}
			}else {
				temp = falseldList;
			}
			jsonArray = JSONArray.fromObject(temp, jsonConfig);
		}
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryCRID_Name.do")
	protected void doQueryCRID(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<CaseRegisterDomain> caseRegisterDomainList = caseRegisterService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jsonArray = JSONArray.fromObject(caseRegisterDomainList,jsonConfig);
		System.out.println(jsonArray.size()+"------------");
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
	}
	
	@RequestMapping(value="/queryStaffName.do")
	protected void doQueryStaffName(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("queryStaffNameSTART");
		List<StaffDomain> staffDomainList = staffService.findAll();
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		JSONArray jsonArray = JSONArray.fromObject(staffDomainList,jsonConfig);
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
	}
	
	@RequestMapping(value="/queryAllCR.do")
	protected ModelAndView doQueryAllCR(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<CaseRegisterDomain> caseRegisterDomains = caseRegisterService.findAll();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		
		JSONArray jsonArray = JSONArray.fromObject(caseRegisterDomains.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryAllLegal.do")
	protected ModelAndView doQueryAllLegal(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<LegalInstrumentDomain> legalInstrumentDomains = legalInstrumentService.findAll();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		
		JSONArray jsonArray = JSONArray.fromObject(legalInstrumentDomains.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryAllQrecord.do")
	protected ModelAndView doQueryAllQrecord(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<QrecordDomain> qrecordDomains = qrecordService.findAll();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		
		JSONArray jsonArray = JSONArray.fromObject(qrecordDomains.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryAllCheck.do")
	protected ModelAndView doQueryAllCheck(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<CheckrecordDomian> checkrecordDomians = checkRecordService.findAll();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		
		JSONArray jsonArray = JSONArray.fromObject(checkrecordDomians.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryAllDetention.do")
	protected ModelAndView doQueryAllDetention(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<DetentionDomain> detentionDomains = detentionService.findAll();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		
		JSONArray jsonArray = JSONArray.fromObject(detentionDomains.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryAllArrest.do")
	protected ModelAndView doQueryAllArrest(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<ArrestDomain> arrestDomains = arrestService.findAll();
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		//设置返回值
		
		JSONArray jsonArray = JSONArray.fromObject(arrestDomains.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryFCR.do")
	protected ModelAndView doQueryFCR(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<CaseRegisterDomain> falseCRList =new ArrayList<CaseRegisterDomain>();
		List<CaseRegisterDomain> caseRegisterDomainList = caseRegisterService.findAll();
		//查询到所以的未审核通过的
		for (CaseRegisterDomain cR:caseRegisterDomainList) {
			if (!cR.getState()) {
				falseCRList.add(cR);
			}
		}
		jsonArray = JSONArray.fromObject(falseCRList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryFLegal.do")
	protected ModelAndView doQueryFLegal(HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<LegalInstrumentDomain> falseCRList =new ArrayList<LegalInstrumentDomain>();
		List<LegalInstrumentDomain> caseRegisterDomainList = legalInstrumentService.findAll();
		//查询到所以的未审核通过的
		for (LegalInstrumentDomain cR:caseRegisterDomainList) {
			if (!cR.getResult_state()) {
				falseCRList.add(cR);
			}
		}
		/*List<LegalInstrumentDomain> partCaseRegisterDomains = new ArrayList<LegalInstrumentDomain>();
			if (falseCRList.size()>VarUtil.PageIndex) {//未通过的多于8个，则取前8个
				for (int i = 0; i < VarUtil.PageIndex; i++) {
					partCaseRegisterDomains.add(falseCRList.get(i));
				}
			}else{
				partCaseRegisterDomains = falseCRList;
			}*/
		jsonArray = JSONArray.fromObject(falseCRList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryFQrecord.do")
	protected ModelAndView doQueryFQrecord(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<QrecordDomain> falseCRList =new ArrayList<QrecordDomain>();
		List<QrecordDomain> caseRegisterDomainList = qrecordService.findAll();
		//查询到所以的未审核通过的
		for (QrecordDomain cR:caseRegisterDomainList) {
			if (!cR.getResultState()) {
				falseCRList.add(cR);
			}
		}
		jsonArray = JSONArray.fromObject(falseCRList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryFCheck.do")
	protected ModelAndView doQueryFCheck(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<CheckrecordDomian> falseCRList =new ArrayList<CheckrecordDomian>();
		List<CheckrecordDomian> caseRegisterDomainList = checkRecordService.findAll();
		//查询到所以的未审核通过的
		for (CheckrecordDomian cR:caseRegisterDomainList) {
			if (!cR.getResultState()) {
				falseCRList.add(cR);
			}
		}
		/*List<CheckrecordDomian> partCaseRegisterDomains = new ArrayList<CheckrecordDomian>();
			if (falseCRList.size()>8) {//未通过的多于8个，则取前8个
				for (int i = 0; i < 8; i++) {
					for (CheckrecordDomian cR:caseRegisterDomainList) {
						partCaseRegisterDomains.add(cR);
					}
				}
			}else{
				partCaseRegisterDomains = falseCRList;
			}*/
		jsonArray = JSONArray.fromObject(falseCRList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryFDetention.do")
	protected ModelAndView doQueryFDetention(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<DetentionDomain> falseCRList =new ArrayList<DetentionDomain>();
		List<DetentionDomain> caseRegisterDomainList = detentionService.findAll();
		//查询到所以的未审核通过的
		for (DetentionDomain cR:caseRegisterDomainList) {
			if (!cR.isResultState()) {
				falseCRList.add(cR);
			}
		}
		/*List<DetentionDomain> partCaseRegisterDomains = new ArrayList<DetentionDomain>();
			if (falseCRList.size()>8) {//未通过的多于8个，则取前8个
				for (int i = 0; i < 8; i++) {
					for (DetentionDomain cR:caseRegisterDomainList) {
						partCaseRegisterDomains.add(cR);
					}
				}
			}else{
				partCaseRegisterDomains = falseCRList;
			}*/
		jsonArray = JSONArray.fromObject(falseCRList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
	
	@RequestMapping(value="/queryFArrest.do")
	protected ModelAndView doQueryFArrest(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setIgnoreDefaultExcludes(false); //设置默认忽略
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		jsonConfig.registerJsonValueProcessor(Date.class, new JsonDateProcessor());
		JSONArray jsonArray = null;
		
		List<ArrestDomain> falseCRList =new ArrayList<ArrestDomain>();
		List<ArrestDomain> caseRegisterDomainList = arrestService.findAll();
		//查询到所以的未审核通过的
		for (ArrestDomain cR:caseRegisterDomainList) {
			if (!cR.isResultState()) {
				falseCRList.add(cR);
			}
		}
		/*List<ArrestDomain> partCaseRegisterDomains = new ArrayList<ArrestDomain>();
			if (falseCRList.size()>8) {//未通过的多于8个，则取前8个
				for (int i = 0; i < 8; i++) {
					for (ArrestDomain cR:caseRegisterDomainList) {
						partCaseRegisterDomains.add(cR);
					}
				}
			}else{
				partCaseRegisterDomains = falseCRList;
			}*/
		jsonArray = JSONArray.fromObject(falseCRList.size(), jsonConfig);
		
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html;charset=utf-8");
		response.getWriter().print(jsonArray);
		return null;
	}
}
