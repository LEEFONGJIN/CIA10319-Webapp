<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.used.model.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
 
// pageContext.setAttribute("list",list);
// 	pageContext.setAttribute("sellerNo",sellerNo);
// 	pageContext.getAttribute("list");
// 	String sellerNoPara = request.getParameter("sellerNo");
// 	int sellerNo = Integer.valueOf(sellerNoPara);

// List<UsedVO> list = (List<UsedVO>)request.getAttribute("list"); //EmpServlet.java(Controller), �s�Jreq��list UsedVO����
 	 UsedService usedSvc = new UsedService();
     List<UsedVO> list = usedSvc.getAll((Integer)session.getAttribute("sellerNo"));
      pageContext.setAttribute("list",list);
        
        
 
%>


<html>
<head>
<title>��a�Ҧ��G��ӫ~��� - listSellerAllUsed.jsp</title>

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


<table id="table-1">
	<tr><td>
		 <h3>��a�Ҧ��G��ӫ~��� - listSellerAllUsed.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="<%= request.getContextPath()%>/back-end/images/tomcat.png" width="100"  border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�G��ӫ~�s��</th>
		<th>�ӫ~���O�s��</th>
		<th>�|���s��(��a)</th>
		<th>�G��ӫ~�W��</th>
		<th>�G��ӫ~�y�z</th>
		<th>�ӫ~�s�µ{��</th>
		<th>�G��ӫ~���</th>
		<th>�ӫ~�w�s�ƶq</th>
		<th>�G��ӫ~�W�[�ɶ�</th>
		<th>�G��ӫ~�U�[�ɶ�</th>
		<th>�G��ӫ~���A</th>
		<th>�ק�</th>
		<th>�R��</th>
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
			        <c:when test="${usedVO.usedNewness == 0}">����s</c:when>
			        <c:when test="${usedVO.usedNewness == 1}">7���s</c:when>
			        <c:when test="${usedVO.usedNewness == 2}">5���s</c:when>
			        <c:when test="${usedVO.usedNewness == 3}">3���s</c:when>
			        <c:otherwise>����</c:otherwise>
			    </c:choose>
			</td>

 
			<td>${usedVO.usedPrice}</td>
			<td>${usedVO.usedStocks}</td>
			
			<!-- �榡�ƤG��ӫ~�W�[�ɶ� -->
			<!-- �榡�ƤG��ӫ~�W�[�ɶ� -->
			<td><fmt:formatDate value="${usedVO.usedLaunchedTime}" pattern="yyyy-MM-dd" /></td>
			
			<!-- �榡�ƤG��ӫ~�U�[�ɶ� -->
			<td>
				<fmt:formatDate value="${usedVO.soldTime}" pattern="yyyy-MM-dd" />
				<%-- �ˬd soldTime �O�_���� --%>
				
			</td>
			
			<td>${usedVO.usedState}</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/used.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     
			     <input type="hidden" name="sellerNo"  value="${usedVO.sellerNo}">
			     <input type="hidden" name="usedNo"  value="${usedVO.usedNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/emp/used.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="usedNo"  value="${usedVO.usedNo}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
					
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>