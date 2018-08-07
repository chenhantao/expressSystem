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
	<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
	<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
	
	
	<title>欢迎注册顺通快递系统</title>
	
	<style type="text/css">
		body {
			background-image: url("${path }/image/background.jpg");
        	background-size: 100%;
        	padding-top: 20%;
		}
		.cheshi1 { width:900px; height:100px; margin: 0 auto;}
		.cheshi1 img {  width:99px; height:100px;margin-left: 150px;display: inline-block;}
		.cheshi1 img onho:hover {
			
			}
	</style>

</head>
<body>
	<div class="cheshi1">
		<a href="${path }/register/registeruser"><img alt="我是上帝" src="${path }/image/user.png" class="img-responsive"></a>
		<a href="${path }/register/registercourier"><img alt="我是快递员" src="${path }/image/courier.png" class="img-responsive"></a>
		<a href="${path }/register/registerstation"><img alt="我是快递站" src="${path }/image/station.png" class="img-responsive"></a>
	</div>

</body>
</html>