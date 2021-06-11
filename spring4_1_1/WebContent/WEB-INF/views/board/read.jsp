<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
path.append("/");
List<Map<String, Object>> boardDetail = (List<Map<String, Object>>) request.getAttribute("boardDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 구현 - WEB-INF</title>
<!-- jEasyUI 시작 -->
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="<%=path.toString()%>themes/icon.css">
<!-- jEasyUI JS 시작 -->
<script type="text/javascript" src="<%=path.toString()%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=path.toString()%>js/jquery.easyui.min.js"></script>
</head>
<body>
	<table align="center" id="p" class="easyui-panel" title="글상세보기" data-options="footer:'#tb_read'"
		style="width: 670px; height: 380px; padding: 10px; background: #fafafa;">
		<tr>
			<td>제목</td>
			<td><input id="bm_title" value="<%=boardDetail.get(0).get("BM_TITLE")%>" name="bm_title" data-options="width:'450px'" class="easyui-textbox"></td>
		</tr>
		<tr>
			<td>작성자</td>
			<td><input id="bm_writer" value="<%=boardDetail.get(0).get("BM_WRITER")%>" name="bm_writer" class="easyui-textbox"></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><input id="bm_email" value="<%=boardDetail.get(0).get("BM_EMAIL")%>" name="bm_email" class="easyui-textbox"></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><input id="bm_content" value="<%=boardDetail.get(0).get("BM_CONTENT")%>" name="bm_content"
				data-options="multiline:'true', width:'570px', height:'90px'" class="easyui-textbox"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input id="bm_pw" value="<%=boardDetail.get(0).get("BM_PW")%>" name="bm_pw" class="easyui-passwordbox"></td>
		</tr>
	</table>
	<div id="tb_read" style="padding: 2px 5px;" align="center">
		<a href="javascript:repleForm()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">댓글쓰기</a>
		<a href="javascript:updateForm()" class="easyui-linkbutton" iconCls="icon-add" plain="true">수정</a>
		<a href="javascript:boardDelView()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
		<a href="./getBoardList.sp4" class="easyui-linkbutton" iconCls="icon-search" plain="true">목록</a>
	</div>
</body>
</html>