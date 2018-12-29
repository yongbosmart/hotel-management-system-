<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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

<title>会员查询</title>
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
	<a class="visible-phone" href="employee.jsp"><i class="icon icon-home"></i> 首页</a>
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
		<h1>VIP会员查询</h1>
		<a href="login.jsp"><p><h2>退出登录&nbsp&nbsp&nbsp</h2></p></a>
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px">
		<div class="panel-body">
			
             <div class="table-responsive col-sm-12">
             <table class="table table-hover table-condensed table-borderd" style="margin-top:55px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td class="col-sm-12" bgcolor="#D9EDF7" colspan=12 align=center><font face="微软雅黑" size=3 ><b>VIP会员信息</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>会员号</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>姓名</b></font></td>
           		<td align=center><font face="宋体" size=3  color="#555555"><b>性别</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>身份证号码</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>联系方式</b></font></td>
           		</tr>
           		<%
           			try{
           				Class.forName("com.mysql.jdbc.Driver").newInstance();
           				Connection con=java.sql.DriverManager.getConnection
           						("jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
           				Statement stmt=con.createStatement();
           				ResultSet rst=stmt.executeQuery("select * from vip;");
           				while(rst.next()){
           					out.print("<tr height=35px align='center'>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getInt("vipid")+"</td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString("name")+"</b></font></td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString("sex")+"</b></font></td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString("myid")+"</b></font></td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getLong("phone")+"</b></font></td>");
           					
           				}
           				rst.close();
           				stmt.close();
           				con.close();
           			}
           			catch(Exception e){
           			
           			}
           		%>
           		</tbody>
			</table>
			</div>
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