package com.dhcc.common.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.dbutils.DbUtils;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.MapHandler;
import org.apache.commons.dbutils.handlers.MapListHandler;
import org.apache.log4j.Logger;



public class BaseDao {
	// 日志对象

	private static final Logger  log = Logger.getLogger(BaseDao.class);

	
	public BaseDao() {
	}


	// 建立数据库访问Connection,这里不能使用链接池，不然后面会缺信息
	public Connection getConn() {
		Connection conn = null;
		String oracleDriverName = "oracle.jdbc.driver.OracleDriver"; 
		String oracleUrlToConnect = "jdbc:oracle:thin:@172.30.70.234:1521:cmes"; 
		String user ="cmes";
		String pwd ="cmes";
		try {
			Class.forName(oracleDriverName); 
			conn = DriverManager.getConnection(oracleUrlToConnect, 
					user, pwd);
		    ((oracle.jdbc.driver.OracleConnection)conn).setRemarksReporting(true); 
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		return conn;
	}

	/**
	 * 查找多个对象,以Bean的形式返回,注意:<br>
	 * (1)其执行效率低于listMap,<br>
	 * (2)要求表的字段和Bean中对应的属性名称应该一致，如不一致，<br>
	 * 在sqlString中该字段应使用属性名称作为别名使得二者保持一致
	 * 
	 * @param sqlString
	 * @param clazz
	 * @return
	 */
	public List queryObj(String sqlString, Class clazz) {
		List beans = null;
		Connection conn = null;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			log.info(sqlString);
			beans = (List) qRunner.query(conn, sqlString, new BeanListHandler(
					clazz));
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return beans;
	}

	/**
	 * 查找多个对象,每个对象以List的形式返回
	 * 
	 * @param sqlString
	 * @boolean isHeader 返回的数据是否带有标题,为True时,返回的List的容量要比实际的记录条数大一。
	 * 
	 * @return
	 */
	public List queryList(String sqlString, boolean isHeader) {
		ArrayList data = new ArrayList();
		ArrayList title = new ArrayList();

		Connection conn = this.getConn();

		if (conn == null) {
			log.error("取数据库链接失败");
			return new ArrayList();
		}
		// 在后台打印该SQL语句
		log.info("SQl:" + sqlString);
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlString);
			// 取得列名,
			ResultSetMetaData rsmd = rs.getMetaData();
			int numCols = rsmd.getColumnCount();
			for (int i = 1; i <= numCols; i++) {
				String columnName = rsmd.getColumnName(i);
				title.add(columnName);
			}
			if (isHeader) {
				data.add(title);
			}
			// 填充数据
			while (rs.next()) {
				ArrayList row = new ArrayList();
				for (int i = 1; i <= numCols; i++) {
					String value = rs.getString(i);
					if (value == null) {
						value = "";
					}
					value = value.trim();
					row.add(value);
				}
				data.add(row);
			}

		} catch (SQLException e) {
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn, stmt, rs);
		}

		return data;
	}

	/**
	 * 查找多个对象,每个对象以Map的形式返回
	 * 
	 * @param sqlString
	 * @return
	 */
	public List queryMap(String sqlString) {
		List data = null;
		Connection conn = null;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			log.info(sqlString);
			data = (List) qRunner.query(conn, sqlString, new MapListHandler());
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return data;
	}

	/**
	 * 查找单个对象,以Bean的形式返回注意:<br>
	 * 要求表的字段和Bean中对应的属性名称应该一致，如不一致，在sqlString中该字段应使用属性名称作为别名使得二者保持一致
	 * 
	 * @param sqlString
	 * @param clazz
	 * @return
	 */
	public Object loadObj(String sqlString, Class clazz) {
		Object obj = null;
		Connection conn = null;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			log.info(sqlString);
			obj = qRunner.query(conn, sqlString, new BeanHandler(clazz));
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return obj;
	}

	/**
	 * 查找单个对象,以Map的形式返回
	 * 
	 * @param sqlString
	 * @return
	 */
	public Map loadMap(String sqlString) {
		Map map = null;
		Connection conn = null;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			log.info(sqlString);
			map = (Map) qRunner.query(conn, sqlString, new MapHandler());
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return map;
	}

	/**
	 * 执行更新的sql语句,插入,修改,删除
	 * 
	 * @param sqlString
	 * @return
	 */
	public boolean update(String sqlString) {
		Connection conn = null;
		boolean flag = false;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			// log.info(sqlString);
			int i = qRunner.update(conn, sqlString);
			if (i > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return flag;
	}

	/**
	 * 执行更新的sql语句,插入,修改,删除,使用了prepareStatement来提高效率
	 * 
	 * @param sqlString
	 *            预编译Sql
	 * @param params
	 *            该Sql对应的参数值
	 * @return
	 */
	public boolean update(String sqlString, Object[] params) {
		Connection conn = null;
		boolean flag = false;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			// log.info(sqlString);
			int i = qRunner.update(conn, sqlString, params);
			if (i > 0) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return flag;
	}

	/**
	 * 执行批量更新的sql语句,插入,修改,删除
	 * 
	 * @param sqlString
	 * @return
	 */
	public boolean batch(String sql, Object[][] params) {
		Connection conn = null;
		boolean flag = false;
		try {
			conn = getConn();
			QueryRunner qRunner = new QueryRunner();
			int i[] = qRunner.batch(conn, sql, params);
			flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn);
		}
		return flag;
	}

	public boolean executeUpdateBatch(String[] sqls) {
		boolean flag = false;
		Connection conn = null;
		Statement stmt = null;

		String sql = "";
		conn = this.getConn();
		if (conn == null) {
			log.error("取数据库链接失败");
			return false;
		}
		try {
			conn.setAutoCommit(false);
			stmt = conn.createStatement();
			for (int i = 0; i < sqls.length; i++) {
				sql = sqls[i];
				// log.info("sql:" + sql);
				stmt.executeUpdate(sql);
			}
			conn.commit();
			flag = true;
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				log.error("回滚事务时失败:" + e1.toString());
				e1.printStackTrace();
			}
			flag = false;
			log.error("在执行到SQL语句发生了错误:" + e.toString() + "\r\n事物已回滚,,对应的sql为:"
					+ sql);
			e.printStackTrace();
		}

		// 关闭链接
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			log.error("关闭数据库链接时失败:" + e.toString());
			e.printStackTrace();
		}

		return flag;
	}

	/**
	 * 取出指定表指定列的最大值+1返回
	 * 
	 * @param sTblName
	 *            The Table Name
	 * @param sFldName
	 *            The Field Name
	 * @return Maximum Id
	 */
	public int getNextId(String sTableName, String sFieldName) {
		int iRes = 1;
		String sql = "SELECT MAX(" + sFieldName + ") AS maxid FROM "
				+ sTableName;
		Map result = loadMap(sql);
		if (result.get("maxid") != null) {
			iRes = Integer.parseInt(result.get("maxid").toString()) + 1;
		}
		return iRes;
	}

	/**
	 * 该函数用来执行分页查询,返回的map其内容有：<br>
	 * totalRow int z总记录数<br>
	 * totalPage int 总页数<br>
	 * curPage int 当前页<br>
	 * pageSize int 每页的记录数<br>
	 * header List 表头<br>
	 * data List 数据<br>
	 * 
	 * @return map
	 */
	public Map queryPageList(String sql, int curPage, int pageSize) {
		Map map = new HashMap();
		ArrayList data = new ArrayList(); // 数据
		ArrayList header = new ArrayList(); // 表头
		int totalRow = 0; // 总记录条数
		int totalPage = 0; // 总页数

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// 计算分页的起始行数
			if (curPage < 1) {
				curPage = 1;
			}
			if (pageSize < 1) {
				pageSize = 15; // 默认的每页纪录条数为15
			}

			conn = this.getConn();
			stmt = conn.createStatement();
			if (conn == null) {
				log.error("取数据库链接失败");
			}

			// 取出总的纪录条数
			log.debug("sql:" + sql);
			String totalSql = "select count(*) from (" + sql + ") as temps";
			rs = stmt.executeQuery(totalSql);
			while (rs.next()) {
				totalRow = rs.getInt(1);
			}

			// 计算总页数
			if (totalRow % pageSize == 0) {
				totalPage = totalRow / pageSize;
			} else {
				totalPage = totalRow / pageSize + 1;
			}
			if (curPage > totalPage) {
				curPage = totalPage;
				if (curPage <= 0) {
					curPage = 1;
				}
			}

			int begin = (curPage - 1) * pageSize + 1;
			int end = curPage * pageSize;
			String pageSql = this.getLimitSql(sql, begin, end);
			log.debug("开始执行jdbcPageQuery查询语句，pSQL语句为：" + pageSql + ",curPage:"
					+ curPage + ",pageSize:" + pageSize);
			rs = stmt.executeQuery(pageSql);
			// 判断查询结果是否出错。
			if (rs != null) {
				// 获取查询结果集的元数据
				ResultSetMetaData rsmd = rs.getMetaData();
				// 列查询的头信息
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					header.add(rsmd.getColumnName(i));
				}
				int count = 0;
				while (rs.next()) {
					// 如果取出的结果大于1000条记录，则后续的记录将被丢去。
					if (count > 1000) {
						break;
					}
					List row = new ArrayList();
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						String value = rs.getString(i);
						// 把NULL转换为空串
						if (value == null || value.length() == 0
								|| value.equalsIgnoreCase("null")) {
							value = "";
						}
						row.add(value);
					}
					data.add(row);
					count++;
				}

			}
		} catch (SQLException e) {
			log.error(e.toString());
		} finally {
			DbUtils.closeQuietly(conn, stmt, rs);
		}

		// 将结果放到返回结果中
		map.put("totalRow", new Integer(totalRow));
		map.put("totalPage", new Integer(totalPage));
		map.put("curPage", new Integer(curPage));
		map.put("pageSize", new Integer(pageSize));
		map.put("header", header);
		map.put("data", data);
		return map;
	}

	/**
	 * 
	 */
	private String getLimitSql(String query_SQL, int begin, int end) {
		// For Orcale
		// return "select * from ( select row_.*, rownum rownum_ from ( "
		// + query_SQL + " ) row_ " + "where rownum =< " + end
		// + ") where rownum_ >= " + begin;
		// For DB2
		return "SELECT * FROM (	SELECT rownumber() over() AS row_, temp_.* FROM ( "
				+ query_SQL
				+ ") AS temp_ ) tmp_  WHERE row_ BETWEEN "
				+ begin
				+ " AND " + end;
	}

	public static void main(String[] agrs) {
		BaseDao db = new BaseDao();
		String sql = "select * from T_PUB_PROD_DESIGN";
		Map data = db.queryPageList(sql, 2, 15);
		System.out.println("总记录数：" + data.get("totalRow"));
		System.out.println("总页数：" + data.get("totalPage"));
		System.out.println("当前页：" + data.get("curPage"));
		System.out.println("每页记录数：" + data.get("pageSize"));
		System.out.println("表头：" + data.get("header"));
		System.out.println("数据：" + data.get("data"));
	}

}
