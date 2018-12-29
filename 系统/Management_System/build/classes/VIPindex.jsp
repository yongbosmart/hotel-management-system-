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

<title>vip首页</title>
</head>
<body>
<% 
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
		<h1>欢迎来到宾馆预订首页！</h1>
		<p><h2>登录时间：<%= (new java.util.Date()).toLocaleString()%>&nbsp&nbsp&nbsp</h2></p>
		<p><h2>用户：<%=username%>&nbsp&nbsp</h2></p>
		<a href="login.jsp"><p><h2>退出&nbsp&nbsp</h2></p></a>
		
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px">
		<div class="panel-body">
		<div class="panel panel-info" >
				<div class="panel-heading">
				<p class="panel-title">有关宾馆</p>
				</div>
				<div class="panel-body">
				<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<font face="微软雅黑" size=3px;>云深酒店是一家商务、会议型豪华酒店，是南京市首家五星级酒店。酒店座落在苏南工业重镇新桥镇海澜工业园内，北枕长江，南靠太湖，毗邻张家港市中心，宁太（沿江）高速横亘其侧，交通极其便利。酒店按欧式风格设计装修，环境优美，格调高雅。客房舒适、豪华，餐饮风味独特，各类康乐休闲设施一应俱全，设施先进的商务中心随时为您提供周到、快捷的服务。而气势恢宏、功能齐全的国际会展中心更将使您的商务活动取得意想不到的成功！当暮色降临时，云深园内华光闪烁，幢幢欧式建筑风
姿绰约，柔和的光晕洋溢在铜栏杆、古廊柱、大理石上，仿佛一首幽远的歌从上世纪初一直吟唱到今，让您沉醉在一派浓郁的欧陆风情之中……</font></p>
<br>
<br>
			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="icon/hotel1.png">&nbsp&nbsp&nbsp&nbsp
				<img src="icon/hotel2.png">&nbsp&nbsp&nbsp&nbsp
				<img src="icon/hotel3.png">&nbsp&nbsp&nbsp&nbsp
				<img src="icon/hote4.png">&nbsp&nbsp&nbsp&nbsp
				<img src="icon/hotel.png">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
				<img src="icon/jjsh.png">
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