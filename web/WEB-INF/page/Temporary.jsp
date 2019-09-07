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
  
  <body>
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
  	<div class="container">
  		 <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
		    <h1 class="display-4">暂存书架</h1>
		    <p class="lead">您可以在这里对您之前添加于此的书籍进行操作</p>
		 </div>
		 <div class="table-responsive">
		 	<table class="table">
				<thead>
					<tr>
						<th>序号</th>
						<th>索书号</th>
						<th>题名/责任者</th>
						<th>出版社</th>
						<th>借阅</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${TempList}" var="inform" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td>${inform.bookindex}</td>
							<td><a href="books?BookId=${inform.bookid}">${inform.bookname}</a> / ${inform.bookauthor}</td>
							<td>${inform.bookpress}</td>
							<td>
								<form action="borrowBook" method=post>
									<input type="hidden" name="bookname" value="${inform.bookname}">
									<input type="hidden" name="bookcode" value="${inform.bookcode}">
									<input type="hidden" name="bookauthor" value="${inform.bookauthor}">
					  				<input type="hidden" name="returnUrl" value="temporary">
									<button class="btn btn-Success" type="submit">借阅</button>
								</form>
							</td>
							<td>
								<form action="deleteTemporary" method=post>
									<input type="hidden" value="${status.count}" name="deleteID" />
									<button class="btn btn-Danger" type="submit">删除该项</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		 </div>
  		<div class="row">
  			<div class="col-md-4"></div>
  			<div class="col-md-2" >
  				<form action="borrowAllBook" method=post>
  					<input type="hidden" name="returnUrl" value="temporary">
  					<button class="btn btn-Warning btn-lg" style="width:100%"  type="submit">借阅全部</button>
  				</form>
  			</div>
  			<div class="col-md-2">
  				<form action="deleteTemporaryAll" method=post>
  					<button class="btn btn-Danger btn-lg" style="width:100%"  type="submit">清空全部</button>
  				</form>
  			</div>
  			<div class="col-md-4"></div>
  		</div>
  	</div>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
