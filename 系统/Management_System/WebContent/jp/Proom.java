package jp;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import edu.fudan.nlp.tag.CWSTagger;
@WebServlet(name="Proom",urlPatterns= {"/proom"})
public class Proom extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,java.io.IOException
			{	
				
				String err="";
//				Servlet本身并不输出响应到客户端，因此必须将请求转发到视图页面
				RequestDispatcher rd;
//				从客户端请求获得参数
				request.setCharacterEncoding("UTF-8");
				response.setContentType("text/html;charset=UTF-8");
				response.setCharacterEncoding("UTF-8");
				
				String vipid1=request.getParameter("vipid");
				String action=request.getParameter("action");
				int vipid=Integer.parseInt(vipid1);
				Dlogin dd=new Dlogin("com.mysql.jdbc.Driver",
						  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
				if(action.equals("search")) {
					String ptime=request.getParameter("ptime");
					try {
						ResultSet rs=dd.query("select room.roomid,name from room where room.roomid not in(select preroom.roomid from preroom where predate=\""+ptime+"\")");
						request.setAttribute("result", rs);
						
					} catch (Exception e) {
						err="输入不规范，请重新输入";
						
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
					request.setAttribute("username", vipid);
					request.setAttribute("ptime", ptime);
					System.out.println(ptime);
					rd =request.getRequestDispatcher("/preroom.jsp");
					rd.forward(request, response);
					}
				}
				else if(action.equals("proom")) {
					String roomid=request.getParameter("roomid");
					String predate=request.getParameter("predate");
					try {
						
						dd.insert("insert into preroom(roomid,vipid,predate) values(?,?,?)", roomid,vipid,predate);
					} catch (Exception e) {
						err="操作错误，请重新输入";
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
					request.setAttribute("username", vipid);
					rd =request.getRequestDispatcher("/preroom.jsp");
					rd.forward(request, response);
				}
				}else if(action.equals("celpre")){
					String predate=request.getParameter("predate");
					String roomid=request.getParameter("roomid");
					try {
						dd.delete("delete from preroom where predate=? and roomid=?",predate,roomid);
						System.out.println("dcews");
					} catch (Exception e) {
						err="操作错误，请重试";
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						request.setAttribute("username", vipid);
						System.out.println("wd2ef");
						rd =request.getRequestDispatcher("/precord.jsp");
						rd.forward(request, response);
					}
				}
				else {
					request.setAttribute("err",err);
					
				}
//				try {
//					System.out.println(roomid);
//					Dlogin dd=new Dlogin("com.mysql.jdbc.Driver",
//					  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
//					ResultSet rs=dd.query("select predate,roomid from preroom");
//					while(rs.next()) {
//						if(rs.getString("predate").equals(predate)&&rs.getString("roomid").equals(roomid)) {
//							err="此房间此日已被预订，请更换预订房间或日期";
//							rd =request.getRequestDispatcher("/proom.jsp");
//							request.setAttribute("err", err);
//							request.setAttribute("username", vipid);
//							rd.forward(request, response);
//						}
//					}
//					dd.insert("insert into preroom(roomid,vipid,predate) values(?,?,?)", roomid,vipid,predate);
//					request.setAttribute("username", vipid);
//					rd =request.getRequestDispatcher("/proom.jsp");
//					rd.forward(request, response);
//						
//				}
//				catch(Exception e) {
//					e.printStackTrace();
//				}
//				
			}
		}


