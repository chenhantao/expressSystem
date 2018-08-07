<%@page import="cn.edu.cqu.cht.model.Station"%>
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
	<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
	<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
	<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
	<script type="text/javascript" src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
		
<title>Insert title here</title>
</head>
<body>
	<%
		Station station=(Station)session.getAttribute("loginstation");
	%>
	
	<div class="container" align="center">
		<form action="${path }/station/changestation" method="get" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">快递站名称</label>
				<div class="col-sm-5">
					<input class="form-control" id="change_user_name" name="change_user_name" type="text" value="<%=station.getStationName()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">负责人</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_real_name" name="change_real_name" value="<%=station.getPrincipal()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">电话</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_phone" name="change_phone" value="<%=station.getPhone()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">省</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" id="change_email" name="change_email" value="<%=station.getProvince()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">市</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" id="change_addr" name="change_addr" value="<%=station.getCity()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">区/县</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" id="change_addr2" name="change_addr2" value="<%=station.getArea()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">详细地址</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_station_addr" name="change_station_addr" value="<%=station.getAddress()%>">
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">修改</button>
			</div>
		</form>
	</div>
</body>
</html>