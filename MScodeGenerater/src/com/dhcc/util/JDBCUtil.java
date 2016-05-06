package com.dhcc.util;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.Logger;

//import com.dhcc.common.dao.BaseDao;

/**
 * 
 * @author Administrator
 */
public class JDBCUtil {
	private static final Logger logger = Logger.getLogger(JDBCUtil.class);
	public static final String catalog = "";
	public static final String schemaPattern = "sa";  //当链接oracle时使用,值为 大写的用户名

	// 建立数据库访问Connection,这里不能使用链接池，不然后面会缺信息
	public Connection getConn() {
		Connection conn = null;
		//oracle
//		String driverName = "oracle.jdbc.driver.OracleDriver";
	//	String urlToConnect = "jdbc:oracle:thin:@192.168.1.251:1521:orcl";
		//mysql
		String driverName="com.mysql.jdbc.Driver";
		String urlToConnect = "jdbc:mysql://localhost:3306/sys?useUnicode=true&characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
		
		
	//	String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	//	String urlToConnect = "jdbc:sqlserver://localhost:1433;DatabaseName=pingtai";
		
		String user = "root";
		String pwd = "root";
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(urlToConnect, user, pwd);
			// Oracle数据库必须把RemarksReporting设为True，否则取不到列注释
			if (conn instanceof oracle.jdbc.driver.OracleConnection) {
				((oracle.jdbc.driver.OracleConnection) conn).setRemarksReporting(true);
			}

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}

	public static List getCatalogs(Connection c) throws SQLException {
		DatabaseMetaData dmd = c.getMetaData();
		ResultSet rs = null;
		try {
			rs = dmd.getCatalogs();
			List l = new LinkedList();
			while (rs.next()) {
				l.add(rs.getString(1));
			}
			return l;
		} finally {
			if (rs != null)
				rs.close();
		}
	}

	public static Map getSchemas(Connection c) throws SQLException {
		DatabaseMetaData dmd = c.getMetaData();
		ResultSet rs = null;
		try {
			rs = dmd.getSchemas();
			Map map = new HashMap();
			List l;
			while (rs.next()) {
				String schema = rs.getString(1);
				String catalog = null;
				if (rs.getMetaData().getColumnCount() > 1) {
					catalog = rs.getString(2);
				}
				l = (List) map.get(catalog);
				if (l == null) {
					l = new LinkedList();
					map.put(catalog, l);
				}
				l.add(schema);
			}
			return map;
		} finally {
			if (rs != null)
				rs.close();
		}
	}

	public static List getTables(Connection c, String catalog, String schema, String tablePattern) throws SQLException {
		DatabaseMetaData dmd = c.getMetaData();
		ResultSet rs = null;
		try {
			rs = dmd.getTables(catalog, schema, tablePattern, new String[] { "TABLE", "VIEW", "SYNONYM", "ALIAS" });
			List l = new LinkedList();
			while (rs.next()) {
				List one = new LinkedList();
				one.add(rs.getString(1));
				one.add(rs.getString(2));
				one.add(rs.getString(3));
				one.add(rs.getString(4));
				one.add(rs.getString(5));
				l.add(one);
			}
			return l;
		} finally {
			if (rs != null)
				rs.close();
		}
	}

	public static Set getForeignKeyColumns(Connection c, String catalog, String schema, String table)
			throws SQLException {
		DatabaseMetaData dmd = c.getMetaData();
		ResultSet rs = null;
		try {
			rs = dmd.getImportedKeys(catalog, schema, table);
			HashSet columns = new HashSet();
			while (rs.next()) {
				columns.add(rs.getString(8));
			}
			return columns;
		} finally {
			if (rs != null)
				rs.close();
		}
	}

	public static List getPrimaryKeyColumns(Connection c, String catalog, String schema, String table)
			throws SQLException {
		DatabaseMetaData dmd = c.getMetaData();
		ResultSet rs = null;
		try {
			rs = dmd.getPrimaryKeys(catalog, schema, table);
			List pkColumns = new LinkedList();
			if (rs.next()) {
				List tmp = getTableColumns(c, catalog, schema, table, rs.getString(4));
				Column pkColumn = (Column) tmp.get(0);
				pkColumns.add(pkColumn);
			}
			return pkColumns;
		} finally {
			if (rs != null)
				rs.close();
		}
	}

	public static List getTableColumns(Connection c, String catalog, String schema, String table) throws SQLException {
		return getTableColumns(c, catalog, schema, table, null);
	}

	public static List getTableColumns(Connection c, String catalog, String schema, String table, String columnPattern)
			throws SQLException {
		DatabaseMetaData dmd = c.getMetaData();
		ResultSet rs = null;
		try {
			rs = dmd.getColumns(catalog, schema, table, columnPattern);
			int rsCount = rs.getRow();
			List columns = new LinkedList();
			while (rs.next()) {
				Column aCol = new Column();
				aCol.sqlTypeName = rs.getString(6);
				aCol.defalutValue = rs.getString(13);
				aCol.name = rs.getString(4);
				aCol.sqlType = rs.getShort(5);
				aCol.sqlColumnLength = rs.getInt(7);
				aCol.sqlDecimalLength = rs.getInt(9);
				String remarks = null;
					
					remarks = rs.getString(12);
				if (remarks == null) {
					remarks = "";
				}
				int remarksLen = remarks.lastIndexOf("@");
				String temp[], tempRemarks = "";
				if (remarksLen > 0) {
					temp = remarks.split("@");
					if (temp.length > 2) {
						aCol.extType = temp[0];
						tempRemarks = temp[1];
						aCol.objectOrNot = "1";
					} else {
						aCol.extType = temp[0];
						aCol.objectOrNot = "0";
					}
				} else {
					remarksLen = -1;
					aCol.objectOrNot = "0";
					aCol.extType = "undefined";
				}
				String searchRemarks = remarks.substring(remarksLen + 1);
				int searchRemarksLen = remarks.lastIndexOf("#");
				if (searchRemarksLen > 0) {
					aCol.remarks = remarks.substring(remarksLen + 1, searchRemarksLen);
					aCol.searchOrNot = "1";
				} else {
					aCol.remarks = remarks.substring(remarksLen + 1);
					aCol.searchOrNot = "0";
				}
				aCol.sqlNotNull = ("NO".equals(rs.getString(18)));
				aCol.javaType = getJavaType(aCol.sqlType, aCol.sqlColumnLength, aCol.sqlDecimalLength, tempRemarks);
				aCol.jdbcType = getJdbcType(aCol.sqlType, aCol.sqlColumnLength, aCol.sqlDecimalLength, tempRemarks);
				columns.add(aCol);
				// }
			}
			return columns;
		} finally {
			if (rs != null)
				rs.close();
		}

	}

	public static String getJdbcType(int sqlType, int columnSize, int decimalDigits, String tempRemarks) {
		String rv = "VARCHAR";
		if (tempRemarks != "") {
			rv = tempRemarks;
		} else {
			if (sqlType == Types.CHAR) {
				rv = "CHAR";
			} else if (sqlType == Types.VARCHAR) {
				rv = "VARCHAR";
			} else if (sqlType == Types.FLOAT || sqlType == Types.REAL || sqlType == Types.INTEGER
					|| sqlType == Types.DOUBLE || sqlType == Types.SMALLINT || sqlType == Types.NUMERIC
					|| sqlType == Types.DECIMAL || sqlType == Types.BIGINT ||sqlType == Types.BIT) {
				rv = "DECIMAL";
			} else if (sqlType == Types.DATE ||sqlType == Types.TIMESTAMP || sqlType == Types.TIME) {
				rv = "TIME";
			} 
		}
		return rv;
	}

	public static String getJavaType(int sqlType, int columnSize, int decimalDigits, String tempRemarks) {
		String rv = "String";
		if (tempRemarks != "") {
			rv = tempRemarks;
		} else {
			if (sqlType == Types.CHAR || sqlType == Types.VARCHAR) {
				rv = "String";
			} else if (sqlType == Types.FLOAT || sqlType == Types.REAL) {
				rv = "Float";
			} else if (sqlType == Types.INTEGER) {
				rv = "Integer";
			} else if (sqlType == Types.DOUBLE) {
				rv = "Double";
			} else if (sqlType == Types.DATE) {
				rv = "Date";
			} else if (sqlType == Types.TIMESTAMP) {
				rv = "Date";
			} else if (sqlType == Types.TIME) {
				rv = "Date";
			} else if (sqlType == Types.SMALLINT) {
				rv = "Short";
			} else if (sqlType == Types.BIT) {
				// rv = Byte.class;
				rv = "Integer";
			} else if (sqlType == Types.BIGINT) {
				rv = "Long";
			} else if (sqlType == Types.NUMERIC || sqlType == Types.DECIMAL) {
				if (decimalDigits == 0) {
					if (columnSize == 1) {
						// rv = Byte.class;
						rv = "Integer";
					} else if (columnSize < 5) {
						rv = "Short";
					} else if (columnSize < 10) {
						rv = "Integer";
					} else {
						rv = "Long";
					}
				} else {
					if (columnSize < 9) {
						rv = "Float";
					} else {
						rv = "Double";
					}
				}
			}
		}
		return rv;
	}

	public static void main(String[] args) {
		JDBCUtil util = new JDBCUtil();
		try {
			Connection c = util.getConn();
			List cat = JDBCUtil.getCatalogs(c);
			System.out.println(cat);
			Map sch = JDBCUtil.getSchemas(c);
			System.out.println(sch);
			List data = JDBCUtil.getTableColumns(c, null, "LXJJ", "TB_XT_YHXX");
			System.out.println(data);
			for (int i = 0; i < data.size(); i++) {
				Column col = (Column) data.get(i);
				System.out.println(col.getName() + ":" + col.getJavaName() + ":" + col.getSqlTypeName() + ":"
						+ col.getJavaType() + ":" + col.getSqlColumnLength() + ":" + col.getExtType() + ":"
						+ col.getSearchOrNot() + ":" + col.getRemarks());
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
