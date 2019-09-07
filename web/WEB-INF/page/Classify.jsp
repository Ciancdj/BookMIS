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
  
  <body class="container-fluid">
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
  	<div class="row">
  		
  		<nav class="col-md-3 d-none d-md-block bg-light sidebar">
  		
  			<div class="list-group"  id="accordion">
				<a href="classify" class="list-group-item active">中图法</a>
				<c:forEach items="${parentList}" var="Plist" varStatus="Pstatus">
					<a href="classify?key1=PressParent&key2=${Plist.id}" class="list-group-item">${Plist.id}.${Plist.name}</a>
				</c:forEach>
				<!-- 左侧边框特效注释 -->
				<!--  
				<c:forEach items="${parentList}" var="Plist" varStatus="Pstatus">
					<div class="panel panel-success list-group-item">
						<div class="panel-heading">
							<button type="button" class=" btn btn-default dropdown-toggle panel-title" ata-toggle="collapse" data-parent="#accordion" href="#demo">
								${Plist.id}.${Plist.name}<span class="caret"></span></button>
								
							<div id="demo" class="panel-collapse collapse">
								
								<c:forEach items='${sonList}' var="Slist" varStatus="Sstatus">
									<div class="panel-body"><a href="" class="list-group-item">thsthst</a></div>
									<c:if test="${Pstatus.count == Sstatus.count}">
										<c:forEach items='${Slist}' var="list">
											<div class="panel-body"><a href="">${list.id}.${list.name}</a></div>
										</c:forEach>
									</c:if>
								</c:forEach>
								
							</div>
							
						</div>
					</div>
				</c:forEach>
				
				<c:forEach items="${parentList}" var="Plist" varStatus="Pstatus">
					
						<button type="button" class="list-group-item btn btn-default dropdown-toggle " ata-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							${Plist.id}.${Plist.name}<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<c:forEach items='${sonList}' var="Slist" varStatus="Sstatus">
								<c:if test="${Pstatus.count == Sstatus.count}">
									<c:forEach items='${Slist}' var="list">
										<li class="panel-body"><a href="">${list.id}.${list.name}</a></li>
									</c:forEach>
								</c:if>
							</c:forEach>
						</ul>
				</c:forEach>
				-->

			</div>
  		</nav>
  		 
  		<!-- 一下为右边的检索结果显示需要适当进行修改 -->
  		<div class="col-md-9">
  			<br/>
  			<div class="embed-responsive embed-responsive-16by9" style="height:1150px">
  				<c:if test="${method == null || ParentID == null}">
  					<iframe class="embed-responsive-item" src="getList"></iframe>
  				</c:if>
  				<c:if test="${method != null}">
  					<c:if test="${ParentID != null}">
  						<iframe class="embed-responsive-item" src="getList?key1=${method}&key2=${ParentID}"></iframe>
  					</c:if>
  				</c:if>
			</div>
  		</div>
  	</div>
	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
