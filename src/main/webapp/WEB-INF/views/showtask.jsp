<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.mana.pojo.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html style="height:100%; overflow:hidden;">
<head>
<meta charset="UTF-8">
<title>账单查询</title>
<style type="text/css">
.test{height:500px; width:950px; border:1px;
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
			
			window.location.href="backusermain";
			
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
		<td>任务标题</td>
		<td>任务内容</td>
		<td>添加时间</td>
		<td>任务进度</td>
		<td>修改操作</td>
		<td>删除操作</td>
	</tr>
	</thead>
	<tbody>
		<c:forEach items="${task}" var="task" varStatus="status" begin="0" end="9">
		<tr>
		<td>${task.title}</td>
		<td>${task.content}</td>	
		<td>${task.time}</td>
		<td>${task.schedule}</td>
		<td><a href="${pageContext.request.contextPath}/updatetask?param=0&taskid=${task.taskid}">alter</a></td>
		<td><a href="${pageContext.request.contextPath}/deletetask?taskid=${task.taskid}">delete</a></td>
		<td><input type="hidden" name="task[${status.index}].taskid" value="${task.taskid}"/></td>
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