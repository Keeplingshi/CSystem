package com.cumt.criminal.util;

import java.util.List;

import com.cumt.criminal.model.CaseRegisterDomain;
import com.cumt.criminal.service.CaseRegisterService;
import com.cumt.criminal.service.impl.CaseRegisterServiceImpl;

public class QueryDBPages {
	
	private static List<CaseRegisterDomain> caseRegisterDomainList = null;
	private static CaseRegisterService caseRegisterService = null;
	
	public static int doGetPages(){
		caseRegisterService = new CaseRegisterServiceImpl();
		caseRegisterDomainList = caseRegisterService.findAll();
		if (caseRegisterDomainList.size()%8==0) {
			System.out.println(caseRegisterDomainList.size()/8);
			return caseRegisterDomainList.size();
		}else {
			System.out.println(caseRegisterDomainList.size()/8+1+":!=0");
			return caseRegisterDomainList.size()+1;
		}
	}
}
