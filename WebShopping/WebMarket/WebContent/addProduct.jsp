<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>상품 등록</title>
<script type="text/javascript" src="./resources/js/validation2.js"></script>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message" >
	<jsp:include page="menu.jsp" />	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right"> 
			<a href="?language=ko" >Korean</a>|<a href="?language=en" >English</a>
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>	
		<form name="newProduct" id="newProduct" action="/WebMarket/AddProduct.po" class="form-horizontal" 
		method="post" >
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname" /></label>
				<div class="col-sm-3">
					<input type="text" id="name"  name="p_name" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitPrice"/></label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice"  name="p_unitPrice" class="form-control" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-5">
					<textarea name="p_description" id="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="manufacturer"/></label>
				<div class="col-sm-3">
					<input type="text" name="p_manufacturer" id="manufacturer" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="category" /></label>
				<div class="col-sm-5">
					<input type="radio" name="p_category" id="category" value="상의"  ><fmt:message key="category_Top"/>
					<input type="radio" name="p_category" id="category" value="하의"  ><fmt:message key="category_Pants"/>
					<input type="radio" name="p_category" id="category" value="신발"  ><fmt:message key="category_Shoes"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="gender" /></label>
				<div class="col-sm-5">
					<input type="radio" name="p_gender" value="Male" id="gender" ><fmt:message key="gender_Male"/> 
					<input type="radio" name="p_gender" value="Female" id="gender" ><fmt:message key="gender_Female" />
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage" /></label>
				<div class="col-sm-5">
					<input type="text" name="p_fileName" id="productImage" class="form-control">
					<!-- <input type="file" name="productImage" class="form-control"> -->
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddProduct()">
				</div>
			</div>
		</form>
	</div>
	<jsp:include page="footer.jsp" />
	</fmt:bundle>
</body>
</html>
