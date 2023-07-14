<%@page import="ListDAO.ProductDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
ProductDTO dto = (ProductDTO) request.getAttribute("dto");
System.out.println(dto);
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />

<title>상품 편집</title>
<script type="text/javascript">
function editList() {
	if (confirm("수정하시겠습니까?")) {
		document.addForm.submit();
	} else {		
		document.addForm.reset();
	}
}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" /> 
	<c:set var="dto" value="<%=dto%>" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 편집</h1>
		</div>
	</div>
	<form name="addForm" action="/WebMarket/EditProduct.po" method="post">
	<input type="hidden" name="p_id" value="${dto.p_id}" />
	<input type="hidden" name="p_fileName" value="${dto.p_fileName}" />
	<input type="hidden" id="pageUrl" name="pageNum" value="">
		<script type="text/javascript">
		var referrer = document.referrer;
		var pageUrl = document.getElementById("pageUrl");
		pageUrl.value = referrer;
		</script>
<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="${dto.p_fileName}" style="width: 100%" />
			</div>
			<div class="col-md-6">
		    <p><b>상품명</b> : <input type="text" name="p_name" class="form-control" value="${dto.p_name}">
			<p><b>상품 상세설명 : </b><textarea name="p_description" class="form-control" cols="50" rows="5">${dto.p_description }</textarea> 
			<p><b>제조사</b> : <input type="text" class="form-control" name="p_manufacturer" value="${dto.p_manufacturer}">
			<p><b>분류</b> : <input type="text" class="form-control" name="p_category" value="${dto.p_category }">
			<p><b>성별</b> : <input type="text" class="form-control" name="p_gender" value="${dto.p_gender}">
			<p><b>가격</b> : <input type="text" class="form-control" name="p_unitPrice" value="${dto.p_unitPrice}">
			<p>
				<input type="hidden" name="id" value="111">
				<a href="#"
						class="btn btn-success" onclick="editList()"> 수정 &raquo;</a>
				   <a href="#" class="btn btn-success" id="123"
                     onclick=""> 목록 &raquo;</a>
                  <script type="text/javascript">
                     var referrer = document.referrer;
                     var pageUrl = document.getElementById("123");
                     pageUrl.href = referrer;
                  </script>
			</form>
			</div>
		</div>
		<hr>
	<jsp:include page="footer.jsp" />
	</div>
</body>
</html>