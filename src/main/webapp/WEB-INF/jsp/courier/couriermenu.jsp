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
<body>
<body style="text-align: center; overflow: hidden;">
	<h4>请选择您的功能</h4>
<ul class="nav nav-pills nav-stacked">
	<li><a href="${path }/courier/courierinfo" target="iframe_right">我的资料</a></li>
	<li><a href="${path }/courier/courierpassword" target="iframe_right">修改密码</a></li>
	<li><a href="${path }/courier/mystation" target="iframe_right">我的快递站</a></li>
	<li><a href="${path }/courier/findorder" target="iframe_right">接单</a></li>
	<li><a href="${path }/courier/checkorder" target="iframe_right">我的订单</a></li>
	<li><a href="${path }/courier/checkmoney" target="iframe_right">查询收益</a></li>
	<li><a href="${path }/courier/courierquit" target="_parent">退出</a></li>
</ul>
</body>
</body>
</html>