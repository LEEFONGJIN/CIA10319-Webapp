<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.used.model.*"%>

<% //��com.emp.controller.EmpServlet.java��238��s�Jreq��empVO���� (������J�榡�����~�ɪ�empVO����)
   UsedVO usedVO = (UsedVO) request.getAttribute("usedVO");
%>
<!-- line100 -->

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�G��ӫ~�s�W - addUsed.jsp</title>

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
		 <h3>�G��ӫ~�s�W - addUsed.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="/CIA103G2/back-end/images/tomcat.png" width="100" height="100" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��Ʒs�W:</h3>

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="used.do" name="form1">
<table>
	
	
	
	
	<tr>
		<td>�ӫ~���O�s��:</td>
		<td><input type="TEXT" name="classNo" value="<%= (usedVO==null)? "���O�s��" : usedVO.getClassNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>��a�s��:</td>
		<td><input type="TEXT" name="sellerNo" value="<%= (usedVO==null)? " ��a�s��" : usedVO.getSellerNo()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�G��ӫ~�W��:</td>
		<td><input type="TEXT" name="usedName" value="<%= (usedVO==null)? "�ӫ~�W��" : usedVO.getUsedName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�G��ӫ~�y�z:</td>
		<td> 
    <textarea id="usedProDesc" name="usedProDesc"  rows="10" cols="50" maxlength="200" style="width:300"><%= (usedVO==null)? "�п�J�G��ӫ~�y�z" : usedVO.getUsedProDesc()%>
    </textarea><br>
    
    
		
		</td>
	</tr>
	
	<tr>
		<td>�s�«�<br>(0:����s, 1:7���s, 2:5���s, 3:3���s):</td>
		<td><input type="TEXT" name="usedNewness"   value="<%= (usedVO==null)? "�п�J�ӫ~�s�µ{��" : usedVO.getUsedNewness()%>" size="45"/></td>
	</tr>
	<tr>
		<td>����:</td>
		<td><input type="TEXT" name="usedPrice"  value="<%= (usedVO==null)? "1000" : usedVO.getUsedPrice()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�w�s�q:</td>
		<td><input type="TEXT" name="usedStocks"  value="<%= (usedVO==null)? "10" : usedVO.getUsedStocks()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�G��ӫ~���A (0:���W�[, 1:�w�W�[)</td>
		<td><input type="TEXT" name="usedState"  value="<%= (usedVO==null)? "1" : usedVO.getUsedState()%>" size="45"/></td>
	</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>����:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="�e�X�s�W"></FORM>

</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->


</html>