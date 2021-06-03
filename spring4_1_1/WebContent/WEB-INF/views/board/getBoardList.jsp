<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 구현 - WEB-INF</title>
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>themes/icon.css">
<script type="text/javascript" src="<%=path.toString()%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString()%>js/jquery.easyui.min.js"></script>
<script type="text/javascript"></script>
</head>
<body>
	WEB-INF 게시판 목록 페이지입니다.
	<br>
	<br>
	<div id="ft" style="padding: 2px 5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
	</div>
	<table class="easyui-datagrid" data-options="title:'게시판', url:'./jsonGetBoardList.sp4', singleSelect:true, toolbar:'#ft'" width="768px">
		<thead>
			<tr>
				<th data-options="field:'BM_NO'">번호</th>
				<th data-options="field:'BM_TITLE'">제목</th>
				<th data-options="field:'BM_NAME'">작성자</th>
				<th data-options="field:'BM_HIT'">조회수</th>
				<th data-options="field:'BM_DATE'">날짜</th>
				<th data-options="field:'BS_FILE'">첨부파일</th>
			</tr>
		</thead>
	</table>
</body>
</html>
