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
<script type="text/javascript">
$(function () {
    setTimeout(ChangeTime, 1000);
  });
  function ChangeTime() {
    var time;
    time = $("#time").text();    
    time = parseInt(time);
    time--;
    if (time <= 0) {
      window.location.href = "${path}/base/index";
    } else {
      $("#time").text(time);
      setTimeout(ChangeTime, 1000);
    }
  }
</script>
</head>
<body>
	<div align="center"><h2 style="color: red;">您所申请的快递站未获批准，请耐心等待,<span id="time">5</span>秒钟自动返回</h2></div>
</body>
</html>