<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String bm_no = request.getParameter("bm_no");
	String bm_title = request.getParameter("bm_title");
	String bm_writer = request.getParameter("bm_writer");
	String bm_content = request.getParameter("bm_content");
	String bs_file = request.getParameter("bs_file");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정 다이얼로그</title>
<jsp:include page="../../../common/commonUIglobal.jsp" flush="false" />
<script type="text/javascript">

	$(document).ready(function() {
		$('#ubm_title').textbox('setValue', '<%=bm_title%>');
		$('#ubm_writer').textbox('setValue', '<%=bm_writer%>');
		$('#ubm_content').textbox('setValue', '<%=bm_content%>');
	});

	function updAction() {
		console.log("수정액션 호출");
		$('#board_upd').submit();
	}
</script>
</head>
<body>
	<form id="board_upd" method="post" action="boardUpdate.sp4">
		<input type="hidden" name="bm_no" value="<%=bm_no%>">
		<input type="hidden" name="bs_file" value="<%=bs_file%>">
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" id="ubm_title" name="bm_title" label="제목:" labelPosition="top" data-options="prompt:'제목'" style="width: 400px;">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" id="ubm_writer" name="bm_writer" label="작성자:" labelPosition="top" data-options="prompt:'작성자'" style="width: 250px;">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" id="ubm_content" name="bm_content" label="내용:" labelPosition="top" data-options="prompt:'내용',multiline:true, width:500, height:120">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="bm_email" label="Email:" labelPosition="top" data-options="prompt:'Enter a email address...',validType:'email'"
				style="width: 100%;">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-textbox" name="bm_pw" label="비밀번호:" labelPosition="top" style="width: 200;">
		</div>
		<div style="margin-bottom: 20px">
			<input class="easyui-filebox" label="첨부파일:" name="bs_file" labelPosition="top" data-options="width:'400px'">
		</div>
	</form>
	<div id="ft_ins">
		<a href="javascript:updAction()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">수정</a>
		<a href='javascript:$("#dlg_upd").dialog("close");' class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">닫기</a>
	</div>
</body>
</html>