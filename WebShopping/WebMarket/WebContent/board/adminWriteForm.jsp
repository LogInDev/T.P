<%@page import="mvc.model.BoardDTO"%>
<%@page import="mvc.model.MemberDAO"%>
<%@page import="mvc.model.MemberDTO"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	MemberDAO dao = new MemberDAO();
	String id = (String)session.getAttribute("sessionId");
	//MemberDTO dto = dao.selectView((String)session.getAttribute("sessionId"));
	System.out.println(">>>>>>>>>>>>>>>>>>" + dto);
%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>Board</title>
</head>
<script type="text/javascript">
	function checkForm() {
		if (!document.newWrite.content.value) {
			alert("내용을 입력하세요.");
			return false;
		}		
	}
</script>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">관리자 답글</h1>
		</div>
	</div>

	<div class="container">

		<form name="newWrite" action="./adminInsert.do"
			class="form-horizontal" method="post" onsubmit="return checkForm()">
			<input name="userId" type="hidden" value="${dto.id}">
			<input name="userNum" type="hidden" value="${dto.num}">
			<input name="id" type="hidden" value="<%=id %>">
			<div class="form-group row">
				<label class="col-sm-2 control-label" for="subject">제목</label>
				<div class="col-sm-5">
					<input name="subject" type="text" id="subject" class="form-control"
						placeholder="subject" value="Re:<%=dto.getSubject()%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label" for="content">내용</label>
				<div class="col-sm-8">
					<textarea name="content" id="content" cols="50" rows="5" class="form-control" 
					placeholder="content">

-----Original Message-----
성명 : <%=dto.getName() %>
제목 : <%=dto.getSubject() %>
보낸 날짜: <%=dto.getRegist_day() %>
내용 : <%=dto.getContent() %>
</textarea>
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
				 <input type="submit" class="btn btn-primary " value="등록 ">				
					 <input type="reset" class="btn btn-primary " value="취소 ">
				</div>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>



