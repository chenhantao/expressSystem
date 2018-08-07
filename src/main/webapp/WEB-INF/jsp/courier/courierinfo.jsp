<%@page import="cn.edu.cqu.cht.model.Courier"%>
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
		Courier courier=(Courier)session.getAttribute("logincourier");
	%>
	
	<div class="container" align="center">
		<form action="${path }/courier/changecourier" method="get" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_real_name" name="change_real_name" value="<%=courier.getCourierName()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">电话</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_phone" name="change_phone" value="<%=courier.getCourierPhone()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">省</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" id="change_email" name="change_email" value="<%=courier.getProvince() %>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">市</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" id="change_addr" name="change_addr" value="<%=courier.getCity() %>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">区/县</label>
				<div class="col-sm-2">
					<input class="form-control" type="text" id="change_addr2" name="change_addr2" value="<%=courier.getArea() %>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">更改地区</label>
				<div class="col-sm-2" style="display: inline;">
					<select id="s_province" name="s_province" class="form-control" onchange="showSProvince(this)">
						<option value="a">---请选择省份---</option>
					</select>
				</div>
				<div class="col-sm-2" style="display: inline;">
					<select id="s_city" name="s_city" class="form-control" onchange="showSCity(this)">
						<option value="a">---请选择城市---</option>
					</select>
				</div>
				<div class="col-sm-2" style="display: inline;">
					<select id="s_area" name="s_area" class="form-control" onchange="showSArea(this)">
						<option value="a">---请选择区县---</option>
					</select>
				</div>
			</div>
			<div>
				<label for="addr-show">
                	<input type="hidden" value="" id="addr-show" name="addr-show">
                	<input type="hidden" value="" id="addr-show2" name="addr-show2">
            	</label>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">修改</button>
			</div>
			<div class="form-group" style="display: none;">
				<label class="col-sm-2 control-label">请选择收件地区</label>
				<div class="col-sm-2" style="display: inline;">
					<select id="r_province" name="r_province" class="form-control" onchange="showRProvince(this)">
						<option value="a">---请选择省份---</option>
					</select>
				</div>
				<div class="col-sm-2" style="display: inline;">
					<select id="r_city" name="r_city" class="form-control" onchange="showRCity(this)">
						<option value="a">---请选择城市---</option>
					</select>
				</div>
				<div class="col-sm-2" style="display: inline;">
					<select id="r_area" name="c_area" class="form-control" onchange="showRArea(this)">
						<option value="a">---请选择区县---</option>
					</select>
				</div>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${path }/static/city.js"></script>
	<script type="text/javascript" src="${path }/static/method.js"></script>
</body>
</html>