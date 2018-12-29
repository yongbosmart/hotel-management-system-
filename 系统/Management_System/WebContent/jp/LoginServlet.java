package jp;
import com.mysql.jdbc.Connection;

import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet(name="LoginServlet",urlPatterns= {"/login"})
public class LoginServlet extends HttpServlet {
	public void service(HttpServletRequest request,HttpServletResponse response) 
	throws ServletException,java.io.IOException
	{	
		
		String errMsg="";
//		Servlet本身并不输出响应到客户端，因此必须将请求转发到视图页面
		RequestDispatcher rd;
//		从客户端请求获得参数
		String username=request.getParameter("username");
		System.out.println(username);
		String password=request.getParameter("password");
		String[] choice=request.getParameterValues("chname");
		String choicel="";
		for(int i=0;i<choice.length;i++) {
			choicel=choice[i]+"";
		}
		String ps=choicel+"password";
		String id=choicel+"id";
		System.out.println("a"+choicel+"sw");
		try {
			System.out.println(username);
			Dlogin dd=new Dlogin("com.mysql.jdbc.Driver",
			  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
			ResultSet rs=dd.query("select "+ps+" from "+choicel+" where "+id+" =?",Integer.parseInt(username));
			if(rs.next()) {
//				用户名和密码匹配
				if(rs.getString(ps).equals(password)) {
//					获取session对象
					HttpSession session =request.getSession(true);
//					获取session属性，跟踪用户会话状态
					session.setAttribute("username", username);
//					rd =request.getRequestDispatcher("/index.jsp");
//					获取转发对象
					if(choicel.equals("employee")) {
						rd =request.getRequestDispatcher("/newroom.jsp");
					}
					else{
						rd =request.getRequestDispatcher("/VIPindex.jsp");
					}
//					转发请求
					rd.forward(request, response);
				}
				else {
//					用户名和密码不匹配时
					errMsg+="您的用户名密码不符合，请重新输入";
				}
			}
			else {
//				用户名不存在时
				errMsg+="您的用户名不存在，请先注册";
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		if(errMsg!=null&&!errMsg.equals("")) {
			rd=request.getRequestDispatcher("/login.jsp");
			request.setAttribute("err", errMsg);
			rd.forward(request, response);
		}
	}
}
