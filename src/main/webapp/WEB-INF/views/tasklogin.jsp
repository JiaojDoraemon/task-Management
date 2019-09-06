<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登录</title>
<script type="text/javascript" src="/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(function(){
	//按钮添加时间
	$("#reset").click(function(){
		geSet();
	});
})

//开户操作
function geSet(){
	window.location.reload(); //刷新页面
}
</script>
</head>
<body>
<form method="post" action="getLogin">

	账号： <input type="text" name="id" />
	密码：<input type="password" name="pwd" />
	<input type="radio" name="choice" id="manage" value="mana"/>管理员
	<input type="radio" name="choice" id="user" value="use"/>用户
	<input type="submit" value="登录"/>
	<input type="button" id="reset" value="重置" />
</form>

</body>
</html>