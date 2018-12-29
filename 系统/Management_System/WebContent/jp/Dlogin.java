package jp;

import java.sql.*;


import com.mysql.jdbc.Connection;

public class Dlogin {
	private Connection conn;
	private String driver;
	private String url;
	private String username;
	private String password;
	public Dlogin() {
		
	}
	public Dlogin(String driver,String url,
			String username,String password) {
		this.driver="com.mysql.jdbc.Driver";
		this.password=password;
		this.url=url;
		this.username=username;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
//	获取数据库连接
	public Connection getConnection() throws Exception
	{
		if(conn==null) {
			Class.forName("com.mysql.jdbc.Driver");//"com.mysql.jdbc.Driver"
			conn=(Connection) DriverManager.getConnection(url,username,password);
			
		}
		return conn;
	}
	public boolean insert(String sql,Object...args) throws Exception{
//	Object ...objects这样的参数形式，允许一切继承自Object的对象作为参数。这种方法在实际中应该还是比较少用的
		PreparedStatement pstmt =getConnection().prepareStatement(sql);
		for(int i=0;i<args.length;i++) {
			pstmt.setObject(i+1, args[i]);
		}
		if(pstmt.executeUpdate()!= 1) {
			return false;
		}
		return true;
	}
	public boolean delete(String sql,Object...args) throws Exception{
//		Object ...objects这样的参数形式，允许一切继承自Object的对象作为参数。这种方法在实际中应该还是比较少用的
			PreparedStatement pstmt =getConnection().prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				pstmt.setObject(i+1, args[i]);
			}
			if(pstmt.executeUpdate()!= 1) {
				return false;
			}
			return true;
	}
	public ResultSet query(String sql,Object...args) throws Exception{
//		Object ...objects这样的参数形式，允许一切继承自Object的对象作为参数。这种方法在实际中应该还是比较少用的
			PreparedStatement pstmt =getConnection().prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				pstmt.setObject(i+1, args[i]);
			}
			return pstmt.executeQuery();
	}
	public void modify(String sql,Object...args) throws Exception{
//		Object ...objects这样的参数形式，允许一切继承自Object的对象作为参数。这种方法在实际中应该还是比较少用的
			PreparedStatement pstmt =getConnection().prepareStatement(sql);
			for(int i=0;i<args.length;i++) {
				pstmt.setObject(i+1, args[i]);
			}
			pstmt.executeUpdate();
			pstmt.close();
	}
	public void closeConn() throws Exception{
		if(conn!=null&&!conn.isClosed()) {
			conn.close();
		}
	}
}
