<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
  
  <body>
  	<!-- mabey will be have form error -->
    <div class="container" style="max-width: 960px;">
    	<div class="py-5 text-center">
    		<img src="<%=basePath%>\\img\\book.jpg" class="d-block mx-auto mb-4" style="height:75px;width:75px" >
    		<h2>注册界面</h2>
    		<p class="lead">请在下面的选项中输入您的信息</p>
    	</div>
    	<form action="register/Testing" method=post class="needs-validation" novalidate>
    	<div class="order-md-1">
    		<h4 class="mb-3">基本信息填写</h4>
    			<div class="row">
    				<div class="col-md-6 mb-3">
    					<label for="firstname">姓氏</label>
    					<input type="text" name="usersname" id="firstname" class="form-control" placeholder="" value="" required>
    				</div>
    				<div class="col-md-6 mb-3">
    					<label for="lastname">姓名</label>
    					<input type="text" name="lastname" id="lastname" class="form-control" placeholder="" value="" required>
    				</div>
    			</div>
    	</div>
    	<div class="mb-3">
    		<label for="username">用户名</label>
            <input type="text" class="form-control" name="account" id="username" placeholder="Username" required>
            <div class="invalid-feedback" style="width: 100%;">
              	Your username is required.
            </div>
        </div>
        <div class="mb-3">
    		<label for="password">密码</label>
            <input type="text" class="form-control" name="password" id="password" placeholder="Password" required>
            <div class="invalid-feedback" style="width: 100%;">
              	Your password is required.
            </div>
        </div>
        <div class="mb-3">
        	<label for="inputPhone">请输入您的电话号码</label>
    		<div class="input-group">
    			<div class="input-group-prepend">
    				<span class="input-group-text">Phone:</span>
    			</div>
    			<input type="text" class="form-control" name="usersphone" id="inputPhone" placeholder="Phone Number" required>
    		</div>
        </div>
        <div class="mb-3">
        	<hr class="mb-4">
            <button class="btn btn-primary btn-lg btn-block" type="submit">Continue to checkout</button>
        </div>
        </form>
    </div>
    	<footer class="my-5 pt-5 text-muted text-center text-small">
        <p class="mb-1">&copy; 2019-2020 Jluzh BookMIS</p>
      </footer>
  	<script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdn.bootcss.com/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="<%=basePath%>\\bootstrap-4.0.0-dist\\js\\bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
