<%@page import="util.BoardPage"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
int totalCount = ((Integer) request.getAttribute("totalCount")).intValue();
int pageSize = ((Integer) request.getAttribute("pageSize")).intValue();
int blockPage = ((Integer) request.getAttribute("blockPage")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int totalPage = ((Integer) request.getAttribute("totalPage")).intValue();

//String p_category = (String)request.getAttribute("bot");
//System.out.println(p_category+"=-=-=-=-");

System.out.println("-----------" + totalCount + "//" + pageSize + "//" + blockPage + "//" + pageNum);
%>
<html>
<head>
<title>SimpleShop</title>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"
	integrity="sha384-mQ93GR66B00ZXjt0YO5KlohRA5SY2XofN4zfuZxLkoj1gXtW8ANNCe9d5Y3eG5eD"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css">
<meta charset="utf-8" />
<script type="text/javascript">
	function deletepro() {
		if (confirm("삭제하시겠습니까?")) {
			document.deleteForm.submit();
		} else {
			var referrer = document.referrer;
			location.href(referrer);
		}
	}
</script>
</head>
<body>
	<jsp:include page="/menu.jsp" />
	<main>
		<form name="deleteForm" action="/WebMarket/DeleteProduct.po"
			method="post">
			<input type="hidden" id="pageUrl" name="pageNum" value="">
			<script type="text/javascript">
				var link = document.location.href;
				var pageUrl = document.getElementById("pageUrl");
				pageUrl.value = link;
			</script>
			<c:choose>
				<c:when test="${plist[0].p_gender eq 'female' }">
					<ul class="nav nav-tabs">
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link active" aria-current="page"
							href="/WebMarket/Female/femaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">전체</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link"
							href="/WebMarket/Female/topfemaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">상의</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link"
							href="/WebMarket/Female/botfemaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">하의</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link"
							href="/WebMarket/Female/shoefemaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">신발</a></li>
					</ul>
				</c:when>
				<c:when test="${plist[0].p_gender eq 'male' }">
					<ul class="nav nav-tabs">
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link active" aria-current="page"
							href="/WebMarket/Male/maleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">전체</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link" href="/WebMarket/Male/topmaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">상의</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link" href="/WebMarket/Male/botmaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">하의</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link" href="/WebMarket/Male/shoemaleview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">신발</a></li>
					</ul>
				</c:when>
				<c:when test="${all eq 'all'}">
					<ul class="nav nav-tabs">
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link active" aria-current="page"
							href="/WebMarket/allview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">전체</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link" href="/WebMarket/topallview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">상의</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link" href="/WebMarket/botallview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">하의</a></li>
						<li class="nav-item" style="background-color: #ffffff;"><a
							class="nav-link" href="/WebMarket/shoeallview.po?pageNum=1"
							style="color: rgb(17, 15, 15);">신발</a></li>
					</ul>
				</c:when>
			</c:choose>
			<div class="jumbotron mx-4">
				<div class="container h-100">
					<div class="row justify-content-end">
						<c:choose>
							<c:when test="${ plist[0].p_gender eq 'male'}">
								<c:forEach items="${plist }" var="plist" varStatus="loop">
									<input type="hidden" name="p_id" value="${plist.p_id }">
									<div class="col-md-6">
										<div class="card" style="width: 100%; height: 100%;">
											<a href="/WebMarket/Bcontroller.po?p_id=${plist.p_id }">
												<img src="${plist.p_fileName }" class="card-img-top"
												alt="...">
											</a>
											<div class="card-body">
												<h5 class="card-title">${plist.p_name }</h5>
												<p class="card-text justify-content-end">${plist.p_unitPrice }</p>
												<a href="/WebMarket/Bcontroller.po?p_id=${plist.p_id }"
													class="btn btn-outline-secondary">보러가기</a>
												<c:if test="${sessionId != null && sessionId eq 'admin'}">
													<a href="/WebMarket/ViewProduct.po?p_id=${plist.p_id}"
														class="btn btn-outline-success">수정</a>
													<a href="#" class="btn btn-outline-primary"
														onclick="deletepro()">삭제</a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>

							<c:when test="${ plist[0].p_gender eq 'female'}">
								<c:forEach items="${plist }" var="plist" varStatus="loop">
									<input type="hidden" name="p_id" value="${plist.p_id }">
									<div class="col-md-6">
										<div class="card" style="width: 100%; height: 100%;">
											<a href="/WebMarket/Bcontroller.po?p_id=${plist.p_id }">
												<img src="${plist.p_fileName }" class="card-img-top"
												alt="...">
											</a>
											<div class="card-body">
												<h5 class="card-title">${plist.p_name }</h5>
												<p class="card-text justify-content-end">${plist.p_unitPrice }</p>
												<a href="/WebMarket/Bcontroller.po?p_id=${plist.p_id }"
													class="btn btn-outline-secondary">보러가기</a>
												<c:if test="${sessionId != null && sessionId eq 'admin'}">
													<a href="/WebMarket/ViewProduct.po?p_id=${plist.p_id}"
														class="btn btn-outline-success">수정</a>
													<a href="#" class="btn btn-outline-primary"
														onclick="deletepro()">삭제</a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
							<c:when test="${ all eq 'all'}">
								<c:forEach items="${plist }" var="plist" varStatus="loop">
									<input type="hidden" name="p_id" value="${plist.p_id }">
									<div class="col-md-6">
										<div class="card" style="width: 100%; height: 100%;">
											<a href="/WebMarket/Bcontroller.po?p_id=${plist.p_id }">
												<img src="${plist.p_fileName }" class="card-img-top"
												alt="...">
											</a>
											<div class="card-body">
												<h5 class="card-title">${plist.p_name }</h5>
												<p class="card-text justify-content-end">${plist.p_unitPrice }</p>
												<a href="/WebMarket/Bcontroller.po?p_id=${plist.p_id }"
													class="btn btn-outline-secondary">보러가기</a>
												<c:if test="${sessionId != null && sessionId eq 'admin'}">
													<a href="/WebMarket/ViewProduct.po?p_id=${plist.p_id}"
														class="btn btn-outline-success">수정</a>
													<a href="#" class="btn btn-outline-primary"
														onclick="deletepro()">삭제</a>
												</c:if>
											</div>
										</div>
									</div>
								</c:forEach>
							</c:when>
						</c:choose>

						<div>
							<nav aria-label="Page navigation example">
								<ul class="pagination justify-content-center">
									<c:choose>
										<c:when
											test="${ plist[0].p_gender eq 'male' and plist[0].p_category eq '상의' and plist[0].p_category eq '하의' and plist[0].p_category eq '신발' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Male/maleview.po")%>
											</li>
										</c:when>
										<c:when test="${plist[0].p_category eq '상의' and plist[0].p_gender eq 'male' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Male/topmaleview.po")%>
											</li>
										</c:when>
										<c:when test="${plist[0].p_category eq '하의' and plist[0].p_gender eq 'male' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Male/botmaleview.po")%>
											</li>
										</c:when>
										<c:when test="${plist[0].p_category eq '신발' and plist[0].p_gender eq 'male' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Male/shoemaleview.po")%>
											</li>
										</c:when>
										<c:when
											test="${ plist[0].p_gender eq 'female' and plist[0].p_category eq '상의' and plist[0].p_category eq '하의' and plist[0].p_category eq '신발' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Female/femaleview.po")%>
											</li>
										</c:when>
										<c:when test="${plist[0].p_category eq '상의' and plist[0].p_gender eq 'female' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Female/topfemaleview.po")%>
											</li>
										</c:when>
										<c:when test="${plist[0].p_category eq '하의' and plist[0].p_gender eq 'female' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Female/botfemaleview.po")%>
											</li>
										</c:when>
										<c:when test="${plist[0].p_category eq '신발' and plist[0].p_gender eq 'female' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/Female/shoefemaleview.po")%>
											</li>
										</c:when>
										<c:when test="${all eq 'all' and plist[0].p_category eq '상의' }">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/topallview.po")%>
											</li>
										</c:when>
										<c:when test="${all eq 'all' and plist[0].p_category eq '하의'}">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/botallview.po")%>
											</li>
										</c:when>
										<c:when test="${all eq 'all' and plist[0].p_category eq '신발'}">
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/shoeallview.po")%>
											</li>
										</c:when>
										<c:otherwise>
											<li><%=BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "/WebMarket/allview.po")%>
											</li>
										</c:otherwise>
									</c:choose>
								</ul>
							</nav>
						</div>
						<jsp:include page="/footer.jsp" />
					</div>
				</div>
			</div>
		</form>
	</main>
</body>
</html>