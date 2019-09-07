<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Please input amount of money</title>
    <link rel="stylesheet" href="<%=basePath%>\\bootstrap-4.0.0-dist\\css\\bootstrap.min.css">
  </head>
  
  <body style="overflow-x:hidden; overflow-y:hidden">
  	<nav class="navbar navbar-expand-md navbar-dark bg-dark .navbar-static-top" style="height:50px">
  		<div class="collapse navbar-collapse" id="navbarCollapse">
  			<ul class="navbar-nav mr-auto">
  				<li class="nav-item active">
  				<a class="nav-link" href="search">书目检索<span class="sr-only">(current)</span></a>
  				</li>
  				<li class="nav-item active">
  				<a class="nav-link" href="classify">分类浏览</a>
  				</li>
  				<c:if test="${holdingUsers != null}">
	  				<li class="nav-item active">
	  					<a class="nav-link" href="MyLibrary">我的图书馆</a>
	  				</li>
  				</c:if>
  			</ul>
  			<c:if test="${holdingUsers != null}">
  				<form class="form-inline mt-2 mt-md-3">
  					<a class="navbar-brand" href="temporary" style="font-size: 1.00rem;">暂存书籍数量<span class="badge">${TempNum}</span></a>
          		</form>
          		<c:if test="${holdingUsers.power <= 2}">
          			<form class="form-inline mt-2 mt-md-3" action="adminlogin" method=post>
  						<button class="btn btn-outline-success my-2 my-sm-0" type="submit">管理员登陆入口</button>
          			</form>
          		</c:if>
          		<form class="form-inline mt-2 mt-md-3">
  					<div class="btn-group">
  						<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    						账户：${holdingUsers.account} <span class="caret"></span>
  						</button>
					  	<ul class="dropdown-menu">
					    	<li><a href="MyLibrary">我的图书馆</a></li>
						    <li><a href="MyBorrow">当前借书</a></li>
						    <li><a href="InformChange">个人信息修改</a></li>
						     <li><a href="changePassword">密码修改</a></li>
						    <li role="separator" class="divider"></li>
						    <hr/>
						    <li><a href="login/outlogin">登出</a></li>
						</ul>
					</div>
          		</form>
  			</c:if>
  			<c:if test="${holdingUsers == null}">
  				<form class="form-inline mt-2 mt-md-3" method=post action="login">
           			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">login</button>
          		</form>
  				<form class="form-inline mt-2 mt-md-3" method=post action="register">
           			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">register</button>
          		</form>
  			</c:if>
  		</div>
  	</nav>
  	<main role="main" class="container">
      <div class="jumbotron">
        <h1>系统提醒：</h1>
        <p class="lead">${returnInformation}</p>
        <a class="btn btn-lg btn-primary" href="${returnUrl}" role="button">请点击该处进行跳转 &raquo;</a>
      </div>
    </main>
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
