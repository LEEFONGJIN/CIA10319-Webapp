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
    <td>二手賣家編號:<font color="red"><b>*</b></font></td>
    <td><input type="TEXT" name="sellerNo" value="${usedVO.sellerNo}"/></td>
</tr>
<tr>
    <td>二手商品名稱:</td>
    <td><input type="TEXT" name="usedName" value="${usedVO.usedName}" size="45"/></td>
</tr>
<tr>
    <td>二手類別編號:</td>
    <td><input type="TEXT" name="classNo" value="${usedVO.classNo}" size="45"/></td>
</tr>
<tr>
    <td>二手商品描述:</td>
    <td><textarea name="usedProDesc" rows="4" cols="45" maxlength="230" style="resize: none;">${usedVO.usedProDesc}</textarea></td>
</tr>
<tr>
    <td>商品新舊程度: (0: 近全新, 1: 7成新, 2: 5成新, 3: 3成新)</td>
    <td>
        <select name="usedNewness">
            
            <option value="0" ${usedVO.usedNewness == 0 ? 'selected' : ''}>近全新</option>
            <option value="1" ${usedVO.usedNewness == 1 ? 'selected' : ''}>7成新</option>
            <option value="2" ${usedVO.usedNewness == 2 ? 'selected' : ''}>5成新</option>
            <option value="3" ${usedVO.usedNewness == 3 ? 'selected' : ''}>3成新</option>
        </select>
    </td>
</tr>
<tr>
    <td>二手商品單價:(>0)</td>
    <td><input type="TEXT" name="usedPrice" value="${usedVO.usedPrice}" size="45"/></td>
</tr>
<tr>
    <td>商品庫存數量:(>0)</td>
    <td><input type="TEXT" name="usedStocks" value="${usedVO.usedStocks}" size="45"/></td>
</tr>
<tr>
    <td>商品狀態: </td>
    <td>
        <select name="usedState">
            
            <option value="0" ${usedVO.usedState == 0 ? 'selected' : ''}>未上架</option>
            <option value="1" ${usedVO.usedState == 1 ? 'selected' : ''}>上架</option>
        </select>
    </td>
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