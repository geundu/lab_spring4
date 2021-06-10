<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%
	StringBuilder path = new StringBuilder(request.getContextPath());
	path.append("/");
	List<Map<String, Object>> boardList = null;
	boardList = (List<Map<String, Object>>) request.getAttribute("boardList");
	int size = 0;
	
	if (boardList != null) {
		size = boardList.size();
	}
	out.print("size:" + size);
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
<script type="text/javascript">
	function boardInsert() {
		$('#dg_board').datagrid({
			url : './jsonGetBoardList.sp4',
			onLoadSuccess : function() {
				console.log('onLoadSuccess');
			}
		});
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#dg_board').datagrid({
			columns : [ [ {
				field : 'BM_NO',
				title : '글번호',
				width : 150
			}, {
				field : 'BM_TITLE',
				title : '제목',
				width : 300
			}, {
				field : 'BM_DATE',
				title : '작성일',
				width : 200
			}, {
				field : 'BS_FILE',
				title : '첨부파일',
				width : 200
			}, {
				field : 'BM_HIT',
				title : '조회수',
				width : 150
			} ] ]
		});
		$('#btn_sel').bind('click', function() {
			boardInsert();
		});

		$('#btn_ins').bind('click', function() {
		});
		$('#btn_upd').bind('click', function() {
		});
		$('#btn_del').bind('click', function() {
		});
	});
</script>
</head>
<body>
	<br /> WebContent 게시판 목록 페이지입니다.
	<br />
	<table id="dg_board" class="easyui-datagrid" data-options="title:'게시판',toolbar:'#tb_board'" style="width: 1002px; height: 350px">
		<!-- <thead>
			<tr>
				<th data-options="width: '150px', field:'BM_NO'">글번호</th>
				<th data-options="width: '300px', field:'BM_TITLE'">제목</th>
				<th data-options="width: '200px', field:'BM_DATE'">작성일</th>
				<th data-options="width: '200px', field:'BS_FILE'">첨부파일</th>
				<th data-options="width: '150px', field:'BM_HIT'">조회수</th>
			</tr>
		</thead> -->
		<tbody>
			<%
				if (size == 0) {
			%>
			<tr>
				<td colspan="5">조회 결과가 없습니다.</td>
			</tr>
			<%
				}
			else {

			for (Map<String, Object> index : boardList) {
			%>
			<tr>
				<td><%=index.get("BM_NO")%></td>
				<td><%=index.get("BM_TITLE")%></td>
				<td><%=index.get("BM_DATE")%></td>
				<td><%=index.get("BS_FILE")%></td>
				<td><%=index.get("BM_HIT")%></td>
			</tr>
			<%
				}
			%>
			<%
				}
			%>
		</tbody>
	</table>
	<div id="tb_board" style="padding: 2px 5px;">
		<a id="btn_sel" href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
		<a id="btn_ins" href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
		<a id="btn_upd" href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
		<a id="btn_del" href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">삭제</a>
	</div>
</body>
</html>