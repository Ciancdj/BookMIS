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
  
<%--  <body style="overflow-x:hidden; overflow-y:hidden" class="bg-light">--%>
  <body class="bg-light">
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
  	<div>
      <section class="jumbotron text-center" style="background:white">
        <div class="container">
          <h1 class="jumbotron-heading">管理员首页</h1>
          <p class="lead text-muted">欢迎您成功登陆JluzhBookMis图书管理系统程序后台，请在下方选择您的操作</p>
        </div>
      </section>
      <div class="album py-5">
      	<div class="container">
      		<div class="row">
      		<div class="col-md-6">
              <div class="card mb-6 box-shadow">
                <div class="card-body">
                  <p class="card-text">书籍管理界面，该界面可以对目前图书管理系统中的书籍进行修改、增加、删除</p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                      <form action="adminBook" method=post>
                    	 <button type="submit" class="btn btn-sm btn-outline-secondary">点击此处跳转</button>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6">
              <div class="card mb-6 box-shadow">
                <div class="card-body">
                  <p class="card-text">用户管理系统，通过该界面可以对目前以注册的用户进行操作 </p>
                  <div class="d-flex justify-content-between align-items-center">
                    <div class="btn-group">
                    	<form action="adminAccount" method=post>
                    		 <button type="submit" class="btn btn-sm btn-outline-secondary">点击此处跳转</button>
                    	</form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
			</div>
      	</div><br>
		  <!-- 借阅入口 -->
		  <div class="container">
			  <div class="row">
				  <div class="col-md-6">
					  <div class="card mb-6 box-shadow">
						  <div class="card-body">
							  <p class="card-text">借阅管理界面，该界面可以对已有的图书进行借阅和归还操作</p>
							  <div class="d-flex justify-content-between align-items-center">
								  <div class="btn-group">
									  <!-- 跳转入口 -->
									  <form action="AdminBorrowPage" method=post>
										  <button type="submit" class="btn btn-sm btn-outline-secondary">点击此处跳转</button>
									  </form>
								  </div>
							  </div>
						  </div>
					  </div>
				  </div>
			  </div>
		  </div>
      </div>
  	</div>
  </body>
</html>