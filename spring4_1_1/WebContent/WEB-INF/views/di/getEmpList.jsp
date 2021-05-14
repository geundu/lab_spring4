<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%
	/*
		서블릿에서 EmpLogic.java > EmpDAO.java > List<Map>
		mav.addObject("empList", empList);
		request.setAttribute("empList", empList);
		forward 방식
	*/
	List<Map<String, Object>> empList = (List<Map<String, Object>>) request.getAttribute("empList");
	int	size = -1;

	if (empList != null) {
		size = empList.size();
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 목록 페이지</title>
</head>
<body>
	사원 목록 페이지입니다.
	<br>
	<%=empList%>
	<br>
	<%=size%>
</body>
</html>