<%@ page import="cn.edu.cqu.cht.model.Kotlin" %>
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

<link rel="stylesheet"
	href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<%--<script type="text/javascript">
$(function () {
    setTimeout(ChangeTime, 1000);
  });
  function ChangeTime() {
    var time;
    time = $("#time").text();    
    time = parseInt(time);
    time--;
    if (time <= 0) {
      window.location.href = "${path}/base/welcome";
    } else {
      $("#time").text(time);
      setTimeout(ChangeTime, 1000);
    }
  }
</script>--%>
</head>
<body>
	<%--<div>支付成功,<span id="time">5</span>秒钟自动跳到首页</div>--%>
	<%
		Kotlin kotlin = (Kotlin) session.getAttribute("kotlin");
	%>
	<div class="container" align="center">
		<form action="${path }/courier/changecourier" method="get" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">id</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="kotlin_id" name="kotlin_id" value="<%=kotlin.getId()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">account</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="kotlin_account" name="kotlin_account" value="<%=kotlin.getAccount()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">password</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="kotlin_password" name="kotlin_password" value="<%=kotlin.getPassword()%>">
				</div>
			</div>

		</form>
	</div>
</body>
</html>