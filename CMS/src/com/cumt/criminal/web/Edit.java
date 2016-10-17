package com.cumt.criminal.web;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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

@Controller
public class Edit {
	private StaffService staffService = new StaffServiceImpl();
	private CaseRegisterService caseRegisterService = new CaseRegisterServiceImpl();
	private LegalInstrumentService legalInstrumentService = new LegalInstrumentServiceImpl();
	private QrecordService qrecordService = new QrecordServiceImpl();
	private CheckRecordService checkRecordService = new CheckRecordServiceImpl();
	private DetentionService detentionService = new DetentionServiceImpl();
	private ArrestService arrestService =  new ArrestServiceImpl();
	
		@RequestMapping(value="/doEditStaff.do")
	protected ModelAndView doEditSta(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("id"));
		String idcard = new String(request.getParameter("idcard").getBytes("ISO-8859-1"),"UTF-8");
		String name =new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		String loginName = new String(request.getParameter("loginName").getBytes("ISO-8859-1"),"UTF-8");
		String pwd =new String(request.getParameter("password1").getBytes("ISO-8859-1"),"UTF-8");
		String identify =new String(request.getParameter("identify").getBytes("ISO-8859-1"),"UTF-8");
		System.out.println("======"+pwd);
		StaffDomain s1 = new StaffDomain();
		s1.setBigIP(null);
		s1.setId(id);
		s1.setIdcard(idcard);
		s1.setIdentify(identify);
		s1.setIp(null);
		s1.setLoginName(loginName);
		s1.setLoginPwd(pwd);
		s1.setLoginState(false);
		s1.setStaffName(name);
		
		StaffDomain s = (StaffDomain) staffService.queryByID(id).getList().get(0);
		staffService.editStaffById(s1, s);
		request.setAttribute("id",id);
		request.setAttribute("idcard",idcard);
		request.setAttribute("name",name);
		request.setAttribute("loginName",loginName);
		request.setAttribute("pwd",pwd);
		request.setAttribute("identify",identify);
		return new ModelAndView("detailStaff");
	}

		@RequestMapping(value="/editIP.do")
	protected ModelAndView doEditIP(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("staffDomain") String staffDomain) throws Exception {
			StaffDomain staffDomain2 = staffService.queryStaffByName(staffDomain);//通过登录名查找员工
				staffService.editBigIP(staffDomain2, null);
				return new ModelAndView("login");
	}
	

	@RequestMapping(value="/geteditCR.do")
	protected ModelAndView doEditCR(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取修改后的刑事案件登记表
		int id = Integer.parseInt(request.getParameter("CRid"));
		String IDCard = request.getParameter("IDCard");
		String user =new String(request.getParameter("user").getBytes("ISO-8859-1"),"UTF-8");
		String birthday = new String(request.getParameter("birthday").getBytes("ISO-8859-1"),"UTF-8");
		String day =new String(request.getParameter("day").getBytes("ISO-8859-1"),"UTF-8");
		String birthPalce = new String(request.getParameter("birthPalce").getBytes("ISO-8859-1"),"UTF-8");
		String workPalce =new String(request.getParameter("workPalce").getBytes("ISO-8859-1"),"UTF-8");
		String nation = new String(request.getParameter("nation").getBytes("ISO-8859-1"),"UTF-8");
		String tempdegree_education = new String(request.getParameter("degree_education").getBytes("ISO-8859-1"),"UTF-8");
		String degree_education = null;
		if("1".equals(tempdegree_education)){
			degree_education = "博士";
		}else if("2".equals(tempdegree_education)){
			degree_education = "硕士";
		}else if("3".equals(tempdegree_education)){
			degree_education = "本科";
		}else if("4".equals(tempdegree_education)){
			degree_education = "其他";
		}
		String sex = new String(request.getParameter("sex").getBytes("ISO-8859-1"),"UTF-8");
		String politics_status = new String(request.getParameter("politics_status").getBytes("ISO-8859-1"),"UTF-8");
		String is_CriminalRecord = new String(request.getParameter("is_CriminalRecord").getBytes("ISO-8859-1"),"UTF-8");
		String charge = new String(request.getParameter("charge").getBytes("ISO-8859-1"),"UTF-8");
		String charge_main = new String(request.getParameter("charge_main").getBytes("ISO-8859-1"),"UTF-8");
		String charge_next = new String(request.getParameter("charge_next").getBytes("ISO-8859-1"),"UTF-8");
		String victim_name =new String(request.getParameter("victim_name").getBytes("ISO-8859-1"),"UTF-8");
		String Sue_name =new String(request.getParameter("Sue_name").getBytes("ISO-8859-1"),"UTF-8");
		String native_palace = new String(request.getParameter("native_palace").getBytes("ISO-8859-1"),"UTF-8");
		String Sue_phone = new String(request.getParameter("Sue_phone").getBytes("ISO-8859-1"),"UTF-8");
		String charge_familyName = new String(request.getParameter("charge_familyName").getBytes("ISO-8859-1"),"UTF-8");
		String charge_familyPhone = new String(request.getParameter("charge_familyPhone").getBytes("ISO-8859-1"),"UTF-8");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		CaseRegisterDomain newCR = new CaseRegisterDomain();
		Date birthdayDate = simpleDateFormat.parse(birthday);
		Date dayDate = simpleDateFormat.parse(day);
		newCR.setId(id);
		if ("男".equals(sex)) {
			newCR.setSex(true);//男
		}else if ("女".equals(sex)){
			newCR.setSex(false);//女
		}
		newCR.setBirthPalce(birthPalce);
		newCR.setCharge(charge);
		newCR.setChargeFamilyName(charge_familyName);
		newCR.setChargeFamilyPhone(charge_familyPhone);
		newCR.setChargeMain(charge_main);
		newCR.setChargeNext(charge_next);
		newCR.setDay(dayDate);
		newCR.setDegreeEducation(degree_education);
		newCR.setIdcard(IDCard);
		if (is_CriminalRecord.equals("1")) {
			newCR.setIsCriminalRecord(true);
		}else {
			newCR.setIsCriminalRecord(false);	
		}
		newCR.setName(user);
		newCR.setNation(nation);
		newCR.setNativePalace(native_palace);
		newCR.setPoliticsStatus(politics_status);
		newCR.setSueName(Sue_name);
		newCR.setSuePhone(Sue_phone);
		newCR.setVictimName(victim_name);
		newCR.setWorkPalce(workPalce);
		newCR.setBirthday(birthdayDate);
		newCR.setState(false);
		//获取id对应的旧的刑事案件登记表
		CaseRegisterDomain oldCR = caseRegisterService.queryCaseRegisterById(id);
		System.out.println("Edit"+oldCR.getIdcard()+"--"+newCR.getIdcard());
		caseRegisterService.editCaseRegister(oldCR, newCR);
		
		request.setAttribute("id",id);
		request.setAttribute("idcard",IDCard);
		request.setAttribute("name",user);
		request.setAttribute("birthday",birthday);
		request.setAttribute("day",day);
		request.setAttribute("workPlace",workPalce);
		request.setAttribute("birthPalce",birthPalce);
		request.setAttribute("degree_education",degree_education);
		
		request.setAttribute("degree_education",degree_education);
		request.setAttribute("nation",nation);
		request.setAttribute("sex", sex);
		request.setAttribute("politics_status",politics_status);
		System.out.println("Edit2Detail"+sex);
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
		request.setAttribute("state","false");
		
		request.getRequestDispatcher("detailCase.jsp").forward(request, response);
		return null;
	}


	@RequestMapping(value="/geteditLD.do")
	protected ModelAndView doEditLD(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取修改后的刑事案件登记表
		int id = Integer.parseInt(request.getParameter("id"));
		int caseRegisterId = Integer.parseInt(request.getParameter("caseRegisterId"));
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		String staffName =new String(request.getParameter("staffName").getBytes("ISO-8859-1"),"UTF-8");

		LegalInstrumentDomain newLD = new LegalInstrumentDomain();
		newLD.setId(id);
		newLD.setCaseRegisterId(caseRegisterId);
		newLD.setContent(content);
		newLD.setResult_state(false);
		newLD.setStaffName(staffName);
		newLD.setState(false);
		
		//获取id对应的旧的刑事案件登记表
		LegalInstrumentDomain oldLD = legalInstrumentService.queryLegalInstrumentById(id);
		legalInstrumentService.editLegalInstrument(oldLD, newLD);
		
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("content",content);
		request.setAttribute("staffName",staffName);
		request.setAttribute("state","false");
		request.setAttribute("result_state","false");
		request.getRequestDispatcher("detailLegal.jsp").forward(request, response);
		return null;
	}
	
	@RequestMapping(value="/geteditQR.do")
	protected ModelAndView doEditQR(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取修改后的刑事案件登记表
		int id = Integer.parseInt(request.getParameter("id"));
		int caseRegisterId = Integer.parseInt(request.getParameter("caseRegisterId"));
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		String staffName = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		String askedPerson = new String(request.getParameter("askedName").getBytes("ISO-8859-1"),"UTF-8");
		String askTime = request.getParameter("askTime");
	/*	boolean state = Boolean.parseBoolean(request.getParameter("state"));
		boolean result_state = Boolean.parseBoolean(request.getParameter("result_state"));*/
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date askTimeDate = simpleDateFormat.parse(askTime);
		
		QrecordDomain newQR = new QrecordDomain();
		newQR.setId(id);
		newQR.setCaseRegisterId(caseRegisterId);
		newQR.setContent(content);
		newQR.setHandleStaff(staffName);
		newQR.setAskTime(askTimeDate);
		newQR.setAskedPerson(askedPerson);
		newQR.setResultState(false);
		newQR.setState(false);
		
		//获取id对应的旧的刑事案件登记表
		QrecordDomain oldQR = qrecordService.queryQRecordById(id);
		qrecordService.editQRecordById(oldQR, newQR);
		System.out.println("修改成功");
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("content",content);
		request.setAttribute("handleStaff",staffName);
		request.setAttribute("askTime",askTime);
		request.setAttribute("askedPerson",askedPerson);
		request.setAttribute("state","false");
		request.setAttribute("result_state","false");
		
		request.getRequestDispatcher("detailQre.jsp").forward(request, response);
		return null;
	}
	
	@RequestMapping(value="/geteditCheckR.do")
	protected ModelAndView doEditCheckR(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取修改后的刑事案件登记表
		int id = Integer.parseInt(request.getParameter("id"));
		int caseRegisterId = Integer.parseInt(request.getParameter("caseRegisterId"));
		String content = new String(request.getParameter("content").getBytes("ISO-8859-1"),"UTF-8");
		
		CheckrecordDomian newCR= new CheckrecordDomian();
		newCR.setId(id);
		newCR.setCaseRegisterId(caseRegisterId);
		newCR.setContent(content);
		newCR.setResultState(false);
		newCR.setState(false);
		
		//获取id对应的旧的刑事案件登记表
		CheckrecordDomian oldCR = checkRecordService.queryCheckDomain(id);
		checkRecordService.editCheckDomain(oldCR, newCR);
		System.out.println("修改成功");
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("content",content);
		request.setAttribute("state","false");
		request.setAttribute("result_state","false");
		request.getRequestDispatcher("detailCheck.jsp").forward(request, response);
		return null;
	}
	
	@RequestMapping(value="/geteditDetention.do")
	protected ModelAndView doEditDetention(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取修改后的刑事案件登记表
		int id = Integer.parseInt(request.getParameter("id"));
		int caseRegisterId = Integer.parseInt(request.getParameter("caseRegisterId"));
		String chargeName = new String(request.getParameter("chargeName").getBytes("ISO-8859-1"),"UTF-8");
		String reason = new String(request.getParameter("reason").getBytes("ISO-8859-1"),"UTF-8");
		String handleName = new String(request.getParameter("handleName").getBytes("ISO-8859-1"),"UTF-8");
		String time = new String(request.getParameter("time").getBytes("ISO-8859-1"),"UTF-8");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date timeDate = simpleDateFormat.parse(time);
		
		DetentionDomain newD = new DetentionDomain();
		newD.setId(id);
		newD.setCaseRegisterId(caseRegisterId);
		newD.setReason(reason);
		newD.setHandleName(handleName);
		newD.setTime(timeDate);
		newD.setResultState(false);
		newD.setChargeName(chargeName);
		newD.setState(false);
		newD.setResultState(false);
		//获取id对应的旧的刑事案件登记表
		DetentionDomain oldD = detentionService.queryDetention(id);
		detentionService.editDetention(oldD, newD);
		System.out.println("修改成功");
		
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("chargeName",chargeName);
		request.setAttribute("reason",reason);
		request.setAttribute("handleName",handleName);
		request.setAttribute("time",time);
		request.setAttribute("state","false");
		request.setAttribute("result_state","false");
		
		request.getRequestDispatcher("detailDetention.jsp").forward(request, response);
		return null;
	}
	
	@RequestMapping(value="/geteditArrest.do")
	protected ModelAndView Arrest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		//获取修改后的刑事案件登记表
		int id = Integer.parseInt(request.getParameter("id"));
		int caseRegisterId = Integer.parseInt(request.getParameter("caseRegisterId"));
		String chargeName = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		String reason = new String(request.getParameter("reason").getBytes("ISO-8859-1"),"UTF-8");
		String time = request.getParameter("time");
		String handleName = new String(request.getParameter("handleName").getBytes("ISO-8859-1"),"UTF-8");
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date timeDate = simpleDateFormat.parse(time);
		
		ArrestDomain newA = new ArrestDomain();
		newA.setId(id);
		newA.setCaseRegisterId(caseRegisterId);
		newA.setChargeName(chargeName);
		newA.setReason(reason);
		newA.setHandleName(handleName);
		newA.setResultState(false);
		newA.setTime(timeDate);;
		newA.setState(false);
		
		//获取id对应的旧的刑事案件登记表
		ArrestDomain oldA = arrestService.queryArrest(id);
		System.out.println("修改之前========================");
		arrestService.editArrest(oldA, newA);
		System.out.println("修改成功");
		request.setAttribute("id",id);
		request.setAttribute("caseRegisterId",caseRegisterId);
		request.setAttribute("chargeName",chargeName);
		request.setAttribute("reason",reason);
		request.setAttribute("handleName",handleName);
		request.setAttribute("time",time);
		request.setAttribute("state","false");
		request.setAttribute("result_state","false");
		
		request.getRequestDispatcher("detailArrest.jsp").forward(request, response);
		return null;
	}
	
	
}
