<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<form action="${path }/user/pay?orderId=${thisorderid}" method="post">
			<div>
				<label class="col-sm-2 control-label">请支付  ${thismoney }</label>
				<div class="col-sm-2">
					<button class="btn btn-primary btn-sm" type="submit">确认支付</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>