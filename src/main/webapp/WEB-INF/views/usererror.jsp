<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>注册页面</title>
<script type="text/javascript" src="/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(function(){
	//按钮添加时间
	$("#register").click(function(){
		getUser();
	});
})

//开户操作
function getUser(){
	window.location.href="openuser";
}

$(function(){
	//返回主页面操作
	$("#back").click(function(){
		
		window.location.href="/";
		
	});
})
</script>
</head>
<body>
	用户不存在，或用户密码不正确，请点击<br/>
	<input type="button" id="register" value="注册">
	<input type="button" id="back" value="返回" />
</body>
</html>