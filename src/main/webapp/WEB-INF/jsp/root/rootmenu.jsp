<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
	<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
	<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body style="text-align: center; overflow: hidden;">
	<h4>请选择您的功能</h4>
<ul class="nav nav-pills nav-stacked">
	<li><a href="${path }/root/findallorders" target="iframe_right">查看快递</a></li>
	<li><a href="${path }/root/findallusers" target="iframe_right">查看用户</a></li>
	<li><a href="${path }/root/checkstation" target="iframe_right">审核快递站</a></li>
	<li><a href="${path }/root/findallstations" target="iframe_right">查看快递站</a></li>
	<li><a href="${path }/root/findallcouriers" target="iframe_right">查看快递员</a></li>
	<li><a href="${path }/root/quit" target="_parent">退出</a></li>
</ul>
</body>
</html>