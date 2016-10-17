package com.cumt.criminal.web;

import java.text.SimpleDateFormat;
import java.util.Date;

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

@Controller
public class Detail {
	private StaffService staffService = new StaffServiceImpl();
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();
	
	@RequestMapping(value="/detailCR.do")
	protected ModelAndView doGetCREditView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int id = Integer.parseInt(request.getParameter("CRid"));
		CaseRegisterDomain caseRegisterDomain = caseRegisterService.queryCaseRegisterById(id);
		String idcard = caseRegisterDomain.getIdcard();
		String name =caseRegisterDomain.getName();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date birthday1 =	caseRegisterDomain.getBirthday();
		String birthday =simpleDateFormat.format(birthday1);
		
		Date day1 =caseRegisterDomain.getDay();
		String day =simpleDateFormat.format(day1);
		
		String workPlace =caseRegisterDomain.getWorkPalce();
		String birthPalce =caseRegisterDomain.getBirthPalce();
		String degree_education =caseRegisterDomain.getDegreeEducation();
		String nation =caseRegisterDomain.getNation();
		boolean sex =caseRegisterDomain.getSex();
		
		String politics_status =caseRegisterDomain.getPoliticsStatus();
		boolean is_CriminalRecord1 = caseRegisterDomain.isCriminalRecord();
		String is_CriminalRecord = null;
		if (is_CriminalRecord1) {
			is_CriminalRecord = "有前科";
		}else {
			is_CriminalRecord = "没有前科";
		}
		String charge =	caseRegisterDomain.getCharge();
		String charge_main =	caseRegisterDomain.getChargeMain();
		String charge_next =	caseRegisterDomain.getChargeNext();
		String victim_name =	caseRegisterDomain.getVictimName();
		String Sue_name =	caseRegisterDomain.getSueName();
		String native_palace =	caseRegisterDomain.getNativePalace();
		String Sue_phone =	caseRegisterDomain.getSuePhone();
		String charge_familyName =	caseRegisterDomain.getChargeFamilyName();
		String charge_familyPhone =	caseRegisterDomain.getChargeFamilyPhone();
		boolean state =	caseRegisterDomain.getState();
		
		request.setAttribute("id",id);
		request.setAttribute("idcard",idcard);
		request.setAttribute("name",name);
		request.setAttribute("birthday",birthday);
		request.setAttribute("day",day);
		request.setAttribute("workPlace",workPlace);
//		String birthPalce = new String (request.getParameter("birthPalce").getBytes("ISO-8859-1"),"UTF-8");
		request.setAttribute("birthPalce",birthPalce);
		
		String temp_degree_education = degree_education;
		if ("博士".equals(temp_degree_education)) {
			temp_degree_education = "1";
		}else if ("硕士".equals(temp_degree_education)) {
			temp_degree_education = "2";
		}else if ("本科".equals(temp_degree_education)) {
			temp_degree_education = "3";
		}else if ("其他".equals(temp_degree_education)) {
			temp_degree_education = "4";
		}
		request.setAttribute("temp_degree_education",temp_degree_education);
		
		request.setAttribute("degree_education",degree_education);
		request.setAttribute("nation",nation);
		System.out.println(sex+"==========");
		String tempSex = null;
		if (sex) {
			tempSex = "男";
		}else {
			tempSex = "女";
		}
		request.setAttribute("tempSex",sex);
		request.setAttribute("sex",tempSex);
		
		request.setAttribute("politics_status",politics_status);
		
		request.setAttribute("is_CriminalRecord",is_CriminalRecord);
		
		request.setAttribute("charge",charge);
		request.setAttribute("charge_next",charge_next);
		request.setAttribute("charge_main",charge_main);
		request.setAttribute("victim_name",victim_name);
		request.setAttribute("Sue_name",Sue_name);
		request.setAttribute("native_palace",native_palace);
		request.setAttribute("Sue_phone",Sue_phone);
		request.setAttribute("charge_familyName",charge_familyName);
		request.setAttribute("charge_familyPhone",charge_familyPhone);
		request.setAttribute("state",state);
		
		request.getRequestDispatcher("detailCase.jsp").forward(request, response);
		return null;
	}
	
	@RequestMapping(value="/detailLG.do")
	protected ModelAndView doGetLegalEditView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		int id = Integer.parseInt(request.getParameter("id"));
		LegalInstrumentDomain l = legalInstrumentService.queryLegalInstrumentById(id);
		int caseRegisterId = l.getCaseRegisterId();
		String content = l.getContent();
		String staffName = l.getStaffName();
		boolean state = l.getState();
		boolean result_state = l.getResult_state();
		
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("content",content);
		request.setAttribute("staffName",staffName);
		
		request.setAttribute("state",state);
		request.setAttribute("result_state",result_state);
		
		return new ModelAndView("detailLegal");
	}
	
	@RequestMapping(value="/detailQR.do")
	protected ModelAndView doGetQR(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int caseRegisterId = Integer.parseInt(request.getParameter("id"));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		QrecordDomain qrecordDomain = qrecordService.queryQRecordById(caseRegisterId);
		
		int id = qrecordDomain.getId();
		String content = qrecordDomain.getContent();
		String handleStaff = qrecordDomain.getHandleStaff();
		Date askTime1 = qrecordDomain.getAskTime();
		String askTime = simpleDateFormat.format(askTime1);
		
		String askedName = qrecordDomain.getAskedPerson();
		boolean state = qrecordDomain.getState();
		boolean result_state = qrecordDomain.getResultState();
		
		request.setAttribute("id", id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("content",content);
		request.setAttribute("handleStaff",handleStaff);
		request.setAttribute("askTime",askTime);
		request.setAttribute("askedPerson",askedName);
		request.setAttribute("state",state);
		request.setAttribute("result_state",result_state);
		return new ModelAndView("detailQre");
	}
	@RequestMapping(value="/detailCheck.do")
	protected ModelAndView doGetCheck(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int caseRegisterId = Integer.parseInt(request.getParameter("id"));
		
		CheckrecordDomian checkrecordDomian = checkRecordService.queryCheckDomain(caseRegisterId);

		int id = checkrecordDomian.getId();
		String content = checkrecordDomian.getContent();
		boolean state = checkrecordDomian.getState();
		boolean result_state = checkrecordDomian.getResultState();
		
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("content",content);
		request.setAttribute("state",state);
		request.setAttribute("result_state",result_state);
		
		return new ModelAndView("detailCheck");
	}
	@RequestMapping(value="/detailDetention.do")
	protected ModelAndView doGetDetention(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
int caseRegisterId = Integer.parseInt(request.getParameter("id"));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		DetentionDomain detentionDomain = detentionService.queryDetention(caseRegisterId);
		int id = detentionDomain.getId();
		Date time1 = detentionDomain.getTime();
		String time = simpleDateFormat.format(time1);
		String name = detentionDomain.getHandleName();
		String chargeName = detentionDomain.getChargeName();
		String reason = detentionDomain.getReason();
		boolean state = detentionDomain.isState();
		boolean result_state = detentionDomain.isResultState();
		
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("chargeName",chargeName);
		request.setAttribute("reason",reason);
		request.setAttribute("handleName",name);
		request.setAttribute("time",time);
		request.setAttribute("state",state);
		request.setAttribute("result_state",result_state);
		
		return new ModelAndView("detailDetention");
	}
	
	@RequestMapping(value="/detailArrest.do")
	protected ModelAndView doGetArrestEditView(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int caseRegisterId = Integer.parseInt(request.getParameter("id"));
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		ArrestDomain arrestDomain = arrestService.queryArrest(caseRegisterId);
		int id = arrestDomain.getId();
		Date time1 = arrestDomain.getTime();
		String time = simpleDateFormat.format(time1);
		String name = arrestDomain.getHandleName();
		String chargeName = arrestDomain.getChargeName();
		String reason = arrestDomain.getReason();
		boolean state = arrestDomain.isState();
		boolean result_state = arrestDomain.isResultState();
		
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("chargeName",chargeName);
		request.setAttribute("reason",reason);
		request.setAttribute("handleName",name);
		request.setAttribute("time",time);
		request.setAttribute("state",state);
		request.setAttribute("result_state",result_state);
		
		
		
		return new ModelAndView("detailArrest");
	}
}
