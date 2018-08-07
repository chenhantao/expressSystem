<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
		<title>欢迎使用顺通快递系统</title>
		<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstrap.min.css">
		<link rel="stylesheet" href="${path }/webjars/bootstrap/3.3.5/css/bootstarp.css">
		<script type="text/javascript" src="${path }/webjars/jquery/1.11.1/jquery.min.js"></script>
		<script type="text/javascript" src="${path }/webjars/bootstrap/3.3.5/js/bootstrap.min.js"></script> 
	
	<style type="text/css">
      body {
        padding-top: 10%;
        padding-bottom: 40px;
        background-color: #f5f5f5;
        background: url("${path }/image/background.jpg");
        background-size: 100%;

      }
      button{
      	margin-left: 40px;
      	margin-top: 20px;
      }

      .form-signin {
        max-width: 300px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        background-color: #f5f5f5;
        
        border: 1px solid #e5e5e5;
        -webkit-border-radius: 5px;
           -moz-border-radius: 5px;
                border-radius: 5px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.05);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.05);
                box-shadow: 0 1px 2px rgba(0,0,0,.05);
      }
      .form-signin .form-signin-heading {
        margin-bottom: 10px;
        margin-top: 20px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
   
	<script type="text/javascript">
		function check() {
			var account = document.getElementById("account").value;
			var password = document.getElementById("password").value;
			var type = document.getElementById("type").value;
			if(account.length!=0 && password.length!=0 && (type=="u"||type=="s"||type=="c")){
				return true;
			}else {
				alert("请将账号密码角色都填写完整");
				return false;
			}
		}
	</script>   
   
	</head>
 
  <body>

    <div class="container">
      <form class="form-signin" action="${path }/login/login" method="post" onsubmit="return check()">
        <h2 class="form-signin-heading">请登录</h2>
        <input id="account" name="account" type="text" class="input-block-level" placeholder="请输入用户名">
        <input id="password" name="password" type="password" class="input-block-level" placeholder="请输入密码">
        <select id="type" name="type">
        	<option value=""selected>----请选择----</option>
        	<option value="u">会员</option>
        	<option value="s">快递站</option>
        	<option value="c">快递员</option> 
        </select>
        <a href="${path }/login/findPassword">忘记密码？</a>
        <br>
        <button class="btn btn-large btn-primary" type="submit">登录</button>
        <a href="${path }/login/register"><button class="btn btn-large btn-primary" type="button">注册</button></a>
      </form>	
    </div> <!-- /container -->
  </body>
</html>