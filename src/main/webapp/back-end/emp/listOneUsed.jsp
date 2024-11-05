<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.used.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  UsedVO usedVO = (UsedVO)request.getAttribute("usedVO"); //UsedServlet.java(Controller), 存入req的usedVO物件
	request.getSession().setAttribute("usedVO", usedVO);
%>

<html>
<head>
<title>單一二手商品資料 - listOneUsed.jsp</title>

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
	width: 600px;
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

<table id="table-1">
	<tr><td>
		 <h3>單一二手商品資料 - listOneUsed.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="<%= request.getContextPath() %>/back-end/images/tomcat.png" width="100" height="32" border="0">回首頁</a></h4>
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
		<tr>
			<td><%=usedVO.getUsedNo()%></td>
			<td><%=usedVO.getClassNo()%></td>
			<td><%=usedVO.getSellerNo()%></td>
			<td><%=usedVO.getUsedName()%></td>
			<td><%=usedVO.getUsedProDesc()%></td>
			
			<td>
			    <c:choose>
			        <c:when test="${usedVO.usedNewness == 0}">近全新</c:when>
			        <c:when test="${usedVO.usedNewness == 1}">7成新</c:when>
			        <c:when test="${usedVO.usedNewness == 2}">5成新</c:when>
			        <c:when test="${usedVO.usedNewness == 3}">3成新</c:when>
			        <c:otherwise>未知</c:otherwise>
			    </c:choose>
			</td>
			
			
			<td><%=usedVO.getUsedPrice() %></td>
			<td><%=usedVO.getUsedStocks() %></td>
			
			<!-- 格式化二手商品上架時間 -->
			<td><fmt:formatDate value="<%=usedVO.getUsedLaunchedTime()%>" pattern="yyyy-MM-dd" /></td>
			
			<!-- 格式化二手商品下架時間 -->
			<td>
			    <c:choose>
			        <c:when test="${usedVO.soldTime != null}">
			            <fmt:formatDate value="${usedVO.soldTime}" pattern="yyyy-MM-dd" />
			        </c:when>
			        <c:otherwise>
			            <!-- 如果 soldTime 為空，顯示空字串 -->
			            <span></span>
			        </c:otherwise>
			    </c:choose>
			</td>
			
			<td><%=usedVO.getUsedState()%></td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/used.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="usedNo"  value="<%=usedVO.getUsedNo()%>">
			     <input type="hidden" name="sellerNo"  value="<%=usedVO.getSellerNo()%>">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/used.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="usedNo"  value="<%=usedVO.getUsedNo()%>">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
			
		</tr>
</table>

</body>
</html>