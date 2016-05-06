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
	// ��־����

	private static final Logger  log = Logger.getLogger(BaseDao.class);

	
	public BaseDao() {
	}


	// �������ݿ����Connection,���ﲻ��ʹ�����ӳأ���Ȼ�����ȱ��Ϣ
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
	 * ���Ҷ������,��Bean����ʽ����,ע��:<br>
	 * (1)��ִ��Ч�ʵ���listMap,<br>
	 * (2)Ҫ�����ֶκ�Bean�ж�Ӧ����������Ӧ��һ�£��粻һ�£�<br>
	 * ��sqlString�и��ֶ�Ӧʹ������������Ϊ����ʹ�ö��߱���һ��
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
	 * ���Ҷ������,ÿ��������List����ʽ����
	 * 
	 * @param sqlString
	 * @boolean isHeader ���ص������Ƿ���б���,ΪTrueʱ,���ص�List������Ҫ��ʵ�ʵļ�¼������һ��
	 * 
	 * @return
	 */
	public List queryList(String sqlString, boolean isHeader) {
		ArrayList data = new ArrayList();
		ArrayList title = new ArrayList();

		Connection conn = this.getConn();

		if (conn == null) {
			log.error("ȡ���ݿ�����ʧ��");
			return new ArrayList();
		}
		// �ں�̨��ӡ��SQL���
		log.info("SQl:" + sqlString);
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlString);
			// ȡ������,
			ResultSetMetaData rsmd = rs.getMetaData();
			int numCols = rsmd.getColumnCount();
			for (int i = 1; i <= numCols; i++) {
				String columnName = rsmd.getColumnName(i);
				title.add(columnName);
			}
			if (isHeader) {
				data.add(title);
			}
			// �������
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
	 * ���Ҷ������,ÿ��������Map����ʽ����
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
	 * ���ҵ�������,��Bean����ʽ����ע��:<br>
	 * Ҫ�����ֶκ�Bean�ж�Ӧ����������Ӧ��һ�£��粻һ�£���sqlString�и��ֶ�Ӧʹ������������Ϊ����ʹ�ö��߱���һ��
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
	 * ���ҵ�������,��Map����ʽ����
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
	 * ִ�и��µ�sql���,����,�޸�,ɾ��
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
	 * ִ�и��µ�sql���,����,�޸�,ɾ��,ʹ����prepareStatement�����Ч��
	 * 
	 * @param sqlString
	 *            Ԥ����Sql
	 * @param params
	 *            ��Sql��Ӧ�Ĳ���ֵ
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
	 * ִ���������µ�sql���,����,�޸�,ɾ��
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
			log.error("ȡ���ݿ�����ʧ��");
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
				log.error("�ع�����ʱʧ��:" + e1.toString());
				e1.printStackTrace();
			}
			flag = false;
			log.error("��ִ�е�SQL��䷢���˴���:" + e.toString() + "\r\n�����ѻع�,,��Ӧ��sqlΪ:"
					+ sql);
			e.printStackTrace();
		}

		// �ر�����
		try {
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			log.error("�ر����ݿ�����ʱʧ��:" + e.toString());
			e.printStackTrace();
		}

		return flag;
	}

	/**
	 * ȡ��ָ����ָ���е����ֵ+1����
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
	 * �ú�������ִ�з�ҳ��ѯ,���ص�map�������У�<br>
	 * totalRow int z�ܼ�¼��<br>
	 * totalPage int ��ҳ��<br>
	 * curPage int ��ǰҳ<br>
	 * pageSize int ÿҳ�ļ�¼��<br>
	 * header List ��ͷ<br>
	 * data List ����<br>
	 * 
	 * @return map
	 */
	public Map queryPageList(String sql, int curPage, int pageSize) {
		Map map = new HashMap();
		ArrayList data = new ArrayList(); // ����
		ArrayList header = new ArrayList(); // ��ͷ
		int totalRow = 0; // �ܼ�¼����
		int totalPage = 0; // ��ҳ��

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			// �����ҳ����ʼ����
			if (curPage < 1) {
				curPage = 1;
			}
			if (pageSize < 1) {
				pageSize = 15; // Ĭ�ϵ�ÿҳ��¼����Ϊ15
			}

			conn = this.getConn();
			stmt = conn.createStatement();
			if (conn == null) {
				log.error("ȡ���ݿ�����ʧ��");
			}

			// ȡ���ܵļ�¼����
			log.debug("sql:" + sql);
			String totalSql = "select count(*) from (" + sql + ") as temps";
			rs = stmt.executeQuery(totalSql);
			while (rs.next()) {
				totalRow = rs.getInt(1);
			}

			// ������ҳ��
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
			log.debug("��ʼִ��jdbcPageQuery��ѯ��䣬pSQL���Ϊ��" + pageSql + ",curPage:"
					+ curPage + ",pageSize:" + pageSize);
			rs = stmt.executeQuery(pageSql);
			// �жϲ�ѯ����Ƿ����
			if (rs != null) {
				// ��ȡ��ѯ�������Ԫ����
				ResultSetMetaData rsmd = rs.getMetaData();
				// �в�ѯ��ͷ��Ϣ
				for (int i = 1; i <= rsmd.getColumnCount(); i++) {
					header.add(rsmd.getColumnName(i));
				}
				int count = 0;
				while (rs.next()) {
					// ���ȡ���Ľ������1000����¼��������ļ�¼������ȥ��
					if (count > 1000) {
						break;
					}
					List row = new ArrayList();
					for (int i = 1; i <= rsmd.getColumnCount(); i++) {
						String value = rs.getString(i);
						// ��NULLת��Ϊ�մ�
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

		// ������ŵ����ؽ����
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
		System.out.println("�ܼ�¼����" + data.get("totalRow"));
		System.out.println("��ҳ����" + data.get("totalPage"));
		System.out.println("��ǰҳ��" + data.get("curPage"));
		System.out.println("ÿҳ��¼����" + data.get("pageSize"));
		System.out.println("��ͷ��" + data.get("header"));
		System.out.println("���ݣ�" + data.get("data"));
	}

}
