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
  </head>
  
  <body>
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
  				<a href="adminBook" class="list-group-item list-group-item-success">书籍管理界面</a>
  				<a href="adminAccount" class="list-group-item list-group-item-info ">用户管理系统</a>
				<a href="AdminBorrowPage" class="list-group-item list-group-item-danger">借阅管理系统</a>
  			</div>
  		</nav>
  		<div class="col-md-9">
  			<h3>用户管理系统</h3><hr/>
  			<div class="table-responsive">
  				<table class="table">
					<thead><tr>
						<th>用户编号</th>
						<th>用户账户</th>
						<th>用户姓名</th>
						<th>用户联系方式</th>
						<th>用户权限等级</th>
						<th>用户最长借阅时间</th>
						<th>用户预期费率</th>
						<th>状态设置</th>
						<th>特殊操作</th>
					</tr></thead>
					<tbody><c:forEach items="${allUsers}" var="users" varStatus="status">
						<c:if test="${inform.power == 1}">
							<tr class="table-success">
								<td>${users.id}</td>
								<td>${users.account}</td>
								<td>${users.usersname}</td>
								<td>${users.usersphone}</td>
								<td>${users.power}</td>
								<td>${users.holday}</td>
								<td>${users.rate}</td>
								<td>
									<form class="form-signin" action="AdminAccounttState" method=post>
										<input type="hidden" name="operaId" value="${users.id}">
										<c:if test="${users.state == '1'}">
											<input type="hidden" name="operaValue" value="0">
											<button type="button" class="btn btn-success disabled">正常</button>
											<button type="submit" class="btn btn-default">冻结</button>
										</c:if>
										<c:if test="${users.state == '0'}">
											<input type="hidden" name="operaValue" value="1">
											<button type="submit" class="btn btn-default">正常</button>
											<button type="button" class="btn btn-success disabled">冻结</button>
										</c:if>
									</form>
								</td>
								<td>
									<form class="form-signin" action="AdminAccountState" method=post>
										<input type="hidden" name="operaId" value="${users.id}">
										<button type="button" class="btn btn-danger">注销</button>
									</form>
								</td>
							</tr>
						</c:if>
						<c:if test="${inform.overstate != true}">
							<tr class="table-warning">
								<td>${users.id}</td>
								<td>${users.account}</td>
								<td>${users.usersname}</td>
								<td>${users.usersphone}</td>
								<td>${users.power}</td>
								<td>${users.holday}</td> 
								<td>${users.rate}</td>
								<td>
									<form class="form-signin" action="AdminAccountState" method=post>
										<input type="hidden" name="operaId" value="${users.id}">
										<c:if test="${users.state == '1'}">
											<input type="hidden" name="operaValue" value="0">
											<button type="submit" class="btn btn-success disabled">正常</button>
											<button type="submit" class="btn btn-default">冻结</button>
										</c:if>
										<c:if test="${users.state == '0'}">
											<input type="hidden" name="operaValue" value="1">
											<button type="submit" class="btn btn-default">正常</button>
											<button type="submit" class="btn btn-success disabled">冻结</button>
										</c:if>
									</form>
								</td>
								<td>
									<form class="form-signin" action="AdminAccountDelete" method=post>
										<input type="hidden" name="operaId" value="${users.id}">
										<button type="submit" class="btn btn-danger">注销</button>
									</form>
								</td>
							</tr>
						</c:if>		
					</c:forEach></tbody>
				</table>
  			</div>
  		</div>
  	</div>

  </body>
</html>