<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>

<%
	BoardDTO notice = (BoardDTO) request.getAttribute("board");
	int num = ((Integer) request.getAttribute("num")).intValue();
	int nowpage = ((Integer) request.getAttribute("page")).intValue();
	System.out.println(notice.toString());
	System.out.println(notice.getNum());
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
<script type="text/javascript">
function editList() {
	if (confirm("수정하시겠습니까?")) {
		document.newUpdate.submit();
	} else {		
		document.newUpdate.reset();
	}
}
function deleteList() {
	if (confirm("삭제하시겠습니까?")) {
		document.deleteu.href;
	} else {		
		document.newUpdate.reset();
	}
}
</script>
</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">게시판</h1>
		</div>
	</div>
	<c:set var="notice" value="<%=notice %>" scope="request" />
	<div class="container">
		<form name="newUpdate"
			action="BoardUpdateAction.do?num=${notice.num }&pageNum=<%=nowpage%>"
			class="form-horizontal" method="post">
			<input type="hidden" name="id" value="${notice.id }">
			<input type="hidden" name="name" value="${notice.name }">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >성명</label>
				<div class="col-sm-3">
					<span class="form-control$" >${notice.name}</span>
				</div>
			</div>
			<c:set var="userId" value="${notice.id }" />
			<c:choose>
			<c:when test="${sessionId != null && (sessionId eq 'admin' or sessionId eq userId)}">
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control"	value="${notice.subject}" >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5">${notice.content }</textarea>
				</div>
			</div>
			</c:when>
			<c:otherwise>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >제목</label>
				<div class="col-sm-5">
					<input name="subject" class="form-control"	value="${notice.subject}" disabled >
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" >내용</label>
				<div class="col-sm-8" style="word-break: break-all;">
					<textarea name="content" class="form-control" cols="50" rows="5" disabled >${notice.content }</textarea>
				</div>
			</div>
			</c:otherwise>
			</c:choose>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					
					<c:if test="${sessionId != null &&(sessionId eq 'admin') or (sessionId eq userId)}">
						<p>
							<a	href="./BoardDeleteAction.do?num=${ notice.num}&pageNum=<%=nowpage%>" name="deleteu" onclick="deleteList()"	class="btn btn-danger">삭제</a> 
							<a href="#" class="btn btn-success" onclick="editList()">수정</a>
							<c:if test="${sessionId != null &&(sessionId eq 'admin')}">
							<a	href="/WebMarket/adminWrite.do?userNum=${notice.num}"	class="btn btn-secondary">답변</a> 
							</c:if>
					</c:if>
					<a href="./BoardListAction.do?pageNum=<%=nowpage%>"		class="btn btn-primary">목록</a>
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>


