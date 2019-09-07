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
  		<div class="col-md-8 blog-main">
  			<h4 class="pb-3 mb-4 font-italic border-bottom mt-3">书目信息（Book Detail）</h4>
  			<div class="container">
  				<ul>
  					<li>书名：<strong>${Book.bookname}</strong></li>
  					<li>作者：${Book.bookauthor}</li>
  					<li>出版社：${Book.bookpress}</li>
  					<li>书本分类：${Book.bookclassify}</li>
  					<li>中图法编号：${Book.bookclassifyid}</li>
  					<li>书本价格：${Book.bookprice}</li>
  				</ul>
  			</div><hr/>
  			<!-- 该处往下添加馆藏书籍表格等数据 -->
  			<nav class="navbar navbar-expand-lg navbar-light bg-light rounded mt-0">
        		<div class="collapse navbar-collapse mt-0">
          			<ul class="navbar-nav mr-auto">
            			<li class="nav-item active">馆藏书籍 <span class="sr-only">(current)</span></li>
          			</ul>
        		</div>
      		</nav>
      		<table class="table">
				<thead>
					<tr>
						<th>索书号</th>
						<th>条码号</th>
						<th>馆藏地</th>
						<th>书刊状态</th>
						<th>暂存</th>
						<th>借阅</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${Booklist}" var="inform" varStatus="status">
						<tr>
							<td>${inform.bookindex}</td>
							<td>${inform.bookcode}</td>
							<td>${inform.bookregion}</td>
							<c:if test="${inform.bookstate == 0}">
								<td>可借</td>
								<td>
			  						<form action="addTemporary" method=post>
			  							<input type="hidden" value="${BookURL}" name="ReturnURL"/>
			  							<input type="hidden" value="${Book.bookpress}" name="bookpress"/>
			  							<input type="hidden" value="${inform.bookindex}" name="bookindex"/>
			  							<input type="hidden" value="${Book.bookname}" name="bookname"/>
			  							<input type="hidden" value="${inform.bookcode}" name="bookcode"/>
			  							<input type="hidden" value="${Book.bookauthor}" name="bookauthor"/>
			  							<input type="hidden" value="${Book.bookid}" name="bookid"/>
					  					<button class="btn btn-Info" type="submit">放入暂存书籍<span class="caret"></span></button>
					  				</form>
								</td>
								<td>
									<c:if test="${holdingUsers != null}">
										<form action="borrowBook" method=post>
					  						<input type="hidden" name="bookcode" value="${inform.bookcode}">
					  						<input type="hidden" name="bookauthor" value="${Book.bookauthor}"/>
					  						<input type="hidden" name="bookname" value="${Book.bookname}"/>
					  						<input type="hidden" name="userid" value="${holdingUsers.id}">
					  						<input type="hidden" name="returnUrl" value="books?BookId=${Book.bookid}">
					  						<button type="submit" class="btn btn-Primary">借阅<span class="caret"></span></button>
					  					</form>
									</c:if>
			  						<c:if test="${holdingUsers == null}"><td>-</td></c:if>
								</td>
							</c:if>
							<c:if test="${inform.bookstate != 0}">
								<td>已借出</td>
								<td>-</td>
								<td>-</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
  		</div>
  		<aside class="col-md-4 blog-sidebar">
  			<br/>
  			<div class="row">
  				<div class="col-md-1"></div>
  				<div class="col-md-10">
  					<img src="<%=basePath%>\\img\\cover.jpg" class="d-block mx-auto mb-4" style="height:300px;width:200px" >
  				</div>
  				<div class="col-md-1"></div>
  			</div><br/>
  			<hr/>
  			<div class="p-3 mb-3 bg-light rounded">
            	<h4 class="font-italic">介绍</h4>
            	<p class="mb-0">${Book.bookintro}</p>
          	</div>
  		</aside>
  	</div>
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
