<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>用户列表查询</title>
<style type="text/css">
.test{height:500px; width:750px; border:1px;
 margin-top:90px !important; margin-left:300px !important;
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
<script type="text/javascript" src="../../bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//返回主页面
		$("#back").click(function(){
			
			window.location.href="backmanagemain";
			
		});
	})
	
</script>
</head>

<body class="text-center">
 <div class="test">
      <div class="form-group row" style="height:10px"></div>
       <div class="form-group row">
       <div class="col-md-2"></div>
       <table class="table table-bordered col-md-8">
	<thead>
		<tr>
		<td>用户名</td>
		<td>用户姓名</td>
		<td>用户密码</td>
		<td>修改操作</td>
		<td>删除操作</td>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${userlist}" var="userlist"  begin="0" end="9">
		<tr>
		<td>${userlist.userid}</td>
		<td>${userlist.name}</td>	
		<td>${userlist.userpassword}</td>
		<td><a href="${pageContext.request.contextPath}/updateuser?param=0&userid=${userlist.userid}">alter</a></td>
		<td><a href="${pageContext.request.contextPath}/deleteuser?userid=${userlist.userid}">delete</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div class="col-md-2"></div>
       </div>
        <div class="form-group row" style="height:330px">
       </div>
        <div class="form-group row">
      <div class="col-md-1"></div>
      <div class="col-md-2">
     <input class="btn btn-lg btn-primary btn-default  btn-lg btn-block" type="button" id="back" value="返回主页面"/>
      </div>
      <div class="col-md-6"></div>
      <div class="col-md-2">
       </div>
       <div class="col-md-1"></div>
       </div>
       <div class="form-group row" style="height:50px"></div>
    </div>
  </body>
</html>