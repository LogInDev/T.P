<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String sessionId = (String) session.getAttribute("sessionId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
  margin: 0;
  padding: 0;
}

.jumbotron {
  font-family: 'Montserrat', sans-serif;
  padding: 150px 0;
  background: url(https://unsplash.it/1500/500?image=1059) center center;
  background-size: cover;
  text-align: center;
  color: #fff;
  position: relative;
}

.jumbotron h1 {
  font-size: 70px;
  margin-bottom: 0;
}

.jumbotron p {
  font-family: serif;
  font-size: 30px;
  font-style: italic;
  margin: 0 0 30px;
}

.button {
  display: inline-block;
  border: 2px solid #fff;
  padding: 10px 20px;
  color: #fff;
  text-decoration: none;
  transition: 0.3s;
}

.button:hover {
  background: #fff;
  color: #000;
}
</style>

</head>
<body>
<link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'>

<section class="jumbotron">
  <h1>MODERN SUIT</h1>
  <p>The suit designed to fit you</p>
  <%if(sessionId!=null) {%>
   <a href="/WebMarket/allview.po?pageNum=1" class="button">LOOK AROUND</a>
  <%}else{ %>
  <a href="/WebMarket/member/addMember.jsp" class="button">SIGN IN</a>
 <%} %>
</section>
</body>
</html>