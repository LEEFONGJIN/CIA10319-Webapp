<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Used: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Used: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Used: Home</p>

<h3>二手商品資料查詢:</h3>
	
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>

<li><a href='listAllUsed.jsp'>List</a> all Used.  <br><br></li>

<!-- V -->
  <li>
    <FORM METHOD="post" ACTION="used.do" >
        <b>輸入賣家編號 :</b>
        <input type="text" name="sellerNo">
        <input type="hidden" name="action" value="getSellerNo_For_Display">
        <input type="submit" value="送出">
    </FORM>
  </li>
<!--  V -->
  
  <jsp:useBean id="usedSvc" scope="page" class="com.used.model.UsedService" />
   
  <li>
     <FORM METHOD="post" ACTION="used.do" >
       <b>選擇二手商品編號:</b>
       <select size="1" name="usedNo">
         <c:forEach var="usedVO" items="${usedSvc.all}" > 
          <option value="${usedVO.usedNo}">${usedVO.usedNo}
         </c:forEach>   
       </select>
       <br>
       <b>選擇二手賣家編號:</b>
       <select size="1" name="sellerNo">
         <c:forEach var="usedVO" items="${usedSvc.all}" > 
          <option value="${usedVO.sellerNo}">${usedVO.sellerNo}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getSellerNo_UsedNo_For_Display">
       <input type="submit" value="送出">
    </FORM>
  </li>
  
<!-- =============================================================================   -->
<!--   <li> -->
<!--     <FORM METHOD="post" ACTION="emp.do" > -->
<!--         <b>輸入員工編號 (如7001):</b> -->
<!--         <input type="text" name="empno"> -->
<!--         <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--         <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--   </li> -->

  
<!--   <li> -->
<!--      <FORM METHOD="post" ACTION="emp.do" > -->
<!--        <b>選擇員工姓名:</b> -->
<!--        <select size="1" name="empno"> -->
<%--          <c:forEach var="empVO" items="${empSvc.all}" >  --%>
<%--           <option value="${empVO.empno}">${empVO.ename} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--      </FORM> -->
<!--   </li> -->
</ul>


<h3>二手商品管理</h3>

<ul>
  <li><a href='addUsed.jsp'>Add</a> a new Used.</li>
</ul>

</body>
</html>