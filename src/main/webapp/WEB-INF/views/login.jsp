<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mana.pojo.*"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>任务管理系统</title>
<style type="text/css">
form{height:500px; width:750px; border:1px;
 margin-top:90px !important; margin-left:220px !important;
 background-color:#fff;opacity:0.8}
button{margin:50px auto !important}
input{margin-top:10px !important;padding-left:20px !important;}
body{ height:100%;
      background:url(../../image/test.jpg) center no-repeat;
      background-size:100%;}
.row{height:50px;display:flex;} 
[class*="col-"] {
    padding: 0 !important;
    margin:0 !important;
}

.h3{
	margin-top:15px !important;
	}
	
</style>
<link href="../../bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="jquery-3.3.1.js"></script>
<script src="../../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	//按钮添加时间
	$("#reset").click(function(){
		window.location.reload(); //刷新页面
	});
})

</script>
</head>
<body class="text-center">
<%
 User user = (User)session.getAttribute("user");
%>
<div class="container">
	<form class="form-signin" method="post" action="getLogin">
	<div class="form-group row" style="height:100px;"></div>
	<div class="form-group row">
      <div class="col-md-3"></div>
      <label class="col-md-2 control-label text-right  h3 font-weight-normal">账号：</label>
      <div class="col-md-3">
      <input type="text" name="id" class="form-control"/>
      </div>
      <div class="col-md-4"></div>
      </div>
      <div class="form-group row">
      <div class="col-md-3"></div>
      <label class="col-md-2 control-label text-right  h3 font-weight-normal">密码：</label>
      <div class="col-md-3">
      <input type="password" name="pwd" class="form-control"/>
      </div>
      <div class="col-md-2"></div>
      
      </div>
     <div class="form-group row" style="height:80px;"></div>
     <input type="radio" name="choice" id="manage" value="mana"/>管理员
      <input type="radio" name="choice" id="user" value="use"/>用户
	<div class="form-group row">
      <div class="col-md-2"></div>
      
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="submit" value="登录"/>
      </div>
      <div class="col-md-4"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="reset" value="重置" />
       </div>
       <div class="col-md-2"></div>
      </div>
      
  </form>
  </div>
</body>
</html>