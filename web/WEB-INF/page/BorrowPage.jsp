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
	  <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	  <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	  <script src="<%=basePath%>/bootstrap-4.0.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
	  <script type="text/javascript">
		  function load()
		  {
              var informationTips="${overTimeBookInformation}";
              if(informationTips != "" && informationTips != null){
                  window.alert(informationTips);
              }
		  }
		  function alert_inform(inform) {
              window.alert(inform);
          }
	  </script>
  </head>
  
  <body  onload="load()">
    <nav class="navbar navbar-expand-md navbar-dark bg-dark .navbar-static-top" style="height:50px">
  		<div class="collapse navbar-collapse" id="navbarCollapse">
  			<br/>
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
  	<div class="row">
  		<nav class="col-md-3 d-none d-md-block bg-light sidebar">
  			<div class="list-group"  id="accordion">
  				<a href="MyLibrary" class="list-group-item list-group-item-success">个人信息查看</a>
  				<a href="MyBorrow" class="list-group-item list-group-item-info ">当前借阅</a>
  				<a href="InformChange" class="list-group-item list-group-item-warning">信息修改</a>
  				<a href="changePassword" class="list-group-item list-group-item-danger">密码修改</a>
  			</div>
  		</nav>
  		<div class="col-md-9">
  			<h3>当前借阅</h3><hr/>
  			<h6>当前借阅 (${sizeBorrow}) 本 / 最大借阅（不限量）</h6>
  			<div class="table-responsive">
  				<table class="table">
					<thead><tr>
						<th>序号</th>
						<th>条码号</th>
						<th>书名</th>
						<th>作者</th>
						<th>可持有时间</th>
						<th>逾期惩罚费率</th>
						<th>借阅日期</th>
<%--						<th>操作</th>--%>
					</tr></thead>
					<tbody><c:forEach items="${myborrow}" var="inform" varStatus="status"><tr>
								<td>${status.count}</td>
								<td>${inform.bookcode}</td>
								<td>${inform.bookname}</td>
								<td>${inform.bookauthor}</td>
								<td>${holdingUsers.holday}</td>
								<td>${holdingUsers.rate}</td>
								<td>${inform.borrowerdate}</td>
<%--								<td><form action="returnBook" method=post>--%>
<%--									<input type="hidden" name="bookcode" value="${inform.bookcode}"/>--%>
<%--									<input type="hidden" name="userid" value="${holdingUsers.id}"/>--%>
<%--									<button type="submit" class="btn btn-Success btn-lg">归还<span class="caret"></span></button>--%>
<%--								</form></td>--%>
					</tr></c:forEach></tbody>
				</table>
  			</div>
  		</div>
  	</div>
  </body>
</html>
