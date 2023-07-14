<%@page import="filter.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
List boardList = (List) request.getAttribute("boardlist");
int totalCount = ((Integer) request.getAttribute("total_record")).intValue();
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGEB"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCKB"));
int totalPage = (int) Math.ceil((double) totalCount / pageSize); // 전체 페이지 수
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
List<BoardDTO> adminList = (List) request.getAttribute("adminlist");

%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<html>
<head>
<title>Board</title>
<script type="text/javascript">
	function checkForm() {	
		if (${sessionId==null}) {
			alert("로그인 해주세요.");
			return false;
		}

		location.href = "./BoardWriteForm.do?id=<%=sessionId%>"
	}
</script>

</head>
<body>
	<jsp:include page="../menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">Q&A</h1>
		</div>
	</div>
	<div class="container">
		<form action="<c:url value="./BoardListAction.do"/>" method="post">
			<div>
				<div class="text-right">
					<span class="badge badge-success">전체 <%=totalCount%>건
					</span>
				</div>
			</div>
			<div style="padding-top: 50px">
				<table class="table table-hover">
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성일</th>
						<th>조회</th>
						<th>글쓴이</th>
					</tr>
					<%
					 int virtualNum = 10*(pageNum-1)+1;
					for (int j = 0; j < boardList.size(); j++) {
						BoardDTO notice = (BoardDTO) boardList.get(j);
					%>
					<tr>
						<td><%=virtualNum%></td>
                  <% virtualNum++;%>
						<td><a
							href="./BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%></a></td>
						<td><%=notice.getRegist_day()%></td>
						<td><%=notice.getHit()%></td>
						<td><%=notice.getName()%></td>
					</tr>
					<%for(BoardDTO admin : adminList){
					if(notice.getNum().equals(admin.getUserNum())) { %>
					<tr>
						<td></td>
						<td colspan="3">↳<a href="/WebMarket/replyView.do?adminNum=<%=admin.getNum() %>&pageNum=<%=pageNum%>"><%=admin.getSubject()%></a></td>
						<td>관리자</td>
					</tr>
					<%
					}
					}
					}
					%>
				</table>
			</div>
				
			<div align="center">
				<nav aria-label="Page navigation example">
					<ul class="pagination justify-content-center">
						<%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/BoardListAction.do")%>
					</ul>
				</nav>
			</div>
			<div align="left">
				<table>
					<tr>
						<td width="92%" align="left">&nbsp;&nbsp; <select
							name="items" class="txt">
								<option value="subject">제목에서</option>
								<option value="content">본문에서</option>
								<option value="name">글쓴이에서</option>
						</select> <input name="text" type="text" /> <input type="submit"
							id="btnAdd" class="btn btn-primary " value="검색" />
						</td>

						<td width="100%" align="right"><a href="#"
							onclick="checkForm(); return false;" class="btn btn-primary">&laquo;글쓰기</a>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<hr>
	</div>
	<jsp:include page="../footer.jsp" />
</body>
</html>





