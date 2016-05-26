package bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBConn;

public class SelectBean {
	
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	/**
	 * 
	 * @param sql
	 * @param args
	 * @return ArrayList
	 * @��ȡ������Ϣ
	 */
	public ArrayList select(String sql,String[] args){
		ArrayList al = new ArrayList();
		conn = DBConn.getConn();
		try {
			st = conn.createStatement();
			System.out.println("sql="+sql);
			rs = st.executeQuery(sql);
			while(rs.next()){
				ArrayList alRow = new ArrayList();
				for(int i = 0;i < args.length;i++){
					alRow.add(rs.getString(args[i]));
				}
				al.add(alRow);
				//System.out.println(al);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			DBConn.close(conn,st,rs);
		}
		return al;
	}

	/**
	 * 
	 * @param sql
	 * @param args
	 * @return ArrayList
	 * @��ȡһ����Ϣ
	 */
	public ArrayList selectRow(String[] args,String sql){
		ArrayList al = new ArrayList();
		conn = DBConn.getConn();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			rs.next();
			for(int i = 0;i < args.length;i++){
				al.add(rs.getString(args[i]));
			}
		} catch (SQLException e) {
			// TODO �Զ���� catch ��
		} finally{
			DBConn.close(conn,st,rs);
		}
		return al;
	}
	
	/**
	 * 
	 * @param sql
	 * @param args
	 * @return ArrayList
	 * @��ȡһ����Ϣ
	 */
	public ArrayList selectRow(String sql,String[] args){
		ArrayList al = new ArrayList();
		conn = DBConn.getConn();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				for(int i = 0;i < args.length;i++){
					al.add(rs.getString(args[i]));
				}
			}
		} catch (SQLException e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
		} finally{
			DBConn.close(conn,st,rs);
		}
		return al;
	}
	/**
	 * 
	 * @param sql
	 * @param args
	 * @return ArrayList
	 * @��ȡ��ҳ��Ϣ
	 */
	public ArrayList selectPage(String sql,String[] args,int showRow,int itemSum){
		ArrayList al = new ArrayList();
		conn = DBConn.getConn();
		try {
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			for(int i = 0;i < itemSum;i++){
				rs.next();
			}
			for(int n = 0;n < showRow;n++){
				rs.next();
				ArrayList alRow = new ArrayList();
				for(int i = 0;i < args.length;i++){
					alRow.add(rs.getString(args[i]));
				}
				al.add(alRow);
			}
		} catch (SQLException e) {
			// TODO �Զ���� catch ��
			e.printStackTrace();
		} finally{
			DBConn.close(conn,st,rs);
		}
		return al;
	}
}
