<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap-theme.min.css"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css" />
 	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/fullcalendar.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<title>开房界面</title>
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
		<img src="icon/roomm.png" hspace=10px align="left"/><h1>&nbsp&nbsp&nbsp&nbsp&nbsp开房</h1>
		<a href="login.jsp"><p><h2>退出登录&nbsp&nbsp&nbsp</h2></p></a>
		<input type="hidden" name="usename" value=<%=request.getParameter("username") %>>
	</div>
	<% String roomid=request.getParameter("roomid"); %>
	
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px;padding-right:20px;padding-left:20px">
		<div class="panel-body">
			<div class="panel panel-info" >
				<div class="panel-heading">
				<p class="panel-title">新建房间</p>
				</div>
				<div class="panel-body">
				<br>
				<form class="form-horizon" role="form" action="nroom" >
				<input type="hidden" name="roomid" value=<%=roomid %>>
				<input type="hidden" name="action" value="sub">
				<div class="form-group">
						<label for="roomid" class="col-sm-1 control-label">房间号:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="roomid"  class="form-control" placeholder=<%=request.getParameter("roomid") %> readonly>
						</div>
						<label for="ndate" class="control-label col-sm-1">日期:</label>
						<div class="col-md-3">
							<input type="text" style="height:35px" id="ndate" name="ndate" class="form-control" placeholder="请输入开房日期">
						</div>
						<br>
						<br>
						<br>
						<label for="name" class="control-label col-sm-1">姓名:</label>
						<div class="col-md-3">
							<input type="text" style="height:35px" id="name" name="name" class="form-control" placeholder="请输入开房者姓名">
						</div>
						<label for="sex" class="control-label col-sm-1">性别:</label>
						<div class="col-md-2">
							<input type="text" style="height:35px" id="sex" name="sex" class="form-control" placeholder="请输入性别">
						</div>
						<label for="age" class="col-sm-1 control-label">年龄:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="age" name="age" class="form-control" placeholder="请输入开房者年龄">
						</div>
						<br>
						<br>
						<br>
						
						
						
						<label for="phone" class="control-label col-sm-1">手机号:</label>
						<div class="col-md-3">
							<input type="text" style="height:35px" id="phone" name="phone" class="form-control" placeholder="请输入手机号">
						</div>
						<label for="customerid" class="control-label col-sm-2">身份证号码:</label>
						<div class="col-md-4">
							<input type="text" style="height:35px" id="customerid" name="customerid" class="form-control" placeholder="请输入身份证号">
						</div>
						<br><br><br>
						<div class="col-sm-2 col-sm-offset-1">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
				<form action="nroom">
				<input type="hidden" name="roomid" value=<%=roomid %>>
				<input type="hidden" name="action" value="end">
				<div class="col-sm-2 ">
							<button type="submit" class="btn btn-primary" style="margin-top:-15px;">完成</button>
				</div>
				</form>
				<br><br><br><br>
				<%
	if(request.getAttribute("err")!=null){
		out.println("<div class=\"alert alert-danger\" style=\"margin-left:100px;margin-right:100px;\">"+request.getAttribute("err")+"</div><br>");
	}
%>
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