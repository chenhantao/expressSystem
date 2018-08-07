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
<title>欢迎注册顺通快递系统</title>
<style type="text/css">
body {
	padding-top: 50px;
	padding-bottom: 50px;
	background-color: #f5f5f5;
	background: url("${path }/image/background.jpg");
	background-size: 100%;
}

button {
	margin-left: 40px;
	margin-top: 20px;
}
</style>

<script type="text/javascript">
function checkPassword() {
	var passwd1 = document.getElementById("register_password").value;
	var passwd2 = document.getElementById("confirm_password").value;
	if(passwd1.length >= 8 && passwd1.length <= 16){
		if (passwd1 == passwd2) {
			document.getElementById("checkPassword").innerHTML = "输入正确";
			return true;
		} else {
			document.getElementById("checkPassword").innerHTML = "两次密码不一致，请重新输入";
			return false;
		}
	}else{
		alert("密码为8-16位")
		return false;
	}
}

function checkPhone() {
	var phone = document.getElementById("register_phone").value;
	if (/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|)+\d{8})$/.test(phone)) {
		document.getElementById("checkPhone").innerHTML = "输入正确";
		return true;
	} else {
		document.getElementById("checkPhone").innerHTML = "输入手机号不规范";
		return false;
	}
}
function checkAll() {
	var account = document.getElementById("register_account").value;
	var password = document.getElementById("register_password").value;
	var confirm = document.getElementById("confirm_password").value;
	var stationName = document.getElementById("register_station_name").value
	var realName = document.getElementById("register_real_name").value;
	var phone1 = document.getElementById("register_phone").value;
	var addrshow = document.getElementById("addr-show").value;
	var addr = document.getElementById("register_addr").value;
	if(account==""||password==""||confirm==""||realName==""||phone1==""||addr==""||stationName==""||addrshow==""){
		alert("请完整填写您的信息");
		return false;
	}else {
		return true;
	}

}
function check() {
	if(checkAll()&&checkPassword()&&checkPhone()){
		return true;
	}else{
		alert("请核对您填写的信息");
		return false;
	}
}
</script>
</head>
<body>
	<h1 class="text-center">欢迎注册顺通快递站</h1>
	<div class="container" align="center">
		<form action="${path }/register/stationregister" method="post" class="form-horizontal"
			 name="form1" onsubmit="return check()">
			<div class="form-group">
				<label class="col-sm-2 control-label">账户</label>
				<div class="col-sm-5">
					<input class="form-control" id="register_account"
						name="register_account" type="text" placeholder="请输入你喜欢的账户名">
					<c:choose>
						<c:when test="${checkrepeat == true}">
							<p id="checkAccount" style="color: red;">账户重复</p>
						</c:when>
						<c:otherwise></c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">密码</label>
				<div class="col-sm-5">
					<input class="form-control" type="password" id="register_password"
						name="register_password" placeholder="请输入8-16位长度的密码">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">确认密码</label>
				<div class="col-sm-5">
					<input class="form-control" type="password" id="confirm_password"
						placeholder="请再输入一遍密码" onchange="checkPassword()">
					<p id="checkPassword" style="color: red;"></p>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">快递站名称</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="register_station_name"
						name="register_station_name" placeholder="请输入您的快递站名称">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">负责人姓名</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="register_real_name"
						name="register_real_name" placeholder="请输入您的真实姓名">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">电话号码</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="register_phone"
						name="register_phone" placeholder="请输入您的手机号"
						onchange="checkPhone()">
					<p id="checkPhone" style="color: red;">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">请选择地区</label>
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
				<label class="col-sm-2 control-label">地址</label>
				<div class="col-sm-5">
					<input class="form-control" type="text" id="register_addr" name="register_addr" placeholder="请输入您的地址">
				</div>
			</div>
			<div>
				<label for="addr-show">
                	<input type="hidden" value="" id="addr-show" name="addr-show">
                	<input type="hidden" value="" id="addr-show2" name="addr-show2">
            	</label>
			</div>
			<div class="form-group">
				<input type="submit" class="btn btn-primary btn-sm" value="注册">
				<input type="button" name="back" onclick="javascript:history.back(-1);" value="返回" class="btn btn-primary btn-sm">
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