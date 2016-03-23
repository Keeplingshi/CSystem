package com.cb.csystem.util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.web.multipart.MultipartFile;

import com.cb.csystem.domain.ClassDomain;
import com.cb.csystem.domain.FamilyDomain;
import com.cb.csystem.domain.JobInfoDomain;
import com.cb.csystem.domain.PatyDomain;
import com.cb.csystem.domain.StudentDomain;
import com.cb.csystem.service.IFamilyService;
import com.cb.csystem.service.IJobInfoService;
import com.cb.csystem.service.IPatyService;
import com.cb.csystem.service.IStudentService;
import com.cb.system.util.DateUtil;
import com.cb.system.util.SpringContextUtil;
import com.cb.system.util.ValidateUtil;

/**
 * 从excel导入数据库
 * @author chen
 *
 */
public class ExcelToDBUtil {

	private static IStudentService studentService=(IStudentService)SpringContextUtil.getBean("studentService");
	private static IJobInfoService jobInfoService=(IJobInfoService)SpringContextUtil.getBean("jobInfoService");
	private static IPatyService patyService=(IPatyService)SpringContextUtil.getBean("patyService");
	private static IFamilyService familyService=(IFamilyService)SpringContextUtil.getBean("familyService");
	
	/**
	 * 从excel中录入学生信息
	 * @param file
	 * @return
	 * @throws Exception 
	 */
	public static boolean studentInfoexcelToDB(MultipartFile file,ClassDomain classDomain) throws Exception
	{
		if(classDomain==null){
			return false;
		}
		
		Workbook wb=null;
		
		try {
			wb = WorkbookFactory.create(file.getInputStream());
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Sheet sheet = wb.getSheetAt(0);
		
		for(Row row:sheet){
			if(row.getRowNum()==0){
				continue;
			}
			StudentDomain studentDomain=new StudentDomain();
			String content=null;
			Cell cell=null;
			int i=0;
			switch (i) {
				case 0:	//学号
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);
					content=cell.getStringCellValue().trim();
					if(content!=null&&!"".equals(content)){
						studentDomain.setStuId(content);
					}
					i++;					
				case 1:	//姓名
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);
					content=cell.getStringCellValue().trim();
					if(content!=null&&!"".equals(content)){
						studentDomain.setName(content);
					}
					i++;					
				case 2:	//性别
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.SEX_TYPE);
					if(content!=null&&!"".equals(content)){
						studentDomain.setSex(Integer.valueOf(content));
					}
					i++;				
				case 3:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					Date date=cell.getDateCellValue();
					if(date!=null){
						studentDomain.setBirthday(date);
					}
					i++;					
				case 4:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.POLITICALSTATUE_TYPE);
					if(content!=null&&!"".equals(content)){
						studentDomain.setPoliticalStatus(Integer.valueOf(content));
					}
					i++;					
				case 5:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					if(content!=null&&!"".equals(content)){
						studentDomain.setIDnumber(content);
					}
					i++;					
				case 6:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					if(content!=null&&!"".equals(content)){
						studentDomain.setNativePlace(content);
					}
					i++;					
				case 7:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					if(content!=null&&!"".equals(content)){
						studentDomain.setDormitory(content);
					}
					i++;					
				case 8:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					if(ValidateUtil.checkEmail(content)){
						studentDomain.setEmail(content);
					}
					i++;					
				case 9:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					if(ValidateUtil.notEmpty(content)){
						studentDomain.setTeachClass(content);
					}
					i++;
				case 10:
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					if(ValidateUtil.notEmpty(content)){
						studentDomain.setCellphone(content);
					}
					i++;
				default:
			}

			String stuId=studentDomain.getStuId();
			StudentDomain studentExistsDomain=studentService.doGetByStudentId(stuId);
			//存在该学生，更新
			if(studentExistsDomain!=null){
				studentExistsDomain.setName(studentDomain.getName());
				studentExistsDomain.setSex(studentDomain.getSex());
				studentExistsDomain.setBirthday(studentDomain.getBirthday());
				studentExistsDomain.setPoliticalStatus(studentDomain.getPoliticalStatus());
				studentExistsDomain.setIDnumber(studentDomain.getIDnumber());
				studentExistsDomain.setNativePlace(studentDomain.getNativePlace());
				studentExistsDomain.setDormitory(studentDomain.getDormitory());
				studentExistsDomain.setClassDomain(classDomain);
				studentExistsDomain.setEmail(studentDomain.getEmail());
				studentExistsDomain.setTeachClass(studentDomain.getTeachClass());
				studentExistsDomain.setCellphone(studentDomain.getCellphone());
				studentService.doSaveStuAndOthers(studentExistsDomain);
			}else{
				studentDomain.setClassDomain(classDomain);
				studentService.doSaveStuAndOthers(studentDomain);
			}
			
		}
		
		return true;
	}

	/**
	 * excel录入就业信息
	 * @param file
	 * @param classDomain
	 */
	public static void jobInfoexcelToDB(MultipartFile file,ClassDomain classDomain) throws Exception{
		// TODO Auto-generated method stub
		if(classDomain==null){
			return ;
		}
		
		Workbook wb=null;
		
		try {
			wb = WorkbookFactory.create(file.getInputStream());
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		Sheet sheet = wb.getSheetAt(0);
		
		for(Row row:sheet){
			if(row.getRowNum()==0){
				continue;
			}
			StudentDomain studentDomain=new StudentDomain();
			String content=null;
			Cell cell=null;
			int i=0;
			switch (i) {
				case 0:	//学号
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);
					content=cell.getStringCellValue().trim();
					if(ValidateUtil.notEmpty(content)){
						studentDomain.setStuId(content);
					}
					i++;					
				case 1:	//姓名
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);
					content=cell.getStringCellValue().trim();
					if(ValidateUtil.notEmpty(content)){
						studentDomain.setName(content);
					}
					i++;					
				case 2:	//性别
					cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
					cell.setCellType(Cell.CELL_TYPE_STRING);  
					content=cell.getStringCellValue().trim();
					content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.SEX_TYPE);
					if(ValidateUtil.notEmpty(content)){
						studentDomain.setSex(Integer.valueOf(content));
					}
					i++;
				default:
			}

			String stuId=studentDomain.getStuId();
			StudentDomain studentExistsDomain=studentService.doGetByStudentId(stuId);
			//存在该学生，更新
			if(studentExistsDomain!=null){
				//如果学生已经存在，则就业信息存在，取出赋值，保存
				JobInfoDomain jobInfoDomain=studentExistsDomain.getJobInfo();
				switch (i) {			
					case 3://签约状态
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.CONTRACTSTATUS_TYPE);
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setContractStatus(Integer.valueOf(content));
						}
						i++;					
					case 4://签约单位
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setCompany(content);
						}
						i++;					
					case 5://协议书状态
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.PROTOCALSTATE_TYPE);
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setProtocalState(Integer.valueOf(content));
						}
						i++;					
					case 6://当前状态
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.NOWSTATE_TYPE);
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setNowState(Integer.valueOf(content));
						}
						i++;					
					case 7://城市
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setCity(content);
						}
						i++;					
					case 8://薪金
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setSalary(Integer.valueOf(content));
						}
						i++;					
					case 9://备注
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setNote(content);
						}
						i++;
					default:
				}
				jobInfoService.doSave(jobInfoDomain);
				
				studentExistsDomain.setName(studentDomain.getName());
				studentExistsDomain.setSex(studentDomain.getSex());
				studentExistsDomain.setBirthday(studentDomain.getBirthday());
				studentExistsDomain.setPoliticalStatus(studentDomain.getPoliticalStatus());
				studentExistsDomain.setIDnumber(studentDomain.getIDnumber());
				studentExistsDomain.setNativePlace(studentDomain.getNativePlace());
				studentExistsDomain.setDormitory(studentDomain.getDormitory());
				studentExistsDomain.setClassDomain(classDomain);
				studentExistsDomain.setEmail(studentDomain.getEmail());
				studentExistsDomain.setTeachClass(studentDomain.getTeachClass());
				studentExistsDomain.setCellphone(studentDomain.getCellphone());
				studentService.doSaveStuAndOthers(studentExistsDomain);	//update
			}else{
				//如果学生不存在，则创建就业信息
				JobInfoDomain jobInfoDomain=new JobInfoDomain();
				switch (i) {			
					case 3://签约状态
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.CONTRACTSTATUS_TYPE);
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setContractStatus(Integer.valueOf(content));
						}
						i++;					
					case 4://签约单位
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setCompany(content);
						}
						i++;					
					case 5://协议书状态
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.PROTOCALSTATE_TYPE);
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setProtocalState(Integer.valueOf(content));
						}
						i++;					
					case 6://当前状态
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						content=CodeBookHelper.getValueByNameAndType(content, CodeBookConstsType.NOWSTATE_TYPE);
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setNowState(Integer.valueOf(content));
						}
						i++;					
					case 7://城市
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setCity(content);
						}
						i++;					
					case 8://薪金
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setSalary(Integer.valueOf(content));
						}
						i++;					
					case 9://备注
						cell = row.getCell(i, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);  
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							jobInfoDomain.setNote(content);
						}
						i++;
					default:
				}
				
				jobInfoDomain.setStudent(studentDomain);
				jobInfoService.doSave(jobInfoDomain);
				studentDomain.setJobInfo(jobInfoDomain);
				studentDomain.setClassDomain(classDomain);
				studentService.doSave(studentDomain);	//save
				
			}

		}
		
	}
	
	/**
	 * 党建信息导入数据库
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public static String patyExcelToDB(MultipartFile file)throws Exception
	{
		Workbook workbook=null;
		
		try {
			workbook = WorkbookFactory.create(file.getInputStream());
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//获取excel的sheet
		Sheet sheet = workbook.getSheetAt(0);
		int allNum=0;
		int successNum=0;
		
		for(Row row:sheet){
			if(row.getRowNum()==0){
				continue;
			}
			allNum++;
			String content=null;
			Cell cell=null;
			
			//第0列，学号
			cell = row.getCell(0, Row.CREATE_NULL_AS_BLANK); 
			cell.setCellType(Cell.CELL_TYPE_STRING);
			content=cell.getStringCellValue().trim();
			
			if(ValidateUtil.notEmpty(content)){
				//通过学号获取学生
				StudentDomain studentDomain=studentService.doGetByStudentId(content);
				if(studentDomain!=null)
				{
					PatyDomain patyDomain=studentDomain.getPaty();
					if(patyDomain!=null)
					{
						//提交入党申请书日期
						cell = row.getCell(4, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setApplicationDate(DateUtil.parseDate(content));
						}
						
						//确定积极份子日期
						cell = row.getCell(5, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setActiveDate(DateUtil.parseDate(content));
						}
						
						
						//确定发展对象日期
						cell = row.getCell(6, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setDevelopDate(DateUtil.parseDate(content));
						}
						
						//入党日期
						cell = row.getCell(7, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setJoinpatyDate(DateUtil.parseDate(content));
						}
						
						//转正日期
						cell = row.getCell(8, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setConfirmDate(DateUtil.parseDate(content));
						}
						
						//备注
						cell = row.getCell(9, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setNote(content);
						}
						
						if(patyService.doSave(patyDomain)){
							successNum++;
						}
						
					}else{
						patyDomain=new PatyDomain();
						//提交入党申请书日期
						cell = row.getCell(4, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setApplicationDate(DateUtil.parseDate(content));
						}
						
						//确定积极份子日期
						cell = row.getCell(5, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setActiveDate(DateUtil.parseDate(content));
						}
						
						//确定发展对象日期
						cell = row.getCell(6, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setDevelopDate(DateUtil.parseDate(content));
						}
						
						
						//入党日期
						cell = row.getCell(7, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setJoinpatyDate(DateUtil.parseDate(content));
						}
						
						//转正日期
						cell = row.getCell(8, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setConfirmDate(DateUtil.parseDate(content));
						}
						
						
						//备注
						cell = row.getCell(9, Row.CREATE_NULL_AS_BLANK); 
						cell.setCellType(Cell.CELL_TYPE_STRING);
						content=cell.getStringCellValue().trim();
						if(ValidateUtil.notEmpty(content)){
							patyDomain.setNote(content);
						}
						
						patyDomain.setStudent(studentDomain);
						if(patyService.doSave(patyDomain)){
							successNum++;
						}
						studentDomain.setPaty(patyDomain);
						studentService.doSave(studentDomain);	//save
					}
					
				}
				
			}
		
		}
		
		String result="共"+allNum+"条数据，导入成功"+successNum+"条";
		
		return result;
	}

	/**
	 * @param file
	 * @return
	 */
	public static String familyExcelToDB(MultipartFile file) throws Exception{
		// TODO Auto-generated method stub
		Workbook workbook=null;
		
		try {
			workbook = WorkbookFactory.create(file.getInputStream());
		} catch (EncryptedDocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//获取excel的sheet
		Sheet sheet = workbook.getSheetAt(0);
		int allNum=0;
		int successNum=0;
		
		for(Row row:sheet){
			if(row.getRowNum()==0){
				continue;
			}
			allNum++;
			
			//第0列，学号,读取非家庭成员信息
			String content=null;
			Cell cell = row.getCell(0, Row.CREATE_NULL_AS_BLANK); 
			cell.setCellType(Cell.CELL_TYPE_STRING);
			content=cell.getStringCellValue().trim();
			
			//读取家庭成员1,2,3信息
			Cell cellfamily[]=new Cell[3];
			String contentfamily[]=new String[3];
			
			if(ValidateUtil.notEmpty(content)){
				//通过学号获取学生
				StudentDomain studentDomain=studentService.doGetByStudentId(content);
				if(studentDomain!=null)
				{
					List<FamilyDomain> familyDomains=new ArrayList<FamilyDomain>(studentDomain.getFamilies());
					int familySize=familyDomains.size();
					//家庭成员1姓名
					cellfamily[0]= row.getCell(7, Row.CREATE_NULL_AS_BLANK); 
					cellfamily[0].setCellType(Cell.CELL_TYPE_STRING);
					contentfamily[0]=cellfamily[0].getStringCellValue().trim();
					
					//家庭成员1姓名
					cellfamily[1]= row.getCell(17, Row.CREATE_NULL_AS_BLANK); 
					cellfamily[1].setCellType(Cell.CELL_TYPE_STRING);
					contentfamily[1]=cellfamily[1].getStringCellValue().trim();
					
					//家庭成员1姓名
					cellfamily[2]= row.getCell(27, Row.CREATE_NULL_AS_BLANK); 
					cellfamily[2].setCellType(Cell.CELL_TYPE_STRING);
					contentfamily[2]=cellfamily[2].getStringCellValue().trim();
					
					for(int i=0;i<cellfamily.length;i++)
					{
						if(ValidateUtil.notEmpty(contentfamily[i])){
							FamilyDomain familyDomain=null;
							boolean issame=false;
							if(familyDomains!=null){
								for(int j=0;j<familySize;j++){
									//如果读入的家庭成员与数据库中姓名相同，更新
									if(contentfamily[i].equals(familyDomains.get(j).getName())){
										issame=true;
										familyDomain=familyDomains.get(j);
									}
								}
							}
							
							if(!issame){
								familyDomain=new FamilyDomain();
								familyDomain.setStudent(studentDomain);
							}
							familyDomain.setName(contentfamily[i]);
							
							cellfamily[i]= row.getCell(8+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//设置生日
									familyDomain.setBirthday(DateUtil.parseDate(contentfamily[i]));
								}else{
									//关系
									familyDomain.setJob(contentfamily[i]);
								}
							}

							cellfamily[i]= row.getCell(9+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//职务
									familyDomain.setJob(contentfamily[i]);
								}else{
									//关系
									familyDomain.setRelation(contentfamily[i]);
								}
							}
							
							cellfamily[i]= row.getCell(10+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//关系
									familyDomain.setRelation(contentfamily[i]);
								}else{
									//职业
									familyDomain.setOccupation(contentfamily[i]);
								}
							}
							
							cellfamily[i]= row.getCell(11+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//职业
									familyDomain.setOccupation(contentfamily[i]);
								}else{
									//民族
									familyDomain.setNationality(contentfamily[i]);
								}
							}
							
							cellfamily[i]= row.getCell(12+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//民族
									familyDomain.setNationality(contentfamily[i]);
								}else{
									//政治面貌
									familyDomain.setPoliticalStatus(contentfamily[i]);
								}
							}
							
							cellfamily[i]= row.getCell(13+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//政治面貌
									familyDomain.setPoliticalStatus(contentfamily[i]);
								}else{
									//工作地址
									familyDomain.setJobAddress(contentfamily[i]);
								}
							}
							
							cellfamily[i]= row.getCell(14+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								if(i==0){
									//工作地址
									familyDomain.setJobAddress(contentfamily[i]);
								}else{
									//设置生日
									familyDomain.setBirthday(DateUtil.parseDate(contentfamily[i]));
								}
							}
							
							//设置联系电话1，固话
							cellfamily[i]= row.getCell(15+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								familyDomain.setTelePhone(contentfamily[i]);
							}

							//设置联系电话2，手机
							cellfamily[i]= row.getCell(16+10*i, Row.CREATE_NULL_AS_BLANK);
							cellfamily[i].setCellType(Cell.CELL_TYPE_STRING);
							contentfamily[i]=cellfamily[i].getStringCellValue().trim();
							if(ValidateUtil.notEmpty(contentfamily[i])){
								familyDomain.setCellphone(contentfamily[i]);
							}
							
							//家庭住址
							cell= row.getCell(4, Row.CREATE_NULL_AS_BLANK);
							cell.setCellType(Cell.CELL_TYPE_STRING);
							content=cell.getStringCellValue().trim();
							if(ValidateUtil.notEmpty(content)){
								familyDomain.setAddress(content);
							}
							
							//设置邮编
							cell= row.getCell(5, Row.CREATE_NULL_AS_BLANK);
							cell.setCellType(Cell.CELL_TYPE_STRING);
							content=cell.getStringCellValue().trim();
							if(ValidateUtil.notEmpty(content)){
								familyDomain.setPostCode(content);
							}
							
							//设置家庭经济情况
							cell= row.getCell(6, Row.CREATE_NULL_AS_BLANK);
							cell.setCellType(Cell.CELL_TYPE_STRING);
							content=cell.getStringCellValue().trim();
							if(ValidateUtil.notEmpty(content)){
								familyDomain.setEconomicStatus(content);
							}
							
							if(familyService.doSave(familyDomain)){
								successNum++;
							}
						}
					}
				}
			}
		}
		
		String result="共"+allNum+"七位学生，成功导入"+successNum+"位家庭成员信息";
		
		return result;
	}
	
}
