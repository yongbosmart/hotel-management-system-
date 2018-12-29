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
@WebServlet(name="Nroomservlet",urlPatterns= {"/nroom"})
public class Nroomservlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,java.io.IOException
			{	
			String err="";
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			response.setCharacterEncoding("UTF-8");
			String action=request.getParameter("action");
			String roomid=request.getParameter("roomid");
//				Servlet本身并不输出响应到客户端，因此必须将请求转发到视图页面
			RequestDispatcher rd;
			Dlogin dd=new Dlogin("com.mysql.jdbc.Driver",
						  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
//				从客户端请求获得参数
			
			if(action.equals("sub")) {
				
				String customerid=request.getParameter("customerid");
				String age=request.getParameter("age");
				String name=request.getParameter("name");
				String phone=request.getParameter("phone");
				String sex=request.getParameter("sex");
				String ndate=request.getParameter("ndate");
				System.out.println(customerid+age+sex+name+phone);
				
				try {
					System.out.println(roomid);
//					ResultSet rs=dd.query("select predate from preroom where roomid=?",roomid);
//					if(rs!=null) {
//					rs.next();
//					if(rs.getString("predate").equals(ndate)) {
//						err="此房间此日已被预订，请更换预订房间或日期";
//						rd =request.getRequestDispatcher("/nnewroom.jsp");
//						request.setAttribute("err", err);
////						request.setAttribute("username", vipid);
//						rd.forward(request, response);
//					}
//					}
					dd.insert("insert into newroom (roomid,ndate,customerid,age,sex,name,phone) values (?,?,?,?,?,?,?)",roomid,ndate,customerid,age,sex,name,phone);
					
					rd =request.getRequestDispatcher("/nnewroom.jsp");
					rd.forward(request, response);
						
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				}
			else {
					try {
						System.out.println("lala");
						dd.modify("update room set state=\"满\" where roomid =?",roomid);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					rd =request.getRequestDispatcher("/newroom.jsp");
					rd.forward(request, response);
				}
				
			}
		}


