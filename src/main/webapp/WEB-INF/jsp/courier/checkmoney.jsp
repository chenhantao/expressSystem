<%@page import="cn.edu.cqu.cht.service.StationService"%>
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
	function changlimit() {
		var limit=document.getElementById("change").value;
		location.href = "${path}/station/checkmoney?page=1&limit="+limit;
	}
</script>
</head>
<body>
<div align="center">
	<c:choose>
	<c:when test="${page.pages == 0 }">
		<h2 style="color: red;">您还没有接过单</h2>
	</c:when>
	<c:otherwise>
	<table class="table table-hover">
	<thead>
          <tr>
            <th>订单号</th>
            <th>订单状态</th>
            <th>时间</th>
            <th>报酬(共收入${total })</th>
          </tr>
	</thead>
	<c:forEach begin="0" step="1" items="${userlist}" var="list" varStatus="userlist">
	<tbody>
		<tr>
            <td>${list.orderId}</td>
			<td>
				<c:choose>
					<c:when test="${list.orderState == 0 }">
						未完成
					</c:when>
					<c:when test="${list.orderState == 1 }">
						已完成
					</c:when>
				</c:choose>
			</td>
			<td>${list.time}</td>
			<td>${list.salary }</td>
        </tr>
	</tbody>
    </c:forEach>
    </table>
        <ul class="pager">
        	<c:choose>
        		<c:when test="${page.pageNum == 1}">
        		</c:when>
        		<c:otherwise>
        			<li><a href="${path}/courier/checkmoney?page=${page.firstPage}&limit=${limit}">首页</a></li>
    				<li><a href="${path}/courier/checkmoney?page=${page.prePage}&limit=${limit}">&laquo;上一页</a></li>
    			</c:otherwise>
    		</c:choose>
    		<c:choose>
    			<c:when test="${page.pageNum == page.pages }"></c:when>
    			<c:otherwise>
    				<li><a href="${path}/courier/checkmoney?page=${page.nextPage}&limit=${limit}">下一页&raquo;</a></li>
    				<li><a href="${path}/courier/checkmoney?page=${page.lastPage}&limit=${limit}">最后页</a></li>
    			</c:otherwise>
    		</c:choose>
    		<li>当前第${page.pageNum}页</li>
    		<li>共${page.pages}页</li>
    		<li>每页显示</li>
    		<li><input id="change" type="text" style="width: 50px;"></li>
    		<li>条数据   <button type="button" class="btn btn-info btn-sm" onclick="changlimit()">确认</button></li>
		</ul>
		</c:otherwise>
	</c:choose>
</div>
</body>
</html>