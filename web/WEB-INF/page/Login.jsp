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
    <link rel="stylesheet" href="<%=basePath%>bootstrap-4.0.0-dist/css/bootstrap.min.css">
      <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
      <script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
      <script src="<%=basePath%>/bootstrap-4.0.0-dist/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="<%=basePath%>/bootstrap-4.0.0-dist/js/bignumber.js"></script>
	  <script>
		  function Encrypt(){
              var password = $("#inputPassword").val();
			  var len = password.length;
			  var output="";
			  while(--len>=0){
			  	  var ascall = password.charCodeAt(len);
				  var tempE = new BigNumber(ascall).exponentiatedBy("${exponent}").valueOf();
				  var tempN = new BigNumber(tempE).modulo("${modulus}").valueOf();
				  var hex = new BigNumber(tempN).toString(16);
				  var length = hex.length;
				  while(length++<16){
				  	hex="0"+hex;
				  }
				  output+=hex;
			  }
			  $("#inputPassword").val(output.toString());
			  return true;
		  }
	  </script>
  </head>
  
  <body style="overflow-x:hidden; overflow-y:hidden" >
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
          	<form class="form-inline mt-2 mt-md-3" method=post action="register">
           		<button class="btn btn-outline-success my-2 my-sm-0" type="submit">register</button>
          	</form>
  		</div>
  	</nav><br/><br/>
  	<img src="<%=basePath%>\\img\\book.jpg" class="d-block mx-auto mb-4" style="height:150px;width:150px">
  	<div class="text-center  mx-auto" style="max-width: 330px">
  		<form class="form-signin" action="login/Testing" method=post  onsubmit="return Encrypt();">
  			<h1 class="h3 mb-3 font-weight-normal">Sign in</h1>
  			<label class="sr-only" for="inputAccount">Account</label>
  			<input type="text" name="account" id="inputAccount" class="form-control" placeholder="Account" required autofocus>
  			<p><span style="color:red;">${param.msg1}</span></p>
  			<label class="sr-only" for="inputPassword">Password</label>
  			<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
  			<p><span style="color:red;">${param.msg2}</span></p>
  			<button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
  			<div class="col-12 col-md">
            	<small class="d-block mb-3 text-muted">&copy; 2019-2020</small>
          	</div>
  		</form>
  	</div>
  </body>
</html>
