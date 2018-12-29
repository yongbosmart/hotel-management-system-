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
 	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/fullcalendar.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

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
	<%try{
           				String roomid=request.getParameter("roomid");
           				System.out.print(roomid);
						Class.forName("com.mysql.jdbc.Driver").newInstance();
           				Connection con=java.sql.DriverManager.getConnection
           						("jdbc:mysql://localhost:3306/HOTELMN","root","66332211");
           				Statement stmt=con.createStatement();
           				ResultSet rst=stmt.executeQuery("select * from room where roomid ="+roomid);
           				rst.next();
     %>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px;padding-right:20px;padding-left:20px">
		<div class="panel-body">
			<div class="panel panel-info" >
				<div class="panel-heading">
				<p class="panel-title">修改删除房间</p>
				</div>
				<div class="panel-body">
				<p>关于房间</p>
				<br>
				<form class="form-horizon" role="form" action="room" >
				<input type="hidden" name="action" value="update">
					<div class="form-group">
						<label for="name" class="col-sm-1 control-label">房间名:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="name" name="roomid" class="form-control" value=<%=rst.getString("roomid")%> readonly>
						</div>
						<label for="roomid" class="col-sm-1 control-label">房间号:</label>
						<div class="col-sm-2">
							<input type="text" style="height:35px" id="roomid" name="name" class="form-control" value=<%=rst.getString("name")%>>
						</div>
						<br>
						<br>
						<br>
						<label for="price" class="control-label col-sm-1">价格:</label>
						<div class="col-md-2">
							<input type="text" style="height:35px" id="price" name="price" class="form-control" value=<%=rst.getString("price")%>>
						</div>
						<label for="state" class="control-label col-sm-1">状态:</label>
						<div class="col-md-2">
							<input type="text" style="height:35px" id="state" name="state" class="form-control" value=<%=rst.getString("state")%>  readonly>
						</div>
						<br>
						<br>
						<br>
						<div class="col-sm-2 col-sm-offset-1">
							<button type="submit" class="btn btn-default">提交</button>
						</div>
					</div>
				</form>
				<form action="room">
				<input type="hidden" name="roomid" value=<%=rst.getString("roomid")%>>
				<input type="hidden" name="action" value="delete">
				<div class="col-sm-2 ">
							<button type="submit" class="btn btn-primary" style="margin-top:-15px;">删除</button>
				</div>
				</form>
				<br><br><br><br>
				</div>
			</div>
			<%}catch(Exception e){
				String err="出错了";
				System.out.print(err);
			}
	
			%>
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

<script src="js/jquery.js" type="text/javascript"></script> 
<script src="js/edit.js" type="text/javascript"></script> 

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