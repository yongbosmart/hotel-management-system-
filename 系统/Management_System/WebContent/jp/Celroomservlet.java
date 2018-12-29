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
@WebServlet(name="Celroomservlet",urlPatterns= {"/celroom"})
public class Celroomservlet extends HttpServlet{
	public void service(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException,java.io.IOException
			{	
				
				String errMsg="";
//				Servlet本身并不输出响应到客户端，因此必须将请求转发到视图页面
				RequestDispatcher rd;
//				从客户端请求获得参数
				String roomid=request.getParameter("roomid");
				try {
					System.out.println(roomid);
					Dlogin dd=new Dlogin("com.mysql.jdbc.Driver",
					  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
					ResultSet rs=dd.query("select state from room where roomid=?", roomid);
					
					rs.next();
					if(rs.getString("state").equals("满")) {
						dd.modify("update room set state=\"空\" where roomid=?", roomid);
					}
					else {
						dd.modify("update room set state=\"满\" where roomid=?", roomid);	
					}
					dd.insert("insert into celroom (roomid,ndate) values (?,curdate())", Integer.parseInt(roomid));
					
					rd =request.getRequestDispatcher("/newroom.jsp");
					rd.forward(request, response);
						
				}
				catch(Exception e) {
					e.printStackTrace();
				}
				
			}
		}

