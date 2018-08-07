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
		
		<link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="${path}/webjars/bootstrap/3.3.5/css/bootstarp.css">
		<script type="text/javascript" src="${path}/webjars/jquery/1.11.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path}/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
	
		<title>欢迎使用顺通快递系统</title>
		
		
		<style type="text/css">
			input {
				max-width: 500px;
				width: auto;
				}
			.navbar-nav li:hover{
    			display: block;
    			background: #f5f5f5;    
				}
		</style>
				
		<script type="text/javascript">
			function test() {
				var str=document.getElementById("phoneOrOrderId").value;
				if(str.length==11){
					return checkMobile(str);
				}else if(str.length==20){
					return isRealNum(str);
				}else {
					alert("输入不符合规范！");
					return false;
				}

			}
			function isRealNum(val){
			    // isNaN()函数 把空串 空格 以及NUll 按照0来处理 所以先去除
			    if(val === "" || val ==null){
			        return false;
			    }
			    if(!isNaN(val)){
			        return true;
			    }else{
			        return false;
			    }
			}  
			
			function checkMobile(s){  
			    if(/^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(14[0-9]{1})|)+\d{8})$/.test(s) )   
			    {   
			        return true;   
			    }else{
			    	alert("手机号错误");
			        return false;   
			    }   
			}
		</script>
	</head>
	<body style="margin: 0px; text-align: center; border: 0;">
		<div class="container" align="center">
		<form action="${path }/base/searchOrder" target="base_down" onsubmit="return test()" method="get">
		<div class="input-group col-md-3" style="margin-top:20%;">
			<img alt="欢迎使用顺通" src="${path}/image/title.png" >
			<div style="display: inline;">
       			<input type="text" class="form-control" placeholder="请输入手机号或者订单号" name="phoneOrOrderId" id="phoneOrOrderId"/>
       		</div>
       		<div style="display: inline;">
        		<button type="submit" class="btn btn-info btn-search">查找</button>
        	</div>
 		</div>
 		</form>
 		</div>
	</body>
</html>