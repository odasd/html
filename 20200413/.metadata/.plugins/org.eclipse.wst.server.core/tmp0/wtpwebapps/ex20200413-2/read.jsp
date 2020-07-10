<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex02.* , java.util.* , java.sql.* " %>
<%
	String strAno=request.getParameter("ano");
	int ano=Integer.parseInt(strAno);
	ADDDAO dao=new ADDDAO();
	ADDVO vo=dao.read(ano);
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 보기</title>
</head>
<body><%=vo.getTel()%>
	<h1>주소보기</h1>
	<a href="list.jsp">목록</a>
	<form action="sqlUpdate.jsp">
		<input type="hidden" name="ano" value="<%=ano%>">
		이름 : <input type="text" name="aname" value="<%= vo.getAname() %>">
		<hr>
		전화번호 : <input type="text" name="tel" value="<%=vo.getTel()%>">
		<hr>
		주소 : <textarea rows="5" cols="50" name="address"><%= vo.getAddress() %></textarea>
		<hr>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		<input type="button" value="삭제" onClick="location.href='sqlDelete.jsp?ano=<%= vo.getAno() %>'"> <!-- =은 프린트와 같다는 뜻임 -->
		<input type="button" value="목록" onClick="location.href='list.jsp'">
	</form>
</body>
</html>