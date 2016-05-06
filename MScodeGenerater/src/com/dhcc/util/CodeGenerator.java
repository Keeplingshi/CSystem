package com.dhcc.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

public class CodeGenerator {

	private static final String BASE_PATH = ".";

	private static final String CODE_GENERATOR_PATH = "freemarker/output/mybatis";

	private static final String TEMPLATE_PATH = BASE_PATH
			+ "/freemarker/template/mybatis";

	private static final Logger logger = Logger.getLogger(CodeGenerator.class);

	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

	private int DataBsetype = 3; // 1 mysql 2orcale

	// 参数列表
	private static final Map paramMaps = new HashMap();

	public CodeGenerator() {

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
			// List tables = JDBCUtil.getTables(con, JDBCUtil.schemaPattern,
			// null, table);
			// String tableDesc = "" + ((List) tables.get(0)).get(4);
			// if (tableDesc == null) {
			// tableDesc = "";
			// }

			// 取出主键
			Column pk = new Column();
			List priList = null;
			//MYSQL
			if (DataBsetype == 1) {
				priList = JDBCUtil.getPrimaryKeyColumns(con, JDBCUtil.catalog,
						null, table);
			} else if (DataBsetype == 2) {
				priList = JDBCUtil.getPrimaryKeyColumns(con, null,
						JDBCUtil.schemaPattern, table);

			} else if (DataBsetype == 3) {
				priList = JDBCUtil.getPrimaryKeyColumns(con, null, null, table);
			}
			if (priList != null && priList.size() > 0) {
				pk = (Column) priList.get(0);
			} else {
				pk.setName("TNBID");
				pk.setSqlTypeName("VARCHAR2");
			}

			// 取出指定表所有的列
			List colList = null;
			if (DataBsetype == 1) {
				colList = JDBCUtil.getTableColumns(con, JDBCUtil.catalog, null,
						table);
			} else if (DataBsetype == 2) {
				colList = JDBCUtil.getTableColumns(con, null,
						JDBCUtil.schemaPattern, table);

			} else if (DataBsetype == 3) {
				colList = JDBCUtil.getTableColumns(con, null, null, table);
			}
			// List colList = JDBCUtil.getTableColumns(con, null, null, table);

			String colNames = ""; // 表中所有列的名称，逗号分割
			String colNameReamrks = ""; // 表中所有列的名称和注释（名称 as 注释），逗号分割
			String colJavaNames = "";
			List allList = new LinkedList();
			int eLength = colList.size();
			for (int i = 0; i < eLength; i++) {
				Column col = (Column) colList.get(i);
				String name = col.getName();
				allList.add(col);
				colNames = colNames + name + ",";
				colJavaNames = colJavaNames + col.getJavaName() + ",";
				String remarks = "" + col.getRemarks();
				if (remarks != null && remarks.length() > 0
						&& !remarks.equalsIgnoreCase("null")) {
					colNameReamrks = colNameReamrks + name + " as " + remarks
							+ ",";
				} else {
					colNameReamrks = colNameReamrks + name + ",";
				}
			}

			if (colNames.endsWith(",")) {
				colNames = colNames.substring(0, colNames.length() - 1);
			}
			if (colJavaNames.endsWith(",")) {
				colJavaNames = colJavaNames.substring(0,
						colJavaNames.length() - 1);
			}
			if (colNameReamrks.endsWith(",")) {
				colNameReamrks = colNameReamrks.substring(0,
						colNameReamrks.length() - 1);
			}

			List dataField = StringUtil.String2Columns(colNames,
					colNameReamrks, ",");
			params.put("dataField", allList);

			List modifyField = StringUtil.String2Columns(colNames,
					colNameReamrks, ",");
			params.put("modifyField", allList);

			params.put("date", sdf.format(new Date()));
			params.put("table", table);
			// params.put("tableDesc", tableDesc);
			params.put("ClassName", StringUtil.getClassNameFromTable(table));
			params.put("pk", pk);
			params.put("columnList", colList);
			params.put("colNames", colNames);
			params.put("colJavaNames", colJavaNames);
			params.put("colNameReamrks", colNameReamrks);

			// 加入自定义属性
			Iterator iter = userMap.keySet().iterator();
			while (iter.hasNext()) {
				String key = "" + iter.next();
				params.put(key, userMap.get(key));
			}
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
			create("add.ftl", params, BASE_PATH + "/freemarker/jsp", table
					.toLowerCase().replaceAll("_", "") + "_add.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateMgr(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("mgr.ftl", params, CODE_GENERATOR_PATH, className
					+ "Mgr.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param table
	 * @param userMap
	 *            public void generateService(String table, Map userMap) { try {
	 *            Map params = this.getParamMaps(table, userMap); String
	 *            className = "" + params.get("ClassName");
	 *            create("services.ftl", params, CODE_GENERATOR_PATH +
	 *            "/service", className + "Service.java"); } catch (Exception e)
	 *            { e.printStackTrace(); } }
	 */
	public void generateDao(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("impl.ftl", params, CODE_GENERATOR_PATH + "/dao/impl",
					className + "DaoImpl.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateDaoInterface(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "I" + params.get("ClassName");
			create("dao.ftl", params, CODE_GENERATOR_PATH + "/dao", className
					+ "Dao.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateServiceInterface(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "I" + params.get("ClassName");
			create("services.ftl", params, CODE_GENERATOR_PATH + "/service",
					className + "Service.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateServiceImpl(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("serviceImpl.ftl", params, CODE_GENERATOR_PATH
					+ "/service/impl", className + "ServiceImpl.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateXml(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("xml.ftl", params, CODE_GENERATOR_PATH + "/xml", className
					+ ".xml");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateAction(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("action.ftl", params, CODE_GENERATOR_PATH + "/action",
					className + "Controller.java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generatePojo(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("bean.ftl", params, CODE_GENERATOR_PATH + "/entity",
					className + ".java");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generatePojoView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("beanView.ftl", params, CODE_GENERATOR_PATH + "/domain",
					className + "View.java");
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
			String a =table.substring(0,1).toLowerCase();
			String b=table.substring(1,table.length());
			String jspName =a+b;
			create("list.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName
					+ "List.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 生成添加页面
	 * 
	 * @param table
	 */
	public void generateAdd(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String a =table.substring(0,1).toLowerCase();
			String b=table.substring(1,table.length());
			String jspName =a+b;
			create("add.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName
					+ "Add.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 生成明细页面
	 * 
	 * @param table
	 */
	public void generateView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String a =table.substring(0,1).toLowerCase();
			String b=table.substring(1,table.length());
			String jspName =a+b;
			create("view.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName
					+ "View.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 生成添加页面
	 * 
	 * @param table
	 */
	public void generateEdit(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String a =table.substring(0,1).toLowerCase();
			String b=table.substring(1,table.length());
			String jspName =a+b;
			create("edit.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName
					+ "Edit.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	/**
	 * 生成查询页面
	 * 
	 * @param table
	 */
	public void generateListJs(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String jspName = StringUtil.getJspNameFromTable(table);

			create("list_js.ftl", params, CODE_GENERATOR_PATH + "/jsp/js",
					jspName + "_list.js");
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
			create("itf.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName
					+ "_itf.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 生成明细页面
	 * 
	 * @param table
	 */
	public void generateItfJs(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String jspName = StringUtil.getJspNameFromTable(table);
			create("itf_js.ftl", params, CODE_GENERATOR_PATH + "/jsp/js",
					jspName + "_itf.js");
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
			create("jsp.ftl", params, CODE_GENERATOR_PATH + "/jsp", jspName
					+ ".jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateViewPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("viewPanel.ftl", params, CODE_GENERATOR_PATH
					+ "/jsp/scripts/", className + "ViewPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateHomePanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("queryWindow.ftl", params, CODE_GENERATOR_PATH
					+ "/jsp/scripts/", className + "QueryWindow.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateGridPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("gridPanel.ftl", params, CODE_GENERATOR_PATH
					+ "/jsp/scripts/", className + "GridPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateGridPanelView(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("gridPanelView.ftl", params, CODE_GENERATOR_PATH
					+ "/jsp/scripts/", className + "GridPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void generateAOEFormPanel(String table, Map userMap) {
		try {
			Map params = this.getParamMaps(table, userMap);
			String className = "" + params.get("ClassName");
			create("AOEFormPanel.ftl", params, CODE_GENERATOR_PATH
					+ "/jsp/scripts/", className + "AOEFormPanel.js");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void create(String ftlTemplate, Map contents, String savePath,
			String saveFilename) {
		try {
			String defaultEncoding = "UTF-8";
			Configuration cfg = new Configuration();
			cfg.setDefaultEncoding(defaultEncoding);
			cfg.setDirectoryForTemplateLoading(new File("."));
			cfg.setObjectWrapper(new DefaultObjectWrapper());
			Template temp = cfg.getTemplate(TEMPLATE_PATH + File.separator
					+ ftlTemplate);
			logger.info("generate file " + saveFilename + "  in path "
					+ savePath);
			File file = new File(savePath);
			if (!file.exists()) {
				file.mkdirs();
			}
			Writer out = new OutputStreamWriter(new FileOutputStream(savePath
					+ "/" + saveFilename), defaultEncoding);
			temp.process(contents, out);
			out.flush();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (TemplateException e1) {
			e1.printStackTrace();
		}
	}

	public void generateAll(String tableName, Map userMap) {
		generateServiceInterface(tableName, userMap);
		generateServiceImpl(tableName, userMap);
		generateDao(tableName, userMap);
		generateDaoInterface(tableName, userMap);
		generateAction(tableName, userMap);
		generateXml(tableName, userMap);
		 generateList(tableName, userMap);
		 generateAdd(tableName, userMap);
		 generateEdit(tableName, userMap);
		 generateView(tableName,userMap);
		// generateItf(tableName, userMap);
		// generateListJs(tableName, userMap);
		// generateItfJs(tableName, userMap);
		//generatePojo(tableName, userMap);
	}

	public static void main(String[] args) {
		CodeGenerator generator = new CodeGenerator();
		Map userMap = new HashMap();
		// 包的路径
		userMap.put("package", "com.xb.sys");
		// 父类的前缀
		userMap.put("parentClassPrefix", "");
		// 模块名称
		userMap.put("modelName", "用户信息");

		// 模块包名
		userMap.put("middelPath", "rwjh");

		// 编辑和查看界面列数
		userMap.put("columnNum", 3);

		// 有视图1，无视图0
		userMap.put("viewOrNot", 0);

		// please input your name.
		userMap.put("author", "xiebin");

		// 表的名字 //必须大写
		String tableName = "CodeBook";
		generator.generateAll(tableName, userMap);
	}
}
