<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%
	List<Map<String, Object>> boardList = (List<Map<String, Object>>) request.getAttribute("boardList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 구현 - WebContent</title>
<jsp:include page="../common/commonUIglobal.jsp" flush="false" />
</head>
<body>
	WebContent 게시판 목록 페이지입니다.
	<br>
	 <div id="ft" style="padding:2px 5px;">
        <a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
        <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
    </div>
	<table class="easyui-datagrid" data-options="title:'게시판', singleSelect:true, toolbar:'#ft'" width="768px">
		<thead>
			<tr>
				<th data-options="field:'bm_no'">번호</th>
				<th data-options="field:'bm_title'">제목</th>
				<th data-options="field:'bm_name'">작성자</th>
				<th data-options="field:'bm_hit'">조회수</th>
				<th data-options="field:'bm_date'">날짜</th>
				<th data-options="field:'bs_file'">첨부파일</th>
			</tr>
		</thead>
		<tbody>
			<%
				for (Map<String, Object> index : boardList) {
			%>
			<tr>
				<td><%=index.get("BM_NO")%></td>
				<td><%=index.get("BM_TITLE")%></td>
				<td><%=index.get("BM_NAME")%></td>
				<td><%=index.get("BM_HIT")%></td>
				<td><%=index.get("BM_DATE")%></td>
				<td><%=index.get("BS_FILE")%></td>
			</tr>
			<%
				}
			%>
		</tbody>
	</table>
</body>
</html>