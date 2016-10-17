package com.cumt.criminal.web;

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
public class Del {
	private StaffService staffService = new StaffServiceImpl();
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();

	@RequestMapping(value="/doDelStaff.do")
	protected ModelAndView doDelStaff(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		staffService.deleteStaffByID(arg0.getParameter("id"));
		System.out.println("OK");
		return new ModelAndView("main");
	}
	
@RequestMapping(value="/delete.do")
	protected ModelAndView doDelCR(HttpServletRequest arg0,
			HttpServletResponse arg1) throws Exception {
		int id = Integer.parseInt(arg0.getParameter("id"));
		
		CaseRegisterDomain caseRegister = caseRegisterService.queryCaseRegisterById(id);
		if (caseRegister == null ) {
			System.out.println("null");
		}else {
			System.out.println("Not NUll");
			caseRegisterService.delCaseRegister(caseRegister);
		}
		System.out.println("OK");
		return new ModelAndView("imgtable");
	}

@RequestMapping(value="/deletLD.do")
protected ModelAndView doDelLD(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println("id是"+id);
	LegalInstrumentDomain legalInstrumentDomain = legalInstrumentService.queryLegalInstrumentById(id);
	if (legalInstrumentDomain == null ) {
		System.out.println("null");
	}else {
		System.out.println("Not NUll");
		legalInstrumentService.delLegalInstrument(legalInstrumentDomain);
	}
	System.out.println("OK");
	return new ModelAndView("legal");
}

@RequestMapping(value="/deletQR.do")
protected ModelAndView doDelQR(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println("id是"+id);
	
	QrecordDomain qrecordDomain = qrecordService.queryQRecordById(id);
	if (qrecordDomain == null ) {
		System.out.println("null");
	}else {
		qrecordService.deleteQRecord(qrecordDomain);
	}
	return new ModelAndView("imglist");
}

@RequestMapping(value="/deletCheckR.do")
protected ModelAndView doDelCheckR(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	int id = Integer.parseInt(request.getParameter("id"));
	CheckrecordDomian checkrecordDomian = checkRecordService.queryCheckDomain(id);
	if (checkrecordDomian == null ) {
		System.out.println("null");
	}else {
		checkRecordService.deleteCheckDomain(checkrecordDomian);
	}
	System.out.println("OK");
	return new ModelAndView("checkImglist");
}

@RequestMapping(value="/deletDetention.do")
protected ModelAndView doDelDetention(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	int id = Integer.parseInt(request.getParameter("id"));
	DetentionDomain detentionDomain = detentionService.queryDetention(id);
	if (detentionDomain == null ) {
		System.out.println("null");
	}else {
		System.out.println("Not NUll");
		detentionService.deleteDetention(detentionDomain);
	}
	System.out.println("OK");
	return new ModelAndView("tools");
}

@RequestMapping(value="/deletArrest.do")
protected ModelAndView doDelArrest(HttpServletRequest request,
		HttpServletResponse response) throws Exception {
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println("id是"+id);
	ArrestDomain arrestDomain = arrestService.queryArrest(id);
	if (arrestDomain == null ) {
		System.out.println("null");
	}else {
		System.out.println("Not NUll");
		arrestService.deleteArrest(arrestDomain);
	}
	System.out.println("OK");
	return new ModelAndView("arresttools");
}
}
