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
	<link rel="stylesheet" href="css/bootstrap.min.css" />
 	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css"/>
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css"  type="text/css"/>
		<link rel="stylesheet" href="css/fullcalendar.css"  type="text/css"/>	
		<link rel="stylesheet" href="css/unicorn.main.css"  type="text/css"/>
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color"  type="text/css"/>

<title>房间设置</title>
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
		<img src="icon/roomm.png" hspace=10px align="left"/><h1>&nbsp&nbsp&nbsp&nbsp&nbsp客房信息设置</h1>
		<a href="login.jsp"><p><h2>退出登录&nbsp&nbsp&nbsp</h2></p></a>
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px;padding-right:20px;padding-left:20px">
		<div class="panel-body">
			<div class="panel panel-info" >
				<div class="panel-heading">
				<p class="panel-title">新建房间</p>
				</div>
				<div class="panel-body">
				<br>
				<form class="form-horizon" role="form" action="room" >
				<input type="hidden" name="action" value="create">
					<div class="form-group">
						<label for="name" class="col-sm-1 control-label">房间名:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="name" name="name" class="form-control" placeholder="请输入房间名">
						</div>
						<label for="roomid" class="col-sm-1 control-label">房间号:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="roomid" name="roomid" class="form-control" placeholder="请输入房间号">
						</div>
						<label for="price" class="control-label col-sm-1">价格:</label>
						<div class="col-md-2">
							<input type="text" style="height:35px" id="price" name="price" class="form-control" placeholder="请输入房间价格">
						</div>
						<div class="col-sm-2 col-sm-offset-1">
							<button type="submit" class="btn btn-default">新建</button>
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="panel panel-info">
				<div class="panel-heading">
				<p class="panel-title">编辑房间</p>
				</div>
				<div class="panel-body">
				<table class="table table-hover table-condensed table-borderd" style="margin-top:55px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td width=800px bgcolor="#D9EDF7" colspan=9 align=center><font face="微软雅黑" size=3 ><b>房间查找结果</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间号</b></font></td>
           		<td align=center><font face="宋体" size=3  color="#555555"><b>房间名称</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间价格</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间状态</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间操作</b></font></td>
           		</tr>
           		<%
           			try{
           				Class.forName("com.mysql.jdbc.Driver").newInstance();
           				Connection con=java.sql.DriverManager.getConnection
           						("jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
           				Statement stmt=con.createStatement();
           				ResultSet rst=stmt.executeQuery("select * from room ;");
           				while(rst.next()){
           					out.print("<form action=\"roomset.jsp\">");
           					out.print("<tr height=35px align='center'>");
           					out.print("<input type=\"hidden\" name=\"roomid\" value="+rst.getInt("roomid")+">");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getInt("roomid")+"</td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString("name")+"</b></font></td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getDouble("price")+"</b></font></td>");
           					out.print
           					("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString("state")+"</b></font></td>");
           					out.print
           					("<td align=center><button class=\"btn btn-default\" style=\"margin-left:10px;height:30px\">"+
           					"<font style=\"color:#555555\">"+"设置"+"</font></button></td></tr>");
           					out.print("</form>");
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