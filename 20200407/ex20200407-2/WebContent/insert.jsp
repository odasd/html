<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="ex01.*" %>

<% 	request.setCharacterEncoding("UTF-8"); /* 한글 깨져서 이걸로 고침  리퀘스트라는 웹의 영역이 있음, 리퀘스트의 인코딩 방식은 Utf-8이다*/ 
	String pno=request.getParameter("pno"); 
	String pname=request.getParameter("pname");
	String strPrice=request.getParameter("price"); /* 리퀘스트에 저장된 프라이스 값을 가져오라는 뜻  parameter로 가져오는거임 */
	int price = Integer.parseInt(strPrice);	/* 파라미터로 가져온 값은 무조건 스트링 값임 , 스트링값인  프라이스를 인트값으로 변경해준 것  */
						/* pares=문자를 숫자로 바꿔주는 것*/ /*request에 대한 Parameter값을 get(가져온다)한다?*/
	ProductVO vo=new ProductVO();
	vo.setPno(request.getParameter("pno"));
	vo.setPname(pname);
	vo.setPrice(price);
	
	ProductDAO dao = new ProductDAO();
	dao.insert(vo);	/*dao의 insert값을 vo에 넣어주는 것*/
%>








<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>데이터 저장</title>
</head>
<body>
	<h1>데이터가 저장 되었습니다.</h1>
	<a href="ex01.html">데이터 입력</a>
	<h1>목록으로 이동</h1>
	<a href="list.jsp">목록으로 이동</a>
</body>
</html>