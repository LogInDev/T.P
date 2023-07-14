<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("jUsername");
System.out.print(id);
//out.print(dto.getId());
//request.getRequestDispatcher("Join.jsp?id="+dto.getId()).forward(request, response);
String json = "{\"status\": false}";
%>
<%=json %>