package com.cb.system.util;

import java.text.DecimalFormat;

/**
 * 数字格式化
 * @author Administrator
 *
 */
public class NumberFormat {

	/**
	 * 数字 两位小数
	 * @param d
	 * @return
	 */
	public static Double doubleFormat(double d){
		
		DecimalFormat decimalFormat=new DecimalFormat("#.00");
		return Double.valueOf(decimalFormat.format(d));
	}
	
}
