<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.used.model.*"%>

<% //��com.emp.controller.EmpServlet.java��163��s�Jreq��usedVO���� (�����q��Ʈw���X��usedVO, �]�i�H�O��J�榡�����~�ɪ�usedVO����)
   UsedVO usedVO = (UsedVO) request.getAttribute("usedVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>�G��ӫ~��ƭק� - update_used_input.jsp</title>

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
		 <h3>�G��ӫ~��ƭק� - update_used_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="<%= request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<h3>��ƭק�:</h3>

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
		<td>�G���a�s��:<font color=red><b>*</b></font></td>
		<td><%=usedVO.getSellerNo()%>
		<input type="hidden" name="sellerNo" value="<%=usedVO.getSellerNo()%>"/></td>
	</tr>
	<tr>
		<td>�G��ӫ~�s��:<font color=red><b>*</b></font></td>
		<td><%=usedVO.getUsedNo()%></td>
	</tr>
	<tr>
		<td>�G��ӫ~�W��:</td>
		<td><input type="TEXT" name="usedName" value="<%=usedVO.getUsedName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�G�����O�s��:</td>
		<td><input type="TEXT" name="classNo" value="<%=usedVO.getClassNo()%>" size="45"/></td>
	</tr>
	<tr>
<!-- 		<td>�G��ӫ~�y�z:</td> -->
<%-- 		<td><input type="TEXT" name="usedProDesc"   value="<%=usedVO.getUsedProDesc()%>" size="45"/></td> --%>
		<td>�G��ӫ~�y�z:</td>
		<td><textarea name="usedProDesc" rows="4" cols="45" maxlength="230" style="resize: none;"><%=usedVO.getUsedProDesc()%></textarea></td>
	
	</tr>
	<tr>
    <td>�ӫ~�s�µ{��:</td>
    <td>
        <select name="usedNewness">
            <option value="0" <%= usedVO.getUsedNewness() == 0 ? "selected" : "" %>>����s</option>
            <option value="1" <%= usedVO.getUsedNewness() == 1 ? "selected" : "" %>>7���s</option>
            <option value="2" <%= usedVO.getUsedNewness() == 2 ? "selected" : "" %>>5���s</option>
            <option value="3" <%= usedVO.getUsedNewness() == 3 ? "selected" : "" %>>3���s</option>
        </select>
    </td>
</tr>

	<tr>
		<td>�G��ӫ~���:(>0)</td>
		<td><input type="TEXT" name="usedPrice"   value="<%=usedVO.getUsedPrice()%>" size="45"/></td>
	</tr>
	<tr>
		<td>�ӫ~�w�s�ƶq:(>0)</td>
		<td><input type="TEXT" name="usedStocks"  value="<%=usedVO.getUsedStocks()%>" size="45"/></td>
	</tr>
	<tr>
    <td>�ӫ~���A: (0: ���W�[, 1: �W�[)</td>
    <td>
        <select name="usedState">
            <option value="0" <%= usedVO.getUsedState() == 0 ? "selected" : "" %>>���W�[</option>
            <option value="1" <%= usedVO.getUsedState() == 1 ? "selected" : "" %>>�W�[</option>
        </select>
    </td>
</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>����:<font color=red><b>*</b></font></td> -->
<!-- 		<td><select size="1" name="deptno"> -->
<%-- 			<c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%-- 				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname} --%>
<%-- 			</c:forEach> --%>
<!-- 		</select></td> -->
<!-- 	</tr> -->

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="usedNo" value="<%=usedVO.getUsedNo()%>">
<input type="submit" value="�e�X�ק�"></FORM>
</body>



<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%-- <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" /> --%>
<%-- <script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script> --%>

<style>
/*   .xdsoft_datetimepicker .xdsoft_datepicker { */
/*            width:  300px;   /* width:  300px; */ 
/*   } */
/*   .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box { */
/*            height: 151px;   /* height:  151px; */ 
/*   } */
</style>

<script>
//         $.datetimepicker.setLocale('zh');
//         $('#f_date1').datetimepicker({
//            theme: '',              //theme: 'dark',
//  	       timepicker:false,       //timepicker:true,
//  	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
//  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%--  		   value: '<%=empVO.getHiredate()%>', // value:   new Date(), --%>
//            disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
//            startDate:	            '2017/07/10',  // �_�l��
//            minDate:               '-1970-01-01', // �h������(���t)���e
//            maxDate:               '+1970-01-01'  // �h������(���t)����
//         });
        
        
   
        // ----------------------------------------------------------�H�U�ΨӱƩw�L�k��ܪ����-----------------------------------------------------------

        //      1.�H�U���Y�@�Ѥ��e������L�k���
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.�H�U���Y�@�Ѥ��᪺����L�k���
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.�H�U����Ӥ�����~������L�k��� (�]�i���ݭn������L���)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>