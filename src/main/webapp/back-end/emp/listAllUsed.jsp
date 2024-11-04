<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.used.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    UsedService usedSvc = new UsedService();
    List<UsedVO> list = usedSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有二手商品資料 - listAllUsed.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有二手商品資料 - listAllUsed.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="<%= request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>二手商品編號</th>
		<th>商品類別編號</th>
		<th>會員編號(賣家)</th>
		<th>二手商品名稱</th>
		<th>二手商品描述</th>
		<th>商品新舊程度</th>
		<th>二手商品單價</th>
		<th>商品庫存數量</th>
		<th>二手商品上架時間</th>
		<th>二手商品下架時間</th>
		<th>二手商品狀態</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="usedVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${usedVO.usedNo}</td>
			<td>${usedVO.classNo}</td>
			<td>${usedVO.sellerNo}</td>
			<td>${usedVO.usedName}</td>
			<td>${usedVO.usedProDesc}</td>
			<td>
			    <c:choose>
			        <c:when test="${usedVO.usedNewness == 0}">近全新</c:when>
			        <c:when test="${usedVO.usedNewness == 1}">7成新</c:when>
			        <c:when test="${usedVO.usedNewness == 2}">5成新</c:when>
			        <c:when test="${usedVO.usedNewness == 3}">3成新</c:when>
			        <c:otherwise>未知</c:otherwise>
			    </c:choose>
			</td>

			<td>${usedVO.usedPrice}</td>
			<td>${usedVO.usedStocks}</td>
			
			<!-- 格式化二手商品上架時間 -->
			<td><fmt:formatDate value="${usedVO.usedLaunchedTime}" pattern="yyyy-MM-dd" /></td>
			
			<!-- 格式化二手商品下架時間 -->
			<td>
				<fmt:formatDate value="${usedVO.soldTime}" pattern="yyyy-MM-dd" />
				
			</td>
			
			<td>${usedVO.usedState}</td>
			
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>