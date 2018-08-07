<%@page import="cn.edu.cqu.cht.model.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<title>欢迎使用顺通快递系统</title>
		<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">		
		<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
		<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
		
	</head>
<body>
	<%
	User user=(User)session.getAttribute("loginuser");
	String addr2=user.getAddr2();
	if(addr2==null){
		addr2="";
	}
	String addr3=user.getAddr3();
	if(addr3==null){
		addr3="";
	}
	%>
	<div class="container" align="center">
		<form action="${path }/user/changeuserinfo" method="get" class="form-horizontal">
			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-5">
					<input class="form-control" id="change_user_name" name="change_user_name" type="text" value="<%=user.getUserName() %>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">您的姓名</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_real_name" name="change_real_name" value="<%=user.getUserRealName()%>" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">电话</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_phone" name="change_phone" value="<%=user.getPhoneNum()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_email" name="change_email" value="<%=user.getEmail()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">默认地址</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_addr" name="change_addr" value="<%=user.getAddr1()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">备用地址1</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_addr2" name="change_addr2" value="<%=addr2%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">备用地址2</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="change_addr3" name="change_addr3" value="<%=addr3%>">
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">修改</button>
			</div>
		</form>
	</div>
</body>
</html>