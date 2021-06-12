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
<jsp:include page="../../../common/commonUIglobal.jsp" flush="false" />
<script type="text/javascript">
	function boardUpdate() {
		$('#dlg_upd').dialog('open');
	}

	function isCorrect() {

		let bm_pw ="<%=boardDetail.get(0).get("BM_PW")%>"
		let user_pw = document.getElementsByName("bm_pw");
		if (bm_pw == user_pw[1].value) {

			alert('수정되었습니다.');
			$('#dlg_upd').dialog('close');

			return true;
		} else {
			alert('비밀번호가 틀렸습니다.');
			return false;
		}
	}

	function updateButton() {

	}

	function updateForm() {

	}
</script>
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
			<td><input id="bm_writer" value="<%=boardDetail.get(0).get("BM_WRITER")%>" name="bm_writer" class="easyui-textbox" readonly></td>
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
			<td><input id="bm_pw" value="" name="bm_pw" class="easyui-passwordbox"></td>
		</tr>
	</table>

	<div id="dlg_upd" class="easyui-dialog" title="게시글 수정" data-options="iconCls:'icon-save', closed:'false'"
		style="width: 500px; height: 500px; padding: 10px">
		<form name="dialog_update" action="./boardUpdate.sp4" method="get" onsubmit="return isCorrect()">
			<div>
				<input class="easyui-textbox" type="text" name="bm_no" value="<%=boardDetail.get(0).get("BM_NO")%>" label="번호:" labelPosition="top"
					style="width: 100%" readonly />
			</div>
			<div>
				<input class="easyui-textbox" type="text" name="bm_title" value="<%=boardDetail.get(0).get("BM_TITLE")%>" label="제목:" labelPosition="top"
					style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_content" value="<%=boardDetail.get(0).get("BM_CONTENT")%>"
					data-options="multiline:'true', width:'570px', height:'90px'" label="내용:" labelPosition="top" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="bm_pw" label="비밀번호:" labelPosition="top" type="password" style="width: 100%" />
			</div>
			<div>
				<button type="submit" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">수정</button>
			</div>
		</form>
	</div>

	<div id="tb_read" style="padding: 2px 5px;" align="center">
		<a href="javascript:repleForm()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">댓글쓰기</a>
		<a href="javascript:boardUpdate()" class="easyui-linkbutton" iconCls="icon-add" plain="true">수정</a>
		<a href="javascript:boardDelView()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
		<a href="./getBoardList.sp4" class="easyui-linkbutton" iconCls="icon-search" plain="true">목록</a>
	</div>
</body>
</html>