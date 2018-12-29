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

<title>预订房间</title>
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
		<h1><span class="glyphicon glyphicon-list-alt"></span>&nbsp预订房间</h1>
		<p><h2>登录时间：<%=(new java.util.Date()).toLocaleString()%>&nbsp&nbsp&nbsp</h2></p>
		<p><h2>用户：<%=username%>&nbsp&nbsp</h2></p>
		<a href="login.jsp"><p><h2>退出&nbsp&nbsp</h2></p></a>
	</div>
	<div class="panel panel-primary" style="margin-left:10px;margin-right:10px">
		<div class="panel-body">
			<form class="bs-example bs-example-form" role="form" action="proom" style="margin-bottom:10px">
					<div class="col-sm-11">
        		  	<input class="form-control" style="height:35px" name="ptime" type="text" placeholder="请输入希望预订的日期（日期请规范处理，如2017-07-01）"/>
        		  	<input type="hidden" name="action" value="search"> 
        		  	<input type="hidden" name="vipid" value=<%=username %>>
           			<input type="hidden" name="username" value=<%=username %>>
           			</div>
           			<button class="btn btn-default btn-search " style="margin-left:10px;height:35px"><font style="color:#555555">查找</font></button>  
             </form>
             <%
	if(request.getAttribute("err")!=null){
	
		out.print("<div class=\"alert alert-warning\">NOTICE：");
		
		String err=(String)request.getAttribute("err");
           				out.print("输入信息有误或"+err+"，请重新操作");
           		out.print("</div>");
           		
	 }
%>
             <div class="table-responsive col-sm-12">
             <%
             if(request.getAttribute("result")!=null){
             ResultSet rst=(ResultSet)request.getAttribute("result"); 
            	 		
           	%>
           	
           	
           
			<table class="table table-hover table-condensed table-borderd" style="margin-top:-100px">
             	<thead>
             	<tr height=40px align='center'>	
           			<td width=800px bgcolor="#D9EDF7" colspan=9 align=center><font face="微软雅黑" size=3 ><b>可订房间</b></font></td>
           		</tr>
           		</thead>
           		<tbody>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间号</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>房间类型</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>操作</b></font></td>
           		</tr>
           		<%while(rst.next()){ %>
           		<tr height=35px align='center'>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>
           		<% int roomid3=rst.getInt("roomid");
           		
           		out.print(roomid3);
           		%>
           		</b></font></td>
           		<td align=center><font face="宋体" size=3 color="#555555"><b>
           		<% String name=rst.getString("name");
           		out.print(name);
           		%>
           		</b></font></td>
           		<%out.print("<form action=\"proom.jsp\">");
           			out.print("<input type=\"hidden\" name=\"roomid\" value="+roomid3+">");
           			out.print("<br>");
           			out.print("<input type=\"hidden\" name=\"vipid\" value="+username+">");
           			out.print("<input type=\"hidden\" name=\"username\" value="+username+">");
           			out.print("<input type=\"hidden\" name=\"ptime\" value="+request.getAttribute("ptime")+">");
           			out.print("<td align=center>"+
           	           		"<button class=\"btn btn-default\" type=\"submit\" name=\"ope\" value=\"满\" style=\"margin-left:10px;height:30px\"><font style=\"color:#555555\">");
           			out.print("预订"+"</font></button></td></tr>"); 
           			out.print("</form>");
           		}
           	    
           				rst.close();
             }else{
            	 out.print("<div class=\"alert alert-warning\">云深为您服务：");
         		
         		String err=(String)request.getAttribute("err");
                    				out.print("想出行了吗？快来订房吧~");
                    		out.print("</div>");
             }
           				
           	%>
           	    
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
<div id="footer" class="container">

</body>
</html>