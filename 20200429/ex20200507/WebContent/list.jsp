<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex20200507.*, org.json.simple.*"%>

<%
	String dept=request.getParameter("dept");
	DAO dao=new DAO();
	JSONObject jObject=dao.list(dept);
	out.println(jObject);
%>