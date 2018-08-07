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
		<div>
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
		</div>
		
		<form action="${path }/courier/updatelogistics?orderId=${orderId}" method="post" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">更新物流</label>
				<div class="col-sm-5">
					<input class="form-control" id="update_logistics" name="update_logistics" 
					type="text" placeholder="请严格核实所更新内容">
				</div>
			</div>
			<div class="form-group">
					<h4 style="color: red;">如果快递需离开本站运输时，则选择下一站地点</h4>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">选择地区</label>
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
			<div class="form-group">
				<button class="btn btn-primary btn-sm" type="submit">更新</button>
				<a href="${path }/courier/checkorder"><button class="btn btn-info btn-sm" type="button">返回</button></a>
			</div>
			<!-- 此处省略 -->
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
			<div>
				<label for="addr-show">
	           		<input type="hidden" value="" id="addr-show" name="addr-show">
	           		<input type="hidden" value="" id="addr-show2" name="addr-show2">
	          	</label>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="${path }/static/city.js"></script>
	<script type="text/javascript" src="${path }/static/method.js"></script>
</body>
</html>