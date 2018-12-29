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
<title>login</title>
<head>
<style>
body {background-color:#D9EDF7;}
</style>
</head>
</head>
<body>

<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
    <div class="navbar-header">
        <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-tree-deciduous"></span><font face="微软雅黑">宾馆客房管理系统</font></a>
    </div>
	</div>
</nav>

	<center>
				<img src="icon/lv.png" style="margin-top:40px; margin-left:100px;margin-right:100px;">
		<center>
					<div class="panel panel-primary" style="margin-left:410px;margin-right:410px;margin-top:55px;padding-top:15px">
						<form class="form-horizental" " id="login" role="form" method="post" action="login">
						<div class="row">
							<div class="form-group">
								<label for="account" class="col-sm-offset-1 col-sm-3 control-label">
								<h4><span class="glyphicon glyphicon-user"></span>用户名：</h4></label>
								<div class="col-sm-6">
								<input type="text" class="form-control" id="account" name="username" 
					placeholder="请输入你的用户名">	<!-- email选项强大 -->		 <!--  -->	
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
							<label for="password" class="col-sm-offset-1 col-sm-3 control-label"><h4><span class="glyphicon glyphicon-credit-card"></span>&nbsp密码：</h4></label>
								<div class="col-sm-6">
									<input type="password" class="form-control" id="password" name="password"
					placeholder="请输入你的密码">				
								</div>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<div class="col-sm-offset-2 col-sm-2">
									<div class="checkbox"><label>
									<input type="checkbox" name="chname" value="VIP">会员</label></div>				
								</div>
								<div  class="col-sm-2">
									<div class="checkbox"><label>
									<input type="checkbox" name="chname" value="employee">员工</label></div>				
								</div>
								<div class="col-sm-2">
								<button type="submit" class="btn btn-default">登录</button>
								</div>
							</div>
						</div>
					</form>

				</div>
    			</center>
</center>
<span style="color:red;font-weight:bold">
<centre>
<%
	if(request.getAttribute("err")!=null){
		out.println("<div class=\"alert alert-danger\" style=\"margin-left:400px;margin-right:400px;margin-top:-20px;padding:4px;height:35px\"><centre>"+request.getAttribute("err")+"</centre></div><br>");
	}
%>
</centre>
</span>	

<div id="footer" class="container">
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="navbar-inner navbar-content-center " style="padding: 10px;">
       <center><font color="#555555">@FROMyongbosmart</font></center>
     </div>
</nav>
</div>
</body>

</html>