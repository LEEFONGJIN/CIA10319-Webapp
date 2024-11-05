<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.used.model.*"%>

<% //見com.emp.controller.EmpServlet.java第163行存入req的usedVO物件 (此為從資料庫取出的usedVO, 也可以是輸入格式有錯誤時的usedVO物件)
   UsedVO usedVO = (UsedVO) request.getAttribute("usedVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>二手商品資料修改 - update_used_input.jsp</title>

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
		 <h3>二手商品資料修改 - update_used_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="<%= request.getContextPath()%>/back-end/images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

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
		<td>二手賣家編號:<font color=red><b>*</b></font></td>
		<td><%=usedVO.getSellerNo()%>
		<input type="hidden" name="sellerNo" value="<%=usedVO.getSellerNo()%>"/></td>
	</tr>
	<tr>
		<td>二手商品編號:<font color=red><b>*</b></font></td>
		<td><%=usedVO.getUsedNo()%></td>
	</tr>
	<tr>
		<td>二手商品名稱:</td>
		<td><input type="TEXT" name="usedName" value="<%=usedVO.getUsedName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>二手類別編號:</td>
		<td><input type="TEXT" name="classNo" value="<%=usedVO.getClassNo()%>" size="45"/></td>
	</tr>
	<tr>
<!-- 		<td>二手商品描述:</td> -->
<%-- 		<td><input type="TEXT" name="usedProDesc"   value="<%=usedVO.getUsedProDesc()%>" size="45"/></td> --%>
		<td>二手商品描述:</td>
		<td><textarea name="usedProDesc" rows="4" cols="45" maxlength="230" style="resize: none;"><%=usedVO.getUsedProDesc()%></textarea></td>
	
	</tr>
	<tr>
    <td>商品新舊程度:</td>
    <td>
        <select name="usedNewness">
            <option value="0" <%= usedVO.getUsedNewness() == 0 ? "selected" : "" %>>近全新</option>
            <option value="1" <%= usedVO.getUsedNewness() == 1 ? "selected" : "" %>>7成新</option>
            <option value="2" <%= usedVO.getUsedNewness() == 2 ? "selected" : "" %>>5成新</option>
            <option value="3" <%= usedVO.getUsedNewness() == 3 ? "selected" : "" %>>3成新</option>
        </select>
    </td>
</tr>

	<tr>
		<td>二手商品單價:(>0)</td>
		<td><input type="TEXT" name="usedPrice"   value="<%=usedVO.getUsedPrice()%>" size="45"/></td>
	</tr>
	<tr>
		<td>商品庫存數量:(>0)</td>
		<td><input type="TEXT" name="usedStocks"  value="<%=usedVO.getUsedStocks()%>" size="45"/></td>
	</tr>
	<tr>
    <td>商品狀態: (0: 未上架, 1: 上架)</td>
    <td>
        <select name="usedState">
            <option value="0" <%= usedVO.getUsedState() == 0 ? "selected" : "" %>>未上架</option>
            <option value="1" <%= usedVO.getUsedState() == 1 ? "selected" : "" %>>上架</option>
        </select>
    </td>
</tr>

<%-- 	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" /> --%>
<!-- 	<tr> -->
<!-- 		<td>部門:<font color=red><b>*</b></font></td> -->
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
<input type="submit" value="送出修改"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

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
//  	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
//  	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
<%--  		   value: '<%=empVO.getHiredate()%>', // value:   new Date(), --%>
//            disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
//            startDate:	            '2017/07/10',  // 起始日
//            minDate:               '-1970-01-01', // 去除今日(不含)之前
//            maxDate:               '+1970-01-01'  // 去除今日(不含)之後
//         });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
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

        
        //      2.以下為某一天之後的日期無法選擇
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


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
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