package com.cumt.criminal.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.cumt.criminal.util.QueryResultUtil;
@Controller
public class AddController {
	
	private StaffService staffService = new StaffServiceImpl();
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();
	
	//注册
	@RequestMapping(value="/AddStaff.do")
	protected ModelAndView doAddStaff(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		String IDCard = request.getParameter("IDCard");
		String Tusername = new String(request.getParameter("Tusername").getBytes("ISO-8859-1"),"UTF-8");;//用户名称
		String username =new String(request.getParameter("Rusername").getBytes("ISO-8859-1"),"UTF-8");//登录名
		String register_password = new String(request.getParameter("password1").getBytes("ISO-8859-1"),"UTF-8");//注册密码
		String identityString = new String(request.getParameter("rememberRadio").getBytes("ISO-8859-1"),"UTF-8");
		String identity = "";
		if ("0".equals(identityString)) {
			identity = "民警";
		}else if ("1".equals(identityString)) {
			identity = "上级";
		}else if ("2".equals(identityString)) {
			identity = "管理员";
		}
		staffService.addStaff(null, IDCard, Tusername, username, register_password, identity,false);
		request.getRequestDispatcher("/main.jsp").forward(request, response);

		return null;
	}
	@RequestMapping(value="/checkName.do")
	protected ModelAndView checkName(HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		String username =new String(request.getParameter("Rusername").getBytes("ISO-8859-1"),"UTF-8");//登录名
		List<StaffDomain> list = staffService.findAll();
		for (StaffDomain staffDomain:list) {
			if (staffDomain.getLoginName().equals(username)) {
//				request.getRequestDispatcher("/main.jsp").forward(request, response);
				String result = new String("用户名已存在,请重新输入用户名");
				request.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
		        response.setContentType("text/html;charset=utf-8");
		        response.setHeader("Cache-Control", "no-cache");  
		        response.getWriter().print(result);
				return null;
			}
		}
		request.setCharacterEncoding("utf-8");  //这里不设置编码会有乱码
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");  
        response.getWriter().print("");
		return null;
	}
	//刑事案件注册
	@RequestMapping(value="/addCaseRegister.do")
	protected ModelAndView doAddCaseRegister(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String IDCard = request.getParameter("IDCard");
		
		String user = new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
		String birthday = request.getParameter("birthday");
		String day = request.getParameter("day");
		String birthPalce = new String(request.getParameter("birthPalce").getBytes("ISO-8859-1"),"UTF-8");
		String workPalce = new String(request.getParameter("workPalce").getBytes("ISO-8859-1"),"UTF-8");
		String nation =  new String(request.getParameter("nation").getBytes("ISO-8859-1"),"UTF-8");
		
		String degree_education = null;
		switch (Integer.parseInt(request.getParameter("degree_education"))) {
		case 1:
			degree_education = "博士";
			break;
		case 2:
			degree_education = "硕士";
			break;
		case 3:
			degree_education = "本科";
			break;
		case 4:
			degree_education = "其他";
			break;
		default:
			break;
		}
		
		String sex = request.getParameter("sex");
		
		String politics_status =  new String(request.getParameter("politics_status").getBytes("ISO-8859-1"),"UTF-8");
		
		String is_CriminalRecord = new String(request.getParameter("is_CriminalRecord").getBytes("ISO-8859-1"),"UTF-8");

		String charge = new String(request.getParameter("charge").getBytes("ISO-8859-1"),"UTF-8");
		String charge_main = new String(request.getParameter("charge_main").getBytes("ISO-8859-1"),"UTF-8");
		String charge_next = new String(request.getParameter("charge_next").getBytes("ISO-8859-1"),"UTF-8");
		String victim_name = new String(request.getParameter("victim_name").getBytes("ISO-8859-1"),"UTF-8");
		String Sue_name = new String(request.getParameter("Sue_name").getBytes("ISO-8859-1"),"UTF-8");
		String native_palace = new String(request.getParameter("native_palace").getBytes("ISO-8859-1"),"UTF-8");
		String Sue_phone = new String(request.getParameter("Sue_phone").getBytes("ISO-8859-1"),"UTF-8");
		String charge_familyName = new String(request.getParameter("charge_familyName").getBytes("ISO-8859-1"),"UTF-8");
		String charge_familyPhone = new String(request.getParameter("charge_familyPhone").getBytes("ISO-8859-1"),"UTF-8");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		CaseRegisterDomain caseRegisterDomain = new CaseRegisterDomain();
		Date birthdayDate = simpleDateFormat.parse(birthday);
		Date dayDate = simpleDateFormat.parse(day);
		System.out.println(dayDate.toString());
		caseRegisterDomain.setId(null);
		if ("1".equals(sex)) {
			caseRegisterDomain.setSex(true);//男
		}else {
			caseRegisterDomain.setSex(false);//女
		}
		caseRegisterDomain.setBirthPalce(birthPalce);
		caseRegisterDomain.setCharge(charge);
		caseRegisterDomain.setChargeFamilyName(charge_familyName);
		caseRegisterDomain.setChargeFamilyPhone(charge_familyPhone);
		caseRegisterDomain.setChargeMain(charge_main);
		caseRegisterDomain.setChargeNext(charge_next);
		caseRegisterDomain.setDay(dayDate);
		caseRegisterDomain.setDegreeEducation(degree_education);
		caseRegisterDomain.setIdcard(IDCard);
		if (is_CriminalRecord.equals("1")) {
			caseRegisterDomain.setIsCriminalRecord(false);
		}else {
			caseRegisterDomain.setIsCriminalRecord(true);	
		}
		caseRegisterDomain.setName(user);
		caseRegisterDomain.setNation(nation);
		caseRegisterDomain.setNativePalace(native_palace);
		caseRegisterDomain.setPoliticsStatus(politics_status);
		caseRegisterDomain.setSueName(Sue_name);
		caseRegisterDomain.setSuePhone(Sue_phone);
		caseRegisterDomain.setVictimName(victim_name);
		caseRegisterDomain.setWorkPalce(workPalce);
		caseRegisterDomain.setBirthday(birthdayDate);
		caseRegisterDomain.setState(false);
		caseRegisterService.addCaseRegister(caseRegisterDomain);
		return new ModelAndView("imgtable");
	}

	//刑事法律呈请
@RequestMapping(value="/AddlegalInstrument.do")
	protected ModelAndView doAddLegalInstrument(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		int case_registerID =Integer.parseInt(request.getParameter("idSelect")); 
		String staffName = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		//用来检查是否该id已经被填写
		List<LegalInstrumentDomain> legalInstrumentDomaintemp = legalInstrumentService.findAll();
		for(LegalInstrumentDomain l:legalInstrumentDomaintemp){
			if(l.getCaseRegisterId() == case_registerID){
				return new ModelAndView("legal");//不能被保存提交
			}
		}
		
		LegalInstrumentDomain legalInstrumentDomain = new LegalInstrumentDomain();
		legalInstrumentDomain.setCaseRegisterId(case_registerID);
		legalInstrumentDomain.setContent(content);
		legalInstrumentDomain.setId(null);
		legalInstrumentDomain.setStaffName(staffName);
		
		legalInstrumentService.addLegalInstrument(legalInstrumentDomain);
		return new ModelAndView("legal");
	}

	//询问记录
	@RequestMapping(value="/AddQrecord.do")
	protected ModelAndView doAddQRecord(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		int case_registerID =Integer.parseInt(request.getParameter("idSelect")); 
		String askTime = request.getParameter("askTime");
		String askedName = new String(request.getParameter("askedName").getBytes("ISO-8859-1"),"UTF-8");
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		//用来检查是否该id已经被填写
				List<QrecordDomain> legalInstrumentDomaintemp = qrecordService.findAll();
				for(QrecordDomain l:legalInstrumentDomaintemp){
					if(l.getCaseRegisterId() == case_registerID){
						return new ModelAndView("imglist");//不能被保存提交
					}
				}
				
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date askTimeDate = simpleDateFormat.parse(askTime);

		QrecordDomain qrecordDomain = new QrecordDomain();
		qrecordDomain.setCaseRegisterId(case_registerID);
		qrecordDomain.setContent(content);
		qrecordDomain.setId(null);
		qrecordDomain.setAskedPerson(askedName);
		qrecordDomain.setAskTime(askTimeDate);
		qrecordDomain.setContent(content);
		qrecordDomain.setHandleStaff(name);
		
		qrecordService.addQRecord(qrecordDomain);
		
		return new ModelAndView("imglist");
	}
	//检查记录
		@RequestMapping(value="/AddCheckRecord.do")
		protected ModelAndView doAddCheckRecord(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		
			int case_registerID =Integer.parseInt(request.getParameter("idSelect")); 
			String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
			//用来检查是否该id已经被填写
			List<CheckrecordDomian> legalInstrumentDomaintemp = checkRecordService.findAll();
			for(CheckrecordDomian l:legalInstrumentDomaintemp){
				if(l.getCaseRegisterId() == case_registerID){
					return new ModelAndView("checkImglist");//不能被保存提交
				}
			}
			
			CheckrecordDomian checkrecordDomian = new CheckrecordDomian();
			checkrecordDomian.setCaseRegisterId(case_registerID);
			checkrecordDomian.setContent(content);
			checkrecordDomian.setId(null);
			
			checkRecordService.addCheckDomain(checkrecordDomian);
			
			return new ModelAndView("checkImglist");
		}
		//拘留记录
		@RequestMapping(value="/AddDetention.do")
		protected ModelAndView doAddDetention(HttpServletRequest request,
				HttpServletResponse response) throws Exception {

			int case_registerID =Integer.parseInt(request.getParameter("idSelect")); 
			String askedName = new String(request.getParameter("askedName").getBytes("ISO-8859-1"),"UTF-8");
			String reason = new String(request.getParameter("reason").getBytes("ISO-8859-1"),"UTF-8");
			String handleName = new String(request.getParameter("handleName").getBytes("ISO-8859-1"),"UTF-8");
//			String content = request.getParameter("content");
			String time = request.getParameter("time");
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date timeDate = simpleDateFormat.parse(time);
			
			//用来检查是否该id已经被填写
			List<DetentionDomain> legalInstrumentDomaintemp = detentionService.findAll();
			for(DetentionDomain l:legalInstrumentDomaintemp){
				if(l.getCaseRegisterId() == case_registerID){
					return new ModelAndView("tools");//不能被保存提交
				}
			}
			
			DetentionDomain detentionDomain = new DetentionDomain();
			detentionDomain.setCaseRegisterId(case_registerID);
			detentionDomain.setId(null);
			detentionDomain.setChargeName(askedName);
			detentionDomain.setHandleName(handleName);
			detentionDomain.setReason(reason);
			detentionDomain.setTime(timeDate);
			
			detentionService.addDetention(detentionDomain);
			return new ModelAndView("tools");
		}
		//逮捕记录
		@RequestMapping(value="/AddArrest.do")
		protected ModelAndView doAddArrest(HttpServletRequest request,
				HttpServletResponse response) throws Exception {
		
			int case_registerID =Integer.parseInt(request.getParameter("idSelect")); 
			String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
			String reason = new String(request.getParameter("reason").getBytes("ISO-8859-1"),"UTF-8");
			String handleName = new String(request.getParameter("handleName").getBytes("ISO-8859-1"),"UTF-8");
			String time = request.getParameter("Time");
			
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date timeDate = simpleDateFormat.parse(time);

			//用来检查是否该id已经被填写
			List<ArrestDomain> legalInstrumentDomaintemp = arrestService.findAll();
			for(ArrestDomain l:legalInstrumentDomaintemp){
				if(l.getCaseRegisterId() == case_registerID){
					return new ModelAndView("arresttools");//不能被保存提交
				}
			}
			
			ArrestDomain arrestDomain = new ArrestDomain();
			arrestDomain.setCaseRegisterId(case_registerID);
			arrestDomain.setId(null);
			arrestDomain.setChargeName(name);
			arrestDomain.setHandleName(handleName);
			arrestDomain.setReason(reason);
			arrestDomain.setTime(timeDate);
		
			
			arrestService.addArrest(arrestDomain);
			return new ModelAndView("arresttools");
		}
}
