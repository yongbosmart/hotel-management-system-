<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

<title>订房</title>
</head>
<body>
<% String roomid=request.getParameter("roomid");
String username=" ";
if(request.getParameter("username")!=null){
 username=request.getParameter("username");}
else{
	 username=request.getAttribute("username")+" ";
}%>
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
		<li class="active"><a href="VIPindex.jsp?username=<%=username%>"><i class="icon icon-home"></i><span>首页</span></a></li>
		<li class="submenu">
		<a href="#"><i class="icon icon-file"></i><span>订房服务</span><span class="label">2</span></a>
		<ul>
			<li><a href="preroom.jsp?username=<%=username%>">预定房间</a></li>
			<li><a href="precord.jsp?username=<%=username%>">订房记录</a></li>
		</ul>
		</li>
		<li class="submenu">
		<a href="#"><i class="icon icon-th-list"></i><span>信息管理</span><span class="label">1</span></a>
		<ul>
			<li><a href="vipset.jsp?username=<%=username%>">个人信息变更</a></li>
		</ul>
		</li>
	</ul>
</div>
<div id="content">
	<div id="content-header">
		<h1>进行房间预订</h1>
		<p><h2>登录时间：<%= (new java.util.Date()).toLocaleString()%>&nbsp&nbsp&nbsp</h2></p>
		<p><h2>用户：<%=username%>&nbsp&nbsp</h2></p>
		<a href="login.jsp"><p><h2>退出&nbsp&nbsp</h2></p></a>
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px">
			
             
		<div class="panel-body">
			<div class="panel panel-info" >
				<div class="panel-heading">
				<p class="panel-title">预订房间</p>
				</div>
				<div class="panel-body">
				
				<form class="form-horizon" role="form" action="proom" >
				<input type="hidden" name="roomid" value=<%=roomid %>>
				<input type="hidden" name="vipid" value=<%=username%>>
				<input type="hidden" name="predate" value=<%=request.getParameter("ptime") %>>
				<input type="hidden" name="action" value="proom">
				<div class="form-group">
						<label for="roomid" class="col-sm-1 control-label">房间号:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="roomid"  class="form-control" placeholder=<%=request.getParameter("roomid") %> readonly>
						</div>
						<label for="vipid" class="control-label col-sm-1">会员号:</label>
						<div class="col-md-2">
							<input type="text" style="height:35px" id="vipid"  class="form-control" placeholder=<%=username%> readonly>
						</div>
						<br>
						<br>
						<br>
						<label for="predate" class="control-label col-sm-1">日期:</label>
						<div class="col-md-4">
							<input type="text" style="height:35px" id="predate" name="predate" class="form-control" placeholder=<%=request.getParameter("ptime") %> readonly>
						</div>
						
						
						<div class="col-sm-2 col-sm-offset-1">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
				
				<%
	if(request.getAttribute("err")!=null){
		out.print("<br><br><br>");
		out.println("<div class=\"alert alert-danger\" style=\"margin-left:200px;margin-right:200px;\">"+request.getAttribute("err")+"</div><br>");
	}
%>
			</div>
			</div>
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