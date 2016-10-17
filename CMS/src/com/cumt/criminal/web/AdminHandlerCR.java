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
import com.cumt.criminal.service.impl.ArrestServiceImpl;
import com.cumt.criminal.service.impl.CaseRegisterServiceImpl;
import com.cumt.criminal.service.impl.CheckRecordServiceImpl;
import com.cumt.criminal.service.impl.DetentionServiceImpl;
import com.cumt.criminal.service.impl.LegalInstrumentServiceImpl;
import com.cumt.criminal.service.impl.QrecordServiceImpl;

@Controller
public class AdminHandlerCR{
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();
	
@RequestMapping(value="/adminhandler.do")
	protected ModelAndView doAdminHandlerCR(HttpServletRequest request,
			HttpServletResponse arg1) throws Exception {
		boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		CaseRegisterDomain caseRegisterDomain = caseRegisterService.queryCaseRegisterById(id);
		if (flag) {
			CaseRegisterDomain newCR = caseRegisterDomain;
			newCR.setState(flag);
			caseRegisterService.editCaseRegister(caseRegisterDomain, newCR);
			System.out.println("更新成功");
		}else {
			caseRegisterService.delCaseRegister(caseRegisterDomain);
			System.out.println("删除成功");
		}
		return new ModelAndView("AdminImgtable");
	}

@RequestMapping(value="/adminhandlerLD.do")
protected ModelAndView doAdminHandlerLD(HttpServletRequest request,
		HttpServletResponse arg1) throws Exception {
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	int id = Integer.parseInt(request.getParameter("id"));
	
	LegalInstrumentDomain legalInstrumentDomain = legalInstrumentService.queryLegalInstrumentById(id);
	if(legalInstrumentDomain!=null){
		if (flag) {
			LegalInstrumentDomain newLD = legalInstrumentDomain;
			newLD.setState(true);
			newLD.setResult_state(true);
			legalInstrumentService.editLegalInstrument(legalInstrumentDomain, newLD);
			System.out.println("更新成功");
		}else {
			LegalInstrumentDomain newLD = legalInstrumentDomain;
			newLD.setState(true);
			newLD.setResult_state(false);
			legalInstrumentService.editLegalInstrument(legalInstrumentDomain, newLD);
			System.out.println("更新成功");
			/*legalInstrumentService.delLegalInstrument(legalInstrumentDomain);
			System.out.println("删除成功");*/
		}
	}

	return new ModelAndView("AdminLegalImgtable");
}

@RequestMapping(value="/adminhandlerQR.do")
protected ModelAndView doAdminHandlerQR(HttpServletRequest request,
		HttpServletResponse arg1) throws Exception {
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	QrecordDomain qrecordDomain = qrecordService.queryQRecordById(id);
	if (flag) {
		QrecordDomain newQr = qrecordDomain;
		newQr.setState(true);
		newQr.setResultState(true);
		qrecordService.editQRecordById(qrecordDomain, newQr);
		System.out.println("更新成功");
	}else {
		QrecordDomain newQr = qrecordDomain;
		newQr.setState(true);
		newQr.setResultState(false);
		qrecordService.editQRecordById(qrecordDomain, newQr);
		System.out.println("更新成功");
		/*legalInstrumentService.delLegalInstrument(legalInstrumentDomain);
		System.out.println("删除成功");*/
	}
	return new ModelAndView("adminImglist");
}

@RequestMapping(value="/adminhandlerCheckR.do")
protected ModelAndView doAdminHandlerCheckR(HttpServletRequest request,
		HttpServletResponse arg1) throws Exception {
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	int id = Integer.parseInt(request.getParameter("id"));
	
	CheckrecordDomian checkrecordDomian = checkRecordService.queryCheckDomain(id);
	if (flag) {
		CheckrecordDomian newcheckr = checkrecordDomian;
		newcheckr.setState(true);
		newcheckr.setResultState(true);
		checkRecordService.editCheckDomain(checkrecordDomian, newcheckr);
		System.out.println("更新成功");
	}else {
		CheckrecordDomian newcheckr = checkrecordDomian;
		newcheckr.setState(true);
		newcheckr.setResultState(false);
		checkRecordService.editCheckDomain(checkrecordDomian, newcheckr);
		System.out.println("更新成功");
		/*legalInstrumentService.delLegalInstrument(legalInstrumentDomain);
		System.out.println("删除成功");*/
	}
	return new ModelAndView("adminCheckImglist");
}

@RequestMapping(value="/adminhandlerD.do")
protected ModelAndView doAdminHandlerD(HttpServletRequest request,
		HttpServletResponse arg1) throws Exception {
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	int id = Integer.parseInt(request.getParameter("id"));
	
	DetentionDomain detentionDomain = detentionService.queryDetention(id);
	if (flag) {
		DetentionDomain newD = detentionDomain;
		newD.setState(true);
		newD.setResultState(true);
		detentionService.editDetention(detentionDomain, newD);
		System.out.println("更新成功");
	}else {
		DetentionDomain newD = detentionDomain;
		newD.setState(true);
		newD.setResultState(false);
		detentionService.editDetention(detentionDomain, newD);
		System.out.println("更新成功");
		/*legalInstrumentService.delLegalInstrument(legalInstrumentDomain);
		System.out.println("删除成功");*/
	}
	return new ModelAndView("adminTools");
}

@RequestMapping(value="/adminhandlerArrest.do")
protected ModelAndView doAdminHandlerArrest(HttpServletRequest request,
		HttpServletResponse arg1) throws Exception {
	boolean flag = Boolean.parseBoolean(request.getParameter("flag"));
	int id = Integer.parseInt(request.getParameter("id"));
	
	ArrestDomain arrestDomain = arrestService.queryArrest(id);
	if (flag) {
		ArrestDomain newArrest = arrestDomain;
		newArrest.setState(true);
		newArrest.setResultState(true);
		arrestService.editArrest(arrestDomain, newArrest);
		System.out.println("更新成功");
	}else {
		ArrestDomain newArrest = arrestDomain;
		newArrest.setState(true);
		newArrest.setResultState(false);
		arrestService.editArrest(arrestDomain, newArrest);
		System.out.println("更新成功");
		/*legalInstrumentService.delLegalInstrument(legalInstrumentDomain);
		System.out.println("删除成功");*/
	}
	return new ModelAndView("adminArrestTools");
}

}
