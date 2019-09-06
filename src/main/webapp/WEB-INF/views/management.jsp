<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mana.pojo.*" isELIgnored="false"%>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>管理员页面</title>
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
	//添加用户
	$(function(){
		//按钮添加用户
		$("#main_mbt_ba").click(function(){
			saveUser();
		});
	})
	//余额操作
	function saveUser(){
		window.location.href="saveu";
	}

	//查询所有用户
	$(function(){
		//按钮添加时间
		$("#main_mbt_alluser").click(function(){
			getUser();
		});
	})
	//账单操作
	function getUser(){
		window.location.href="getAllUser";
	}

	//查询用户任务
	$(function(){
		//响应所有任务按钮
		$("#main_mbt_task").click(function(){
			getAlltask();
		});
	})
	//获取所有任务操作
	function getAlltask(){
		window.location.href="getAlltask";
	}
	
	//退出
	$(function(){
		//按钮添加时间
		$("#main_bt_out").click(function(){
			outMain();
		});
	})
	//退出操作
	function outMain(){
		window.location.href="/";
	}

	
</script>
</head>
<body class="text-center">
<div class="container">
 <form class="form-signin">
	<%
	User user=(User)session.getAttribute("user");
	%>
	
	<div class="form-group row" style="height:100px"></div>
	<div class="form-group row" >
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_mbt_ba" value="录入普通用户">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_mbt_alluser" value="查询所有用户">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
      <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_mbt_task" value="查询用户任务信息">
      </div>
      <div class="col-md-1"></div>
      <div class="col-md-4"> 
      </div>
      
       <div class="col-md-1"></div>
       </div>
	   <div class="form-group row" style="height:50px"></div>
       <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="main_bt_out" value="退出">
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row" style="height:50px"></div>
  <!-- <input type="button" id="main_bt_rate" value="汇率"> -->
  </form>
  </div>
</body>
</html>