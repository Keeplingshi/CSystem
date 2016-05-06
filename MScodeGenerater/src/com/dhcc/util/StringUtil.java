package com.dhcc.util;

import java.util.ArrayList;
import java.util.List;

public class StringUtil {

	/**
	 * 该方法负责把一个Sql字段转换为符合驼峰风格的Java字段
	 * 
	 * @param s
	 * @return
	 */
	public static String toUpperCamelCase(String s) {
		if ("".equals(s))
			return s;

		StringBuffer result = new StringBuffer();

		boolean capitalize = true;
		boolean lastCapital = false;
		boolean lastDecapitalized = false;
		String p = null;
		for (int i = 0; i < s.length(); ++i) {
			String c = s.substring(i, i + 1);
			if (("_".equals(c)) || (" ".equals(c)) || ("-".equals(c))) {
				capitalize = true;
			} else {
				if (c.toUpperCase().equals(c)) {
					if ((lastDecapitalized) && (!(lastCapital)))
						capitalize = true;

					lastCapital = true;
				} else {
					lastCapital = false;
				}

				if (capitalize) {
					if ((p == null) || (!(p.equals("_")))) {
						if (i == 0) {
							result.append(c.toLowerCase());
						} else {
							result.append(c.toUpperCase());
						}
						capitalize = false;
						p = c;
					} else {
						result.append(c.toLowerCase());
						capitalize = false;
						p = c;
					}
				} else {
					result.append(c.toLowerCase());
					lastDecapitalized = true;
					p = c;
				}
			}
		}
		String r = result.toString();
		return r;
	}

	/**
	 * 去掉表名或者列名前的前缀,例如：F_,T_
	 * 
	 * @param s
	 * @return
	 */
	public static String removePrefix(String s) {
		String[] prefixs = {"T_","T_EM", "T_EQUI","T_SAFE","T_BASE","T_PROD","T_SAF","T_PSDM", "F_","V_DR","T_DIS","T_MM","T_INTER" ,"V_"};
		for (String prefix : prefixs) {
			if (s.startsWith(prefix)) {
				s = s.substring(prefix.length(), s.length());
				break;
			}
		}
		return s;
	}

	/**
	 * 根据传入的表名返回对应的Java类名
	 * 
	 * @param table
	 * @return
	 */
	public static String getClassNameFromTable(String table) {
		String classname = StringUtil.removePrefix(table);
		classname = StringUtil.toUpperCamelCase(classname);
		// 首字母大写
		String first = classname.substring(0, 1).toUpperCase();
		classname = first + classname.substring(1, classname.length());
		//视图需要加View
		if (table.startsWith("V_")) {
			classname = classname + "View";
		}
		return classname;
	}

	/**
	 * 根据传入的表名返回对应的JSP文件名
	 * 
	 * @param table
	 * @return
	 */
	public static String getJspNameFromTable(String table) {
		String jspname = StringUtil.removePrefix(table);
		jspname = StringUtil.toUpperCamelCase(jspname);
		//全部转为小写
		jspname = jspname.toLowerCase();
		return jspname;
	}


	public static List String2List(String str, String regex) {
		List li = new ArrayList();
		if (str != null && str.length() > 0 && !str.equalsIgnoreCase("null")) {
			String[] strArr = str.split(regex);
			for (int i = 0; i < strArr.length; i++) {
				li.add(strArr[i]);
			}
		}
		return li;
	}
	
	public static List String2Columns(String codes, String names, String regex) {
		List li = new ArrayList();
		if (codes != null && codes.length() > 0
				&& !codes.equalsIgnoreCase("null") && names != null
				&& names.length() > 0 && !names.equalsIgnoreCase("null")) {
			String[] code = codes.split(regex);
			String[] name = names.split(regex);
			if (code.length == name.length) {
				for (int i = 0; i < code.length; i++) {
					Column col = new Column();
					col.setName(code[i]);
					col.setRemarks(name[i]);
					li.add(col);
				}
			} else {
				System.out.println("传入的编码个数和名称个数不一致，返回空！");
			}
		}
		return li;
	}

}
