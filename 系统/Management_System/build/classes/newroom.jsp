<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">  
	
	<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/fullcalendar.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<title>开房退房</title>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-tree-deciduous"></span><font face="微软雅黑">宾馆客房管理系统</font></a>
    </div>
	</div>
</nav>
<div id="sidebar">
	<ul>
		<li class="submenu">
		<a href="#"><i class="icon icon-th-list"></i><span>房间管理</span><span class="label">3</span></a>
		<ul>
			<li><a href="newroom.jsp?username=<%=request.getParameter("username") %>">开房退房登记</a></li>
			<li><a href="roomsetting.jsp?username=<%=request.getParameter("username") %>">客房信息设置</a></li>
			<li><a href="roomsearch.jsp?username=<%=request.getParameter("username") %>">房客信息查询</a></li>
		</ul>
		</li>
		<li class="submenu">
		<a href="#"><i class="icon icon-file"></i><span>会员管理</span><span class="label">2</span></a>
		<ul>
			<li><a href="newvip.jsp?username=<%=request.getParameter("username") %>">会员添加</a></li>
			<li><a href="vipsearch.jsp?username=<%=request.getParameter("username") %>">会员信息查询</a></li>
		</ul>
		</li>
		<li class="submenu">
		<a href="#"><i class="icon icon-file"></i><span>自然语言查询</span><span class="label">1</span></a>
		<ul>
			<li><a href="index.jsp?username=<%=request.getParameter("username") %>">自然语言查询</a></li>
		</ul>
		</li>
	</ul>
</div>
<div id="content">
	<div id="content-header">
		<h1><span class="glyphicon glyphicon-list-alt"></span>&nbsp开房退房登记</h1>
		<a href="login.jsp"><p><h2>退出登录&nbsp&nbsp&nbsp</h2></p></a>
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px">
		<div class="panel-body">
			<div class="table-responsive col-sm-12">
             <%
           			try{
           				Class.forName("com.mysql.jdbc.Driver").newInstance();
           				Connection con=java.sql.DriverManager.getConnection
           						("jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
           				Statement stmt=con.createStatement();
           				Statement stmt1=con.createStatement();
           				Statement stmt2=con.createStatement();
           				ResultSet rst1=stmt.executeQuery("select room.roomid,state from room where name=\"单人间\" and room.roomid not in(select roomid from preroom where predate=curdate()) ;");
           				ResultSet rst2=stmt1.executeQuery("select roomid,state from room where name=\"标准间\" and room.roomid not in(select roomid from preroom where predate=curdate());");
           				ResultSet rst3=stmt2.executeQuery("select roomid,state from room where name=\"豪华套间\" and room.roomid not in(select roomid from preroom where predate=curdate());");
           				
           				
           	%>
           	
           	
           	
             <table class="table table-hover table-condensed table-borderd" style="margin-top:55px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td width=800px bgcolor="#D9EDF7" colspan=9 align=center><font face="微软雅黑" size=3 ><b>单人间</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间号</b></font></td>
           		<td align=center><font face="宋体" size=3  color="#555555"><b>房间状态</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>操作</b></font></td>
           		</tr>
           		<%while(rst1.next()){ %>
           		<tr height=35px align='center'>
           		
           		<td align=center><font face="宋体" size=3 color="#555555"><b>
           		<% int roomid1=rst1.getInt("roomid");
           		out.print(roomid1); %>
           		</b></font></td>
           		<% if(rst1.getString("state").equals("空")){
           			out.print("<form action=\"nnewroom.jsp\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid1+">");
           			out.print("<td align='center'><font face=\"宋体\" size=3  color=\"#508ec3\"><b>"+"空闲"+"</b></font></td><td align=center>"+
           		"<button class=\"btn btn-default\" type=\"submit\"  style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           		out.print("开房"+"</font></button></td></tr>"); 
           		out.print("</form>");}
           		else{
           			out.print("<form action=\"celroom\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid1+">");
           			out.print("<td align='center'><font face=\"宋体\" size=3  color=\"#555555\"><b>"+"已满"+"</b></font></td><td align=center>"+
           	         "<button class=\"btn btn-default\" type=\"submit\"  style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           	         out.print("退房"+"</font></button></td></tr>");
           	      out.print("</form>");
           		}}
           		%>
           		</tbody>
           	</table>
			<table class="table table-hover table-condensed table-borderd" style="margin-top:55px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td width=800px bgcolor="#D9EDF7" colspan=9 align=center><font face="微软雅黑" size=3 ><b>标准间</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间号</b></font></td>
           		<td align=center><font face="宋体" size=3  color="#555555"><b>房间状态</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>操作</b></font></td>
           		</tr>
           		<%while(rst2.next()){ %>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>
           		<% int roomid2=rst2.getInt("roomid");
           		out.print(roomid2); %>
           		</b></font></td>
           		<% if(rst2.getString("state").equals("空")){
           			out.print("<form action=\"nnewroom.jsp\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid2+">");
           			out.print("<td align='center'><font face=\"宋体\" size=3  color=\"#508ec3\"><b>"+"空闲"+"</b></font></td><td align=center>"+
           		"<button class=\"btn btn-default\" type=\"submit\" name=\"ope\" value=\"满\" style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           		out.print("开房"+"</font></button></td></tr>"); 
           		out.print("</form>");}
           		else{
           			out.print("<form action=\"celroom\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid2+">");
           			out.print("<td align='center'><font face=\"宋体\" size=3  color=\"#555555\"><b>"+"已满"+"</b></font></td><td align=center>"+
           	         "<button class=\"btn btn-default\" type=\"submit\" name=\"roomid\" value=\"空\" style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           	         out.print("退房"+"</font></button></td></tr>");
           	      out.print("</form>");
           		}}
           		%>
           		</tbody>
			</table>
			<table class="table table-hover table-condensed table-borderd" style="margin-top:55px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td width=800px bgcolor="#D9EDF7" colspan=9 align=center><font face="微软雅黑" size=3 ><b>豪华套间</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间号</b></font></td>
           		<td align=center><font face="宋体" size=3  color="#555555"><b>房间状态</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>操作</b></font></td>
           		</tr>
           		<%while(rst3.next()){ %>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>
           		<% int roomid3=rst3.getInt("roomid");
           		out.print(roomid3); %>
           		</b></font></td>
           		<%if(rst3.getString("state").equals("空")){
           			out.print("<form action=\"nnewroom.jsp\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid3+">");
           			out.print("<td align='center'><font face=\"宋体\" size=3  color=\"#508ec3\"><b>"+"空闲"+"</b></font></td><td align=center>"+
           		"<button class=\"btn btn-default\" type=\"submit\" name=\"ope\" value=\"满\" style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           		out.print("开房"+"</font></button></td></tr>"); 
           		out.print("</form>");}
           		else{
           			out.print("<form action=\"celroom\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid3+">");
           			out.print("<td align='center'><font face=\"宋体\" size=3  color=\"#555555\"><b>"+"已满"+"</b></font></td><td align=center>"+
           	         "<button class=\"btn btn-default\" type=\"submit\" name=\"roomid\" value=\"空\" style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           	         out.print("退房"+"</font></button></td></tr>");
           	      out.print("</form>");
           		}
           		}
           	    
           				rst1.close();
           				rst2.close();
           				rst3.close();
           				stmt.close();
           				con.close();
           	    }catch(Exception e){
           	    	e.printStackTrace();
           	    }%>
           	    
           		</tbody>
			</table>
			 
			</div>
		
		
	</div>
	
</div>
<div id="footer" class="container">
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="navbar-inner navbar-content-center " style="padding: 10px;">
       <center><font color="#555555">@FROMyongbosmart</font></center>
     </div>
</nav>
</div>
<script src="js/excanvas.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.ui.custom.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.flot.min.js"></script>
<script src="js/jquery.flot.resize.min.js"></script>
<script src="js/jquery.peity.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/unicorn.js"></script>
<script src="js/unicorn.dashboard.js"></script>

</body>
</html>