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
import javax.servlet.http.HttpSession;
@WebServlet(name="Vipservlet",urlPatterns= {"/vip"})
public class Vipservlet extends HttpServlet{
	Dlogin dd;
	public Vipservlet() {
		dd=new Dlogin("com.mysql.jdbc.Driver",
				  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
       
        String action=request.getParameter("action");
        String vipid=request.getParameter("vipid");
        String myid=request.getParameter("myid");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String phone=request.getParameter("phone");
        String vippassword=request.getParameter("vippassword");
         if(action.equals("delete")) {
        	try {
        		deleteroom(vipid);
        		
        		out.println("删除成功");
        	}catch(Exception e) {
        		out.println("删除失败");
        	}
        }else if(action.equals("select")) {
        	selectroom(vipid);
        }
        else if(action.equals("set")) {
        	setroom(vipid);
        }
        else if(action.equals("update")) {
        	System.out.println("12");
        	updatevip(vipid,name,phone,vippassword);
        	RequestDispatcher rd;
        	System.out.println("13");
        	request.setAttribute("username",vipid);
        	System.out.println("14");
	    	rd =request.getRequestDispatcher("/vipset.jsp");
			rd.forward(request, response);
        }
       else {
        	
        	try {
				createvip(vipid,name,sex,phone,vippassword,myid);
				RequestDispatcher rd;
		    	rd =request.getRequestDispatcher("/newvip.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//显示界面直接写，其余删除新建用servlet，VIP用servlet
        }
        
        

    }

    private void setroom(String vipid) {
		// TODO Auto-generated method stub
		
	}
	
	private void createvip(String vipid,String name,String sex,String phone,String vippassword,String myid) throws Exception {
    	dd.insert("insert into vip (vipid,name,sex,phone,vippassword,myid) values (?,?,?,?,?,?)",vipid,name,sex,phone,vippassword,myid);
    	
    	// TODO Auto-generated method stub
		
	}
	private void updatevip(String vipid,String name,String phone,String vippassword) {
		// TODO Auto-generated method stub
		try {
			dd.modify("UPDATE vip SET name = ?,phone=?,vippassword=? where vipid=?",name,phone,vippassword,vipid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void selectroom(String vipid) {
		try {
			dd.query("select * from hotelmn.vip"+" where vipid =?",vipid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
	private ResultSet getCustomer(String vipid) {
		// TODO Auto-generated method stub
		return null;
	}
	private void deleteroom(String vipid) {
		try {
			dd.delete("delete from vip  where vipid =?", vipid );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		
//		HttpSession session =request.getSession(true);
////		获取session属性，跟踪用户会话状态
//		session.setAttribute("username", username);
////		rd =request.getRequestDispatcher("/index.jsp");
//		rd =request.getRequestDispatcher("/VIPindex.jsp");
//		rd.forward(request, response);
        this.doGet(request, response);

    }
	
}
