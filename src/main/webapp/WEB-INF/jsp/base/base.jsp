<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstarp.css">
<script type="text/javascript" src="${path}/webjars/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="${path}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
<title>欢迎使用顺通快递系统</title>
<style type="text/css">
			<style type="text/css">
			input {
				max-width: 500px;
				width: auto;
				}
			.navbar-nav li:hover{
    			display: block;
    			background: #f5f5f5;    
				}
</style>

</head>
<body>
	<!-- 
	<iframe src="${path}/base/title" name="base_top" id="base_top" width="100%" height="100px" frameborder="0"></iframe>-->
	<nav class="navbar navbar-default" role="navigation">
			<div class="container-fluid">
				<div class="navbar-header">
					<span class="navbar-brand" style="font-weight: 700;">顺通</span>
				</div>
			<div>
			<ul	class="nav navbar-nav">
				<li class="active"><a href="${path}/base/index" target="_parent">首页</a></li>
				<li><a href="${path }/base/aboutUs" target="base_down">关于我们</a></li>
				<li><a href="${path}/kotlin/find" target="base_down">kotlin测试</a></li>
			</ul>
			<ul class="nav navbar-nav" style="float: right;">
				<li class="active"><a href="${path }/base/login" target="_parent">登录</a></li>
				<li class="active"><a href="${path }/base/register" target="_parent">注册</a></li>
			</ul>
			</div>
			</div>
		</nav>
	<div>
		<iframe src="${path}/base/welcome" name="base_down" id="base_down" frameborder="0" width="100%" height="1000px"></iframe>
	</div>
</body>
</html>