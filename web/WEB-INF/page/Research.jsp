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
    <title>Register surface</title>
    <link rel="stylesheet" href="<%=basePath%>\\bootstrap-4.0.0-dist\\css\\bootstrap.min.css">
  </head>
  
  <body  class="container-fluid">
    <div class="mr-4 ml-5 badge-light">
  		<h1 class="float:left"><img src="<%=basePath%>\\img\\book.jpg" style="height:75px;width:75px" >
  			Jluzh <small>BookMis</small></h1>
	</div>
	<nav class="navbar navbar-expand-md navbar-dark bg-dark .navbar-static-top" style="height:50px">
  		<div class="collapse navbar-collapse" id="navbarCollapse">
  			<ul class="navbar-nav mr-auto">
  				<li class="nav-item active">
  				<a class="nav-link" href="search">书目检索 <span class="sr-only">(current)</span></a>
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
  	<!-- Follow text is scearch text -->
  	<div class="row">
  		<!-- 以下为左边的导航栏界面选项需要进行修改 -->
  		<nav class="col-md-3 d-none d-md-block bg-light sidebar">
  			<h5 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
  				 <span>检索范围展示</span>
  			</h5>
  			<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
  				 <span>分类关键词</span>
  			</h6>
  			<ul class="nav flex-column">
  				<c:forEach items="${regionInfor}" var="region" varStatus="status">
  					<c:if test="${status.index < 5}">
  						<li class="nav-item"><a class="nav-link" href="#"><span data-feather=""></span>${region.defination}(${region.amount})</a></li>
  					</c:if>
  				</c:forEach>
  			</ul><br/>
  			<c:if test="${regionsize > 5}">
  				<div class="row"><div class="col-md-1"></div><div class="col-md-10">
  					<div class="btn-group" style="width:300px">
						<button class="btn btn-Info btn-sm dropdown-toggle btn-block " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							更多<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:forEach items="${regionInfor}" var="region" varStatus="status" begin="5">
		  						 <li><a href="#">${region.defination}(${region.amount})</a></li>
		  					</c:forEach>
						</ul>
					</div>
  				</div><div class="col-md-1"></div></div>
  			</c:if>
  			
  			<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
  				 <span>管藏地分布</span>
  			</h6>
  			<ul class="nav flex-column">
  				<c:forEach items="${positionInfor}" var="position" varStatus="status">
  					<c:if test="${status.index < 5}">
  						<li class="nav-item"><a class="nav-link" href="#"><span data-feather=""></span>${position.defination}(${position.amount})</a></li>
  					</c:if>
  				</c:forEach>
  			</ul>
  			<c:if test="${positionsize > 5}">
  				<div class="row"><div class="col-md-1"></div><div class="col-md-10">
  					<div class="btn-group" style="width:300px">
						<button class="btn btn-Info btn-sm dropdown-toggle btn-block " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							更多<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:forEach items="${positionInfor}" var="position" varStatus="status" begin="5">
		  						 <li><a href="#">${position.defination}(${position.amount})</a></li>
		  					</c:forEach>
						</ul>
					</div>
  				</div><div class="col-md-1"></div></div>
  			</c:if>
  			
  			<h6 class="sidebar-heading d-flex justify-content-between align-items-center px-3 mt-4 mb-1 text-muted">
  				 <span>出版社名称</span>
  			</h6>
  			<ul class="nav flex-column">
  				<c:forEach items="${pressInfor}" var="press" varStatus="status">
  					<c:if test="${status.index < 5}">
  						<li class="nav-item"><a class="nav-link" href="#"><span data-feather=""></span>${press.defination}(${press.amount})</a></li>
  					</c:if>
  				</c:forEach>
  			</ul>
  			<c:if test="${presssize > 5}">
  				<div class="row"><div class="col-md-1"></div><div class="col-md-10">
  					<div class="btn-group" style="width:300px">
						<button class="btn btn-Info btn-sm dropdown-toggle btn-block " type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							更多<span class="caret"></span>
						</button>
						<ul class="dropdown-menu">
							<c:forEach items="${pressInfor}" var="press" varStatus="status" begin="5">
		  						 <li><a href="#">${press.defination}(${press.amount})</a></li>
		  					</c:forEach>
						</ul>
					</div>
  				</div><div class="col-md-1"></div></div>
  			</c:if>
  			<hr/><br/>
  			<!-- 
  			<form action="" method=post>
  				<button class="btn btn-Warning btn-lg" style="width:100%; color:white">回 复 操 作<span class="caret"></span></button>
  			</form>
  			 -->
  		</nav>
  			
  		<!-- 一下为右边的检索结果显示需要适当进行修改 -->
  		<div class="col-md-9">
			<c:if test="${listLen == null}">
				<div class="alert alert-danger" role="alert">
					<h6>检索到有${listLen}条${input}的结果</h6>
				</div>
			</c:if>
			<c:if test="${listLen != null}">
				<div class="alert alert-success" role="alert">
					<h6>检索到有${listLen}条${input}的结果</h6>
				</div>
	  			<div class="nav-scroller bg-white box-shadow">
	  				<nav class="nav nav-underline">
	  					<a class="nav-link" href="">可借图书</a>
	  					<a class="nav-link" href="">所有图书</a>
	  				</nav>
	  			</div><hr/>
	  			<!-- 往后为添加图书选项，需要注意换页以及为找到符合所选项的情况 -->
	  			<div class="embed-responsive embed-responsive-16by9" style="height:1150px">
	  				<c:if test="${method != null}">
	  					<c:if test="${input != null}">
	  						<iframe class="embed-responsive-item" src="getList?key1=${method}&key2=${input}"></iframe>
	  					</c:if>
	  				</c:if>
				</div>
			</c:if>
  		</div>
  	</div>
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
