<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시판 구현 - WebContent</title>
<jsp:include page="../common/commonUIglobal.jsp" flush="false" />
<script type="text/javascript">
	function search() {
		$('#dg_board').datagrid({
			url : 'jsonGetBoardList.sp4',
		});
	}
	function insert() {
		$('#dlg_ins').dialog('open');
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#dg_board').datagrid({
			toolbar : '#ft',
		});
	});
</script>
<script type="text/javascript">
	function insertButton() {
		document.insert_dialog.submit();
		alert('저장되었습니다.');
		$('#dlg_ins').dialog('close');
	}
</script>
<style type="text/css">
.easyui-dialog {
	width: 400px;
	height: 400px;
	padding: 10px;
}
</style>
</head>
<body>
	WebContent 게시판 목록 페이지입니다.
	<br />
	<br />
	<table id="dg_board" class="easyui-datagrid" data-options="title:'게시판', singleSelect:true" style="width: 1002px; height: 350px">
		<thead>
			<tr>
				<th data-options="field:'BM_NO'">번호</th>
				<th data-options="field:'BM_TITLE'">제목</th>
				<th data-options="field:'BM_WRITER'">작성자</th>
				<th data-options="field:'BM_HIT'">조회수</th>
				<th data-options="field:'BM_DATE'">날짜</th>
				<th data-options="field:'BS_FILE'">첨부파일</th>
			</tr>
		</thead>
	</table>
	<div id="ft" style="padding: 2px 5px">
		<a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
		<a href="javascript:insert()" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
	</div>

	<!-- [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[게시글 작성 다이얼로그]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] -->
	<div id="dlg_ins" class="easyui-dialog" title="글쓰기" data-options="iconCls:'icon-save', closed:'false'"
		style="width: 500px; height: 500px; padding: 10px">
		<form name="insert_dialog" action="./boardInsert.sp4" method="get">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_writer" label="작성자:" labelPosition="top" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_email" label="이메일:" labelPosition="top"
					data-options="prompt:'abcd@gmail.com', validType:'email'" style="width: 100%" />
			</div>
			<div>
				<input class="easyui-textbox" type="text" name="bm_title" label="제목:" labelPosition="top" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_content" label="내용:" labelPosition="top" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="bm_pw" label="비밀번호:" labelPosition="top" type="password" style="width: 100%" />
			</div>
			<div>
				<button onClick="insertButton()" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">작성</button>
				<!-- <a href="javascript:insertButton()" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">작성</a> -->
			</div>
		</form>
	</div>
	<!-- [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[게시글 작성 다이얼로그]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] -->
</body>
</html>
