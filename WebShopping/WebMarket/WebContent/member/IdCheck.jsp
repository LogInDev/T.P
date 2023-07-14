<%@page import="mvc.model.MemberDTO"%>
<%@page import="mvc.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
MemberDTO dto = new MemberDTO();
dto = dao.selectView(id);
dao.close();
System.out.println(dto.toString());
//out.print(id);
//out.print(dto.getId());
//request.getRequestDispatcher("Join.jsp?id="+dto.getId()).forward(request, response);
String json = "{\"status\": false}";
if(dto.getId() != null){
	json = "{\"status\": true}";
}
%>
<%=json %>


