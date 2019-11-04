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
    <title>Login surface</title>
    <link rel="stylesheet" href="<%=basePath%>\\bootstrap-4.0.0-dist\\css\\bootstrap.min.css">
    <link rel="stylesheet" href="<%=basePath%>\\bootstrap-4.0.0-dist\\mycss\\cover.css">
      <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="<%=basePath%>/bootstrap-4.0.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
  </head>
  
  <body class="text-center" style="overflow-x:hidden; overflow-y:hidden">
  	 <div class="cover-container d-flex h-100 p-3 mx-auto flex-column">
      <header class="masthead mb-auto">
        <div class="inner">
          <h3 class="masthead-brand">AdminLogin Page </h3>
          <nav class="nav nav-masthead justify-content-center">
            <a class="nav-link" href="search">书目检索</a>
            <a class="nav-link" href="classify">分类浏览</a>
          </nav>
        </div>
      </header> 

      <main role="main" class="inner cover">
        <h1 class="cover-heading">管理员登陆入口</h1>
        <p class="lead">该界面仅对管理员成员开放</p>
        <form action="adminloginTest" method=post class="form-signin">
        	<label class="sr-only" for="inputPassword">请输入管理员密钥</label>
  			<input type="password" name="input" id="inputPassword" class="form-control" placeholder="请输入管理员密钥" required>
  			<button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
        </form>
        <p class="lead">该界面仅对管理员成员开放</p>
        <c:if test="${Error != null}">
        	<p class="lead" style="color:red">${Error}</p>
        </c:if>
      </main>

      <footer class="mastfoot mt-auto">
        <div class="inner">
          <p>This Page finish in 2019/6/6</p>
        </div>
      </footer>
    </div>
  </body>
</html>
