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
	<script type="text/javascript">
		function checkNewPassword() {
			var newPassword=document.getElementById("change_new_password").value;
			var confirmNewPsw=document.getElementById("confirm_new_password").value;
			if(newPassword.length >= 8 && newPassword.length <= 16){
				if(newPassword==confirmNewPsw){
					document.getElementById("checkNewPassword").innerHTML = "输入正确";
					return true;
				}else{
					document.getElementById("checkNewPassword").innerHTML = "密码两次输入不一致";
					return false;
				}
			}else{
				alert("密码为8-16位");
				return false;
			}
		}
	</script>
</head>
<body>
	<div class="container" align="center">
		<form action="${path }/station/changestationpassword" class="form-horizontal" method="post">
			<div class="form-group">
				<label class="col-sm-2 control-label">新密码</label>
				<div class="col-sm-5">
					<input class="form-control" id="change_new_password" name="change_new_password" type="password">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-5">
					<input class="form-control" id="confirm_new_password" name="confirm_new_password" type="password" onchange="checkNewPassword()">
					<p id="checkNewPassword" style="color: red;">
				</div>
				
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">修改密码</button>
			</div>
		</form>
	</div>
</body>
</html>