<%@page import="cn.edu.cqu.cht.model.User"%>
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
	function checkSenderAddr() {
		var addr1=document.getElementById("new_sender_addr").value;
		var addr2=document.getElementById("new_sender_addr2").value;
		if(addr1.length != 0 || addr2.length != 0){
			return true;
		}else {
			alert("请检查寄件地址，两种方式二选一")
			return false;
		}
	}
	
	function banSelect() {
		var addr1=document.getElementById("new_sender_addr");
		var addr2=document.getElementById("new_sender_addr2");
		addr1.removeAttribute("disabled");
		addr2.setAttribute("disabled","true");
		addr2.value="";
	}	
	function banInput() {
		var addr1=document.getElementById("new_sender_addr");
		var addr2=document.getElementById("new_sender_addr2");
		addr2.removeAttribute("disabled");
		addr1.setAttribute("disabled","true");
		addr1.value="";
	}
	function openWeight() {
		var weight = document.getElementById("new_weight");
		weight.removeAttribute("disabled");
	}
	
	function checkWeight() {
		var weight = document.getElementById("new_weight").value;
		var kind = document.getElementById("new_kind").value;
		if(kind == "小件"){
			if(/^[0-9]+([.]{1}[0-9]{1,2})?$/.test(weight)){
				if(weight>0&&weight<=5.00){
					return true;
				}else {
					alert("重量请输入5kg以内或者选择大件");
					return false;
				}
			}else {
				alert("重量请输入两位小数以内");
				return false;
			}
		}else {
			if(/^[0-9]+([.]{1}[0-9]{1,2})?$/.test(weight)){
				if(weight>5.00){	
					return true;
				}else{
					alert("重量请输入5kg以外或者选择小件");
					return false;
				}
			}else {
				alert("重量请输入两位小数以内");
				return false;
			}
		}

	}
	
	function checkAll() {
		var senderName = document.getElementById("new_sender_name").value;
		var senderPhone = document.getElementById("new_sender_phone").value;
		var recipientName = document.getElementById("new_recipient_name").value;
		var recipientPhone = document.getElementById("new_recipient_phone").value;
		var rAddr = document.getElementById("new_recipient_addr").value;
		var kind = document.getElementById("new_kind").value;
		var weight = document.getElementById("new_weight").value;
		var addshow = document.getElementById("addr-show").value;
		var addshow2 = document.getElementById("addr-show2").value;
		
		var s_province=document.getElementById("s_province").value;
		var s_city=document.getElementById("s_city").value;
		var s_area=document.getElementById("s_area").value;
		var r_province=document.getElementById("r_province").value;
		var r_city=document.getElementById("r_city").value;
		var r_area=document.getElementById("r_area").value;
		
		if(senderName.length!=0 && senderPhone.length!=0 && recipientName.length!=0 && recipientPhone.length!=0 && rAddr.length!=0 && kind.length!=0 && weight.length!=0&&
				addshow.length!=0 && addshow2.length!=0 && checkSenderAddr() && checkWeight() && s_province != "a" && s_city != "a" &&
				s_area != "a" && r_province != "a" && r_city != "a" && r_area != "a"){
			return true;
		}else{
			alert("请核对您填写的信息");
			return false;
		}
	}
</script>
	
</head>
<body>

	<%
		User user = (User)session.getAttribute("loginuser");
		String historyAddr = user.getHistoryAddr();
		String addr2=user.getAddr2();
		String addr3=user.getAddr3();
		if(historyAddr == null){
			historyAddr = "";
		}
		if(addr2==null){
			addr2= "";
		}
		if(addr3==null){
			addr3="";
		}
	%>
	<div class="container" align="center">
		<form action="${path }/user/sendexpress" method="get" class="form-horizontal" onsubmit="return checkAll()">
			<div class="form-group">
				<label class="col-sm-2 control-label">寄件人姓名</label>
				<div class="col-sm-2">
					<input class="form-control" id="new_sender_name"
						name="new_sender_name" type="text" value="<%=user.getUserRealName()%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">寄件人电话</label>
				<div class="col-sm-2">
					<input class="form-control" id="new_sender_phone"
						name="new_sender_phone" type="text" value="<%=user.getPhoneNum()%>">
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">请选择寄件地区</label>
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
			<p align="center" style="color: red;">寄件地址(请按选择按钮来确认地址)</p>
			<div class="form-group">
				<label class="col-sm-2 control-label">寄件详细地址</label>
				<div class="col-sm-6">
					<input class="form-control" id="new_sender_addr" name="new_sender_addr" type="text"	value="<%=user.getAddr1()%>" onclick="banSelect()">
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-primary btn-sm" onclick="banSelect()">选择</button>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">选择地址</label>
				<div class="col-sm-6">
					<select class="form-control" id="new_sender_addr2" name="new_sender_addr2" onclick="banInput()">
						<option value=""></option>
						<option value="<%=addr2%>"><%=addr2 %></option>
						<option value="<%=addr3%>"><%=addr3%></option>
					</select>
				</div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-primary btn-sm" onclick="banInput()">选择</button>
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">收件人姓名</label>
				<div class="col-sm-2">
					<input class="form-control" id="new_recipient_name"
						name="new_recipient_name" type="text">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">寄件人电话</label>
				<div class="col-sm-2">
					<input class="form-control" id="new_recipient_phone"
						name="new_recipient_phone" type="text">
				</div>
			</div>
			<div class="form-group">
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
			<div class="form-group">
				<label class="col-sm-2 control-label">收件人地址</label>
				<div class="col-sm-6">
					<input class="form-control" id="new_recipient_addr"
						name="new_recipient_addr" type="text" value="<%=historyAddr%>">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">种类</label>
				<div class="col-sm-2">
					<select class="form-control" id="new_kind" name="new_kind" onchange="openWeight()">
						<option></option>
						<option value="小件">小件(小于5kg)</option>
						<option value="大件">大件(大于5kg)</option>
					</select>
				</div>
				<label class="col-sm-2 control-label">重量(kg)</label>
				<div class="col-sm-1">
					<input class="form-control" id="new_weight" name="new_weight" type="text" onchange="checkWeight()" disabled="disabled">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-2 control-label">备注</label>
				<div class="col-sm-6">
					<input class="form-control" id="new_notes" name="new_notes" type="text" placeholder="选填">
				</div>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-primary btn-sm">去支付</button>
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