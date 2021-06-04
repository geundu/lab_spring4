<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<!-- jEasyUI -->
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>themes/icon.css">

<!-- bootstrap -->
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>css/bootstrap.min.css">

<!-- jEasyUI JavaScript -->
<script type="text/javascript" src="<%=path.toString()%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString()%>js/jquery.easyui.min.js"></script>

<!-- bootstrap JavaScript -->
<script type="text/javascript" src="<%=path.toString()%>js/bootstrap.min.js"></script>
