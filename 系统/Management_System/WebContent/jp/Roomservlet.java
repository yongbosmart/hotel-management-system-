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
@WebServlet(name="Roomservlet",urlPatterns= {"/room"})
public class Roomservlet extends HttpServlet{
	Dlogin dd;
	public Roomservlet() {
		dd=new Dlogin("com.mysql.jdbc.Driver",
				  "jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        String price=request.getParameter("price");
        String name=request.getParameter("name");
        System.out.println(name);
        String action=request.getParameter("action");
        String roomid=request.getParameter("roomid");
        System.out.println(action);
        System.out.println(roomid);
         if(action.equals("delete")) {
        	try {
        		deleteroom(roomid);
        		RequestDispatcher rd;
		    	rd =request.getRequestDispatcher("/roomsetting.jsp");
				rd.forward(request, response);
        		out.println("删除成功");
        	}catch(Exception e) {
        		out.println("删除失败");
        	}
        }else if(action.equals("select")) {
        	selectroom(roomid);
        }
        else if(action.equals("set")) {
        	setroom(roomid);
        }
        else if(action.equals("update")) {
        	updateroom(roomid,name,price);
        	RequestDispatcher rd;
	    	rd =request.getRequestDispatcher("/roomsetting.jsp");
			rd.forward(request, response);
        }
        else if(action.equals("price")) {
        	priceroom(price,roomid);
        }
        else {
        	try {
				createroom(roomid,Double.parseDouble(price),name);
				RequestDispatcher rd;
		    	rd =request.getRequestDispatcher("/roomsetting.jsp");
				rd.forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//显示界面直接写，其余删除新建用servlet，VIP用servlet
        }
        
        

    }

    private void setroom(String roomid) {
		// TODO Auto-generated method stub
		
	}
	private void priceroom(String price, String roomid) {
    	try {
			dd.modify("UPDATE room SET price = ? where roomid= ?",price,roomid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	// TODO Auto-generated method stub
		
	}
	private void createroom(String roomid,double price,String name) throws Exception {
    	dd.insert("insert into room (roomid,name,price,state) values (?,?,?,\"空\")",roomid,name,price);
    	
    	// TODO Auto-generated method stub
		
	}
	private void updateroom(String roomid,String name,String price) {
		// TODO Auto-generated method stub
		try {
			System.out.println("1");
			dd.modify("UPDATE room SET name = ?,price = ? where roomid =?",name,Double.parseDouble(price),Integer.parseInt(roomid));
			System.out.println("2");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	private void selectroom(String roomid) {
		try {
			
			dd.query("select * from hotelmn.room"+" where roomid =?",roomid);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
	private ResultSet getCustomer(String roomid) {
		// TODO Auto-generated method stub
		return null;
	}
	private void deleteroom(String roomid) {
		try {
			dd.delete("delete from room  where roomid =?", roomid );
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		RequestDispatcher rd;
		
//		HttpSession session =request.getSession(true);
////		获取session属性，跟踪用户会话状态
//		session.setAttribute("username", username);
////		rd =request.getRequestDispatcher("/index.jsp");
//		rd =request.getRequestDispatcher("/VIPindex.jsp");
//		rd.forward(request, response);
        this.doGet(request, response);

    }
	
}
