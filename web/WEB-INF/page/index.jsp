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
  	<div class="container" >
  		<br/><br/><br/>
  		<img src="<%=basePath%>\\img\\book.jpg" class="d-block mx-auto mb-4" style="height:200px;width:200px" >
  		<form method=post action="result">
	  		<div class="row">
	  				<div class="input-group">
	  					<div class="btn-group col-md-2">
	  						<!-- 在下面的任意词（待修改页面之后进行修改） -->
	  						<c:if test="${param.swit != null}">
								<button type="button" class="btn btn-primary btn-lg dropdown-toggle"  style="width:250px" id="dropdownMenu"
	  								 data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> 
	  						${param.swit}<span class="caret"></span></button>
							</c:if>
	  						<c:if test="${param.swit == null}">
								<button type="button" class="btn btn-primary btn-lg dropdown-toggle"  style="width:250px" id="dropdownMenu"
	  								 data-toggle="dropdown" aria-haspopup="true" aria-expanded="true"> 
	  						任意词<span class="caret"></span></button>
							</c:if>
	  						<ul class="dropdown-menu" aria-labelledby="dropdownMenu">
	   							<li><a href="search/switch?s=任意词">任意词</a></li>
	   							<li><a href="search/switch?s=出版社">出版社</a></li>
	 						</ul>
	  					</div>
	  						<input type="text" name="input" class="form-control col-md-8" placeholder="请输入待检索书籍的信息" aria-describedby="basic-addon2">
	  						<button class="btn btn-primary col-md-2" type="submit">提交</button>
	  						<c:if test="${param.swit != null}">
	  							<input type="hidden" name="ways" value="${param.swit}"/>
	  						</c:if>
	  						<c:if test="${param.swit == null}">
	  							<input type="hidden" name="ways" value="任意词"/>
	  						</c:if>
	  						<span style="color:red">${ErrorType}</span>
					</div>
	  		</div>
  		</form>
  	</div>
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
