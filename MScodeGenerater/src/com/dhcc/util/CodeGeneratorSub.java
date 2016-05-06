package com.dhcc.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class CodeGeneratorSub {

	private static final String BASE_PATH = ".";

	private static final String CODE_GENERATOR_PATH = BASE_PATH + "freemarker/outputSub";

	private static final String TEMPLATE_PATH = BASE_PATH + "/freemarker/templateSub";

	private static final Logger logger = Logger.getLogger(CodeGenerator.class);

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    private String subTable = "";
	// 参数列表
	private static final Map paramMaps = new HashMap();

	public CodeGeneratorSub(String subTable) {
		this.subTable = subTable;
	}

	public Map getParamMaps(String table, Map userMap) {
		Map param = (Map) paramMaps.get(table);
		if (param == null) {
			this.intiParamMaps(table, userMap);
		}
		return (Map) paramMaps.get(table);
	}

	/**
	 * 生成所有参数
	 * 
	 * @param table
	 */
	public void intiParamMaps(String table, Map userMap) {
		Map params = new HashMap();
		try {
			JDBCUtil util = new JDBCUtil();
			Connection con = util.getConn();
			// 取出表注释
			List tables = JDBCUtil.getTables(con, "DHCC", null, table);
			String tableDesc = "" + ((List) tables.get(0)).get(4);
			if (tableDesc == null) {
				tableDesc = "";
			}

			// 取出主键
//			Column pk = new Column();
//			List priList = JDBCUtil.getPrimaryKeyColumns(con, "DHCC", null, table);
//			if (priList != null && priList.size() > 0) {
//				pk = (Column) priList.get(0);
//			} else {
//				pk.setName("TNBID");
//				pk.setSqlTypeName("VARCHAR2");
//			}

			// 取出指定表所有的列
			List colList = JDBCUtil.getTableColumns(con, null, null, table);

			String colNames = ""; // 表中所有列的名称，逗号分割
			String colNameReamrks = ""; // 表中所有列的名称和注释（名称 as 注释），逗号分割
			String colJavaNames = "";
			List allList = new LinkedList(); 
			int bLength = 0;
			int eLength = colList.size();
			for (int i = bLength; i < eLength; i++) {
				Column col = (Column) colList.get(i);
				allList.add(col);
				colNames = colNames + col.getName() + ",";
				colJavaNames = colJavaNames + col.getJavaName() + ",";
				String remarks = "" + col.getRemarks();
				if (remarks != null && remarks.length() > 0 && !remarks.equalsIgnoreCase("null")) {
					colNameReamrks = colNameReamrks + remarks + ",";
				} else {
					colNameReamrks = colNameReamrks +",";
				}

			}

			if (colNames.endsWith(",")) {
				colNames = colNames.substring(0, colNames.length() - 1);
			}
			if (colJavaNames.endsWith(",")) {
				colJavaNames = colJavaNames.substring(0, colJavaNames.length() - 1);
			}
			if (colNameReamrks.endsWith(",")) {
				colNameReamrks = colNameReamrks.substring(0, colNameReamrks.length() - 1);
			}
			

			params.put("dataField", allList);
			
			params.put("modifyField", allList);
			
			// 取出表注释
			List subTables = JDBCUtil.getTables(con, "DHCC", null, this.subTable);
			String subTableDesc = "" + ((List) subTables.get(0)).get(4);
			if (subTableDesc == null) {
				subTableDesc = "";
			}

			// 取出主键
//			Column subPk = new Column();
//			List subPriList = JDBCUtil.getPrimaryKeyColumns(con, "DHCC", null, this.subTable);
//			if (subPriList != null && subPriList.size() > 0) {
//				subPk = (Column) subPriList.get(0);
//			} else {
//				subPk.setName("TNBID");
//				subPk.setSqlTypeName("VARCHAR2");
//			}

			// 取出指定表所有的列
			List subColList = JDBCUtil.getTableColumns(con, null, null, this.subTable);
			List allSubList = new LinkedList(); 
			String subColNames = ""; // 表中所有列的名称，逗号分割
			String subColNameReamrks = ""; // 表中所有列的名称和注释（名称 as 注释），逗号分割
			String subColJavaNames = "";
			bLength = 0;
			eLength = subColList.size();
			for (int i = bLength; i < eLength; i++) {
				Column col = (Column) subColList.get(i);
				allSubList.add(col);
				subColNames = subColNames + col.getName() + ",";
				subColJavaNames = subColJavaNames + col.getJavaName() + ",";
				String remarks = "" + col.getRemarks();
				if (remarks != null && remarks.length() > 0 && !remarks.equalsIgnoreCase("null")) {
					subColNameReamrks = subColNameReamrks + col.getName() + " as \\\"" + remarks + "\\\",";
				} else {
					subColNameReamrks = subColNameReamrks + col.getName() + ",";
				}

			}
			if (subColNames.endsWith(",")) {
				subColNames = subColNames.substring(0, subColNames.length() - 1);
			}
			if (subColJavaNames.endsWith(",")) {
				subColJavaNames = subColJavaNames.substring(0, subColJavaNames.length() - 1);
			}
			if (subColNameReamrks.endsWith(",")) {
				subColNameReamrks = subColNameReamrks.substring(0, subColNameReamrks.length() - 1);
			}

			params.put("SubDataField", allSubList);
			
			params.put("SubModifyField", allSubList);
			
			// 加入自定义属性
			Iterator iter = userMap.keySet().iterator();
			while (iter.hasNext()) {
				String key = "" + iter.next();
				params.put(key, userMap.get(key));
			}
			params.put("date", sdf.format(new Date()));
			params.put("table", table);
			params.put("subTable", this.subTable);
			params.put("tableDesc", tableDesc);
			params.put("subTableDesc", subTableDesc);
			params.put("ClassName", StringUtil.getClassNameFromTable(table));
			params.put("SubClassName", StringUtil.getClassNameFromTable(this.subTable));
			params.put("pk", "id");
			params.put("columnList", colList);
			params.put("colNames", colNames);
			params.put("colJavaNames", colJavaNames);
			params.put("colNameReamrks", colNameReamrks);
			
			params.put("subPk", "id");
			params.put("subColumnList", subColList);
			params.put("subColNames", subColNames);
			params.put("subColJavaNames", subColNames);
			params.put("subColNameReamrks", subColNames);

			paramMaps.put(table, params);
			logger.info(params);
		} catch (SQLException e) {
			logger.error(e.getMessage());
		}
	}

	/**
	 * 生成明细页面
	 * 
	 * @param table
	 */
	public void generatorDetail(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			params.put("table", table);
			create("add.ftl", params, CODE_GENERATOR_PATH +"/jsp", table.toLowerCase().replaceAll("_", "")
					+ "_add.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateMgr(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("mgr.ftl", params, CODE_GENERATOR_PATH, className + "Mgr.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateService(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("service.ftl", params, CODE_GENERATOR_PATH + "/service", className + "Service.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateServiceImpl(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("serviceImpl.ftl", params, CODE_GENERATOR_PATH + "/service/impl", className + "ServiceImpl.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateXml(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("xmlSub.ftl", params, CODE_GENERATOR_PATH + "/xml", className + ".xml");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateAction(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("action.ftl", params, CODE_GENERATOR_PATH + "/action", className + "Action.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateSubAction(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("actionSub.ftl", params, CODE_GENERATOR_PATH + "/action", className + "Action.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void generatePojo(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("beanParent.ftl", params, CODE_GENERATOR_PATH + "/model", className + ".java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void generatePojoView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("beanParentView.ftl", params, CODE_GENERATOR_PATH + "/model", className + "View.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void generateSubPojo(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("beanSub.ftl", params, CODE_GENERATOR_PATH + "/model", className + ".java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateSubPojoView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("beanSubView.ftl", params, CODE_GENERATOR_PATH + "/model", className + "View.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 生成查询页面
	 * 
	 * @param table
	 */
	public void generateList(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String jspName = StringUtil.getJspNameFromTable(table);

			create("list.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName + "_list.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成明细页面
	 * 
	 * @param table
	 */
	public void generateItf(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String jspName = StringUtil.getJspNameFromTable(table);
			create("itf.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName + "_itf.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	/**
	 * 生成明细页面
	 * 
	 * @param table
	 */
	public void generateJsp(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String jspName = StringUtil.getJspNameFromTable(table);
			create("jsp.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName + ".jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

	/**
	 * 生成明细页面
	 * 
	 * @param table
	 */
	public void generateJspNew(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String jspName = StringUtil.getJspNameFromTable(table);
			create("jspnew.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName + "new.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
		
	public void generateViewPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("viewPanelSub.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "ViewPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public void generateSubViewPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("viewWindow.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "ViewWindow.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public void generateQueryPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("queryWindow.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "QueryWindow.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
	
	public void generateGridPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("gridPanel.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "GridPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void generateGridPanelView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("gridPanelView.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "GridPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void generateSubGridPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("gridPanelSub.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "GridPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateSubGridPanelView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("gridPanelSubView.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "GridPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void generateAOEFormPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("AOEFormPanelSub.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "AOEFormPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateAOEFormPanelNew(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("AOEFormPanelSubNew.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "AOEFormPanelNew.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateAOEWindow(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("AOEWindow.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "AOEWindow.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateAOEWindowView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("SubClassName");
			create("AOEWindowView.ftl", params, CODE_GENERATOR_PATH + "/jsp/scripts/", className + "AOEWindow.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void create(String ftlTemplate, Map contents, String savePath, String saveFilename) {
		try {
			String defaultEncoding = "UTF-8";
			Configuration cfg = new Configuration();
			cfg.setDefaultEncoding(defaultEncoding);
			cfg.setDirectoryForTemplateLoading(new File("."));
			cfg.setObjectWrapper(new DefaultObjectWrapper());
			Template temp = cfg.getTemplate(TEMPLATE_PATH + File.separator + ftlTemplate);
			logger.info("generate file " + saveFilename + "  in path " + savePath);
			File file = new File(savePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			Writer out = new OutputStreamWriter(new FileOutputStream(savePath + "/" + saveFilename), defaultEncoding);
			temp.process(contents, out);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e1) {
			e1.printStackTrace();
		}
	}

	public void generateAll(String tableName, Map userMap) {
		// generateService(tableName, userMap);
		// generateServiceImpl(tableName, userMap);
		 generateXml(tableName, userMap);
		 if((Integer)userMap.get("viewOrNot")==1){
			 generatePojo(tableName, userMap);
		     generatePojoView(tableName, userMap);
		     generateGridPanelView(tableName, userMap);
		 } else {
			 generatePojo(tableName, userMap);
 			 generateGridPanel(tableName, userMap);
		 }
		 if((Integer)userMap.get("viewSubOrNot")==1){
			 generateSubPojo(tableName, userMap);
			 generateSubPojoView(tableName, userMap);
			 generateSubGridPanelView(tableName, userMap);
			 generateAOEWindowView(tableName, userMap);
		 } else {
			 generateSubPojo(tableName, userMap);
			 generateSubGridPanel(tableName, userMap);
			 generateAOEWindow(tableName, userMap);
		 }
//		 generateAction(tableName, userMap);
		 generateSubAction(tableName, userMap);
		 //generateList(tableName, userMap);
		 //generateItf(tableName, userMap);
		 generateJsp(tableName, userMap);
		 generateViewPanel(tableName, userMap);
//		 generateQueryPanel(tableName, userMap);
//		 generateAOEFormPanel(tableName, userMap);
//		 generateSubViewPanel(tableName, userMap);
		 //编制
		 generateAOEFormPanelNew(tableName, userMap);
		 generateJspNew(tableName, userMap);
	}

	public static void main(String[] args) {
		//子表的名字
		CodeGeneratorSub generator = new CodeGeneratorSub("T_PUB_CODENAME");
		Map userMap = new HashMap();
		/*
		 * 注意：数据库第一个字段应为Id
		 * 
		 */
		//包的路径
		userMap.put("package", "com.dhcc.sys");
		
		//模块名称
		userMap.put("modelName", "编码维护");

		//子表的外键
		userMap.put("subSetColumn", "MAIN_ID");
		
		//model中子表的外键的名字
		userMap.put("subModelSetColumn", StringUtil.toUpperCamelCase("F_CODE_ID"));
		
		//模块包名
		userMap.put("middelPath", "scom/dhcc/sys");
		
		//编辑和查看界面列数
        userMap.put("columnNum", 3);
		
        //主表有视图1，无视图0
		userMap.put("viewOrNot", 0);
		
		//子表有视图1，无视图0
		userMap.put("viewSubOrNot",0);

		//please input your name.
		userMap.put("author", "yangzhen");
		
		//主表的名字
		generator.generateAll("T_PUB_CODE_VAL", userMap);
	}
}
