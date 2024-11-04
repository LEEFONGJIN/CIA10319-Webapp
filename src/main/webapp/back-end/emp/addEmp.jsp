<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.used.model.*"%>

<% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
   UsedVO usedVO = (UsedVO) request.getAttribute("usedVO");
%>
<!-- line100 -->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>二手商品新增 - addUsed.jsp</title>

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
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
</style>

</head>
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>二手商品新增 - addUsed.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="/CIA103G2/back-end/images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="used.do" name="form1">
<table>
	
	
	
	
	<tr>
		<td>商品類別編號:</td>
		<td><input type="TEXT" name="classNo" value="<%= (usedVO==null)? "類別編號" : usedVO.getClassNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>賣家編號:</td>
		<td><input type="TEXT" name="sellerNo" value="<%= (usedVO==null)? " 賣家編號" : usedVO.getSellerNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>二手商品名稱:</td>
		<td><input type="TEXT" name="usedName" value="<%= (usedVO==null)? "商品名稱" : usedVO.getUsedName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>二手商品描述:</td>
		<td> 
    <textarea id="usedProDesc" name="usedProDesc"  rows="10" cols="50" maxlength="200" style="width:300"><%= (usedVO==null)? "請輸入二手商品描述" : usedVO.getUsedProDesc()%>
    </textarea><br>
    
    
		
		</td>
	</tr>
	
	<tr>
		<td>新舊度<br>(0:近全新, 1:7成新, 2:5成新, 3:3成新):</td>
		<td><input type="TEXT" name="usedNewness"   value="<%= (usedVO==null)? "請輸入商品新舊程度" : usedVO.getUsedNewness()%>" size="45"/></td>
	</tr>
	<tr>
		<td>價格:</td>
		<td><input type="TEXT" name="usedPrice"  value="<%= (usedVO==null)? "1000" : usedVO.getUsedPrice()%>" size="45"/></td>
	</tr>
	<tr>
		<td>庫存量:</td>
		<td><input type="TEXT" name="usedStocks"  value="<%= (usedVO==null)? "10" : usedVO.getUsedStocks()%>" size="45"/></td>
	</tr>
	<tr>
		<td>二手商品狀態 (0:未上架, 1:已上架)</td>
		<td><input type="TEXT" name="usedState"  value="<%= (usedVO==null)? "1" : usedVO.getUsedState()%>" size="45"/></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增"></FORM>

</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->


</html>