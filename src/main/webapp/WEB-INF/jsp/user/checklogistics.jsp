<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<c:forEach begin="0" step="1" items="${logistics}" var="list" varStatus="logistics">
			<c:choose>
				<c:when test="${!logistics.last }">
					<h4>${list}<br>
					|<br>
					↓<br></h4>
				</c:when>
				<c:otherwise>
					<h4>${list}</h4>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<div>
			<button class="btn btn-info" onclick="javascript:history.back(-1);">返回</button>
		</div>
	</div>
</body>
</html>