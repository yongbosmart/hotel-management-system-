<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*,java.io.*"%>
    <%-- page import="com.mysql.jdbc.Driver"--%>  
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
		<link rel="stylesheet" href="css/bootstrap.css" />
		<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
		<link rel="stylesheet" href="css/fullcalendar.css" />	
		<link rel="stylesheet" href="css/unicorn.main.css" />
		<link rel="stylesheet" href="css/unicorn.grey.css" class="skin-color" />

<title>员工首页</title>
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
		
		<h1>欢迎来到宾馆客房管理系统！</h1>
		<a href="login.jsp"><p><h2>退出登录&nbsp&nbsp&nbsp</h2></p></a>
	
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px">
		<div class="panel-body">
		<p>&nbsp&nbsp自然语言查询</p>
			<form class="bs-example bs-example-form" role="form" action="search">
					<div class="col-sm-11">
        		  	<input class="form-control" style="height:35px" name="ws" type="text" placeholder="请输入查找内容"/>  
           			</div>
           			<button class="btn btn-default btn-search " style="margin-left:10px;height:35px"><font style="color:#555555">查找</font></button>  
             </form>
             <table class="table table-hover table-condensed table-borderd" style="margin-top:55px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td class="col-sm-12" bgcolor="#D9EDF7" colspan=12 align=center><font face="微软雅黑" size=3 ><b>查询结果</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
             <%	
             	String column[];
            	 if(request.getAttribute("err")!=null){
            		 String err=(String)request.getAttribute("err");
      				out.print("<div class=\"alert alert-warning\">"+err+"</div>");
      			}
             	if(request.getAttribute("column")!=null){
             		 column=(String[])request.getAttribute("column");
             		for(int k=0;k<=Integer.parseInt(column[1])+1;k++){
         				System.out.println(column[k]);
         			}
             		//for(int i=2;i<=Integer.parseInt(column[1]);i++){
             			if(request.getAttribute("result")==null){
                 			out.print("<div class=\"alert alert-warning\">很抱歉，没有搜到任何结果</div>");
                 		}
                 		else{
                 			for(int k=0;k<=Integer.parseInt(column[1])+1;k++){
                 				System.out.println(column[k]);
                 			}
                 		
                 			ResultSet rst =(ResultSet)request.getAttribute("result");
                 			if(column[0].charAt(12)!='('){
                 			while(rst.next()){
                 				
                 				out.print("<tr>");
                 				for(int j=2;j<=Integer.parseInt(column[1]);j++){
                 					out.print("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString(column[j])+"</td>");
                 				}
                 				out.print("</tr>");
                 			}
                 			}
                 			else{
                 				
                 			rst.next();
                 				out.print("<tr>");
                 				out.print("<td align=center><font face=\"宋体\" size=3 color=\"#555555\"><b>"+rst.getString("count")+"</td>");
                 				out.print("</tr>");
                 			}
                 		}
             	}
              %>
              </tr>
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

<!-- <ul class="nav nav-pills nav-stacked" srole="tablist" style="margin-top:-20px;width:200px;">
    <li class="active"><a href="#">房间管理</a></li>
    <li><a href="#">开房退房登记</a></li>-- 房间状态，空房登记 --
    <li><a href="#">房客信息查询</a></li> >
    <li><a href="#">About</a></li>
</ul>
<ul class="nav nav-pills nav-stacked" srole="tablist" style="width:200px">
    <li class="active"><a href="#">会员管理</a></li>
    <li><a href="#">会员查询</a></li>
    <li><a href="#">新建会员</a></li>
    <li><a href="#">About</a></li>
</ul> -->


</body>
</html>