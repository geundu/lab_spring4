<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%
	List<Map<String, Object>> boardDetail = (List<Map<String, Object>>) request.getAttribute("boardDetail");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>게시판 구현 - WEB-INF</title>
<jsp:include page="../../../common/commonUIglobal.jsp" flush="false" />
<script type="text/javascript">
	function replyDialogOpen() {
		$("#dlg_reply").dialog('open');
	}

	function isCorrectReply() {
		let user_title = document.getElementsByName("bm_title");
		alert(user_title[1].value);
		let user_writer = document.getElementsByName("bm_writer");
		alert(user_writer[1].value);
		let user_email = document.getElementsByName("bm_email");
		alert(user_email[1].value);
		let user_content = document.getElementsByName("bm_content");
		alert(user_content[1].value);
		let user_pw = document.getElementsByName("bm_pw");
		alert(user_pw[1].value);
		if (user_title[1].value == "" || user_writer[1].value == ""
				|| user_email[1].value == "" || user_content[1].value == ""
				|| user_pw[1].value == "") {
			alert('모든 항목을 입력해주세요.');
			return false;

		} else {
			alert('작성되었습니다.');
			$('#dlg_reply').dialog('close');
			$('#f_reply').submit();

			return true;
		}
	}
	function boardUpdate() {
		if (isCorrect()) {
			alert('수정되었습니다.');
			$('#read_update').submit();
		} else {
			alert('비밀번호가 틀렸습니다.');
		}
	}

	function isCorrect() {
		let bm_pw = <%=boardDetail.get(0).get("BM_PW")%>
		let user_pw = document.getElementById("bm_pw");
		if (bm_pw == user_pw.value) {
			return true;
		} else {
			return false;
		}
	}

	function boardDelete() {
		if (isCorrect()) {
			alert('삭제되었습니다.');
			location.href = './boardDelete.sp4?bm_no=<%=boardDetail.get(0).get("BM_NO")%>&bs_file=<%=boardDetail.get(0).get("BS_FILE")%>';
	} else {
			alert('비밀번호가 틀렸습니다.');
		}
	}
</script>
</head>
<body>
	<!-- 조회 및 수정 창 시작 -->
	<form id="read_update" action="./boardUpdate.sp4" enctype="multipart/form-data" method="get">
		<input type="hidden" name="bm_no" value="<%=boardDetail.get(0).get("BM_NO")%>">
		<table align="center" id="p" class="easyui-panel" title="글상세보기" data-options="footer:'#tb_read'"
			style="width: 670px; height: 380px; padding: 10px; background: #fafafa">
			<tr>
				<td>제목</td>
				<td>
					<input id="bm_title" value="<%=boardDetail.get(0).get("BM_TITLE")%>" name="bm_title" data-options="width:'450px'" class="easyui-textbox">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input id="bm_writer" value="<%=boardDetail.get(0).get("BM_WRITER")%>" name="bm_writer" class="easyui-textbox" readonly>
				</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>
					<input id="bm_email" value="<%=boardDetail.get(0).get("BM_EMAIL")%>" name="bm_email" class="easyui-textbox">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<input id="bm_content" value="<%=boardDetail.get(0).get("BM_CONTENT")%>" name="bm_content"
						data-options="multiline:'true',
                  width:'570px', height:'90px'" class="easyui-textbox">
				</td>
			</tr>
			<tr>
				<td width="100px">첨부파일</td>
				<td width="500px">
					<input id="bs_file" value="<%=boardDetail.get(0).get("BS_FILE")%>" name="bs_file" class="easyui-filebox" name="bs_file"
						data-options="width:'400px'" />
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td>
					<input id="bm_pw" value="" name="bm_pw" class="easyui-passwordbox" />
				</td>
			</tr>
		</table>
	</form>
	<%--
          <div
            id="dlg_upd"
            class="easyui-dialog"
            title="게시글 수정"
            data-options="iconCls:'icon-save', closed:'false'"
            style="width: 500px; height: 500px; padding: 10px"
          >
            <form name="dialog_update" action="./boardUpdate.sp4" method="get" onsubmit="return isCorrect()">
              <input type="hidden" name="bm_no" value="<%=boardDetail.get(0).get("BM_NO")%>">
              <div>
                <input class="easyui-textbox" type="text" name="bm_title" value="<%=boardDetail.get(0).get("BM_TITLE")%>" label="제목:"
                labelPosition="top" style="width: 100%" />
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
          --%>

	<div id="tb_read" style="padding: 2px 5px" align="center">
		<a href="javascript:replyDialogOpen()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">댓글쓰기</a>
		<a href="javascript:boardUpdate()" class="easyui-linkbutton" iconCls="icon-add" plain="true">수정</a>
		<a href="javascript:boardDelete()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
		<a href="./getBoardList.sp4" class="easyui-linkbutton" iconCls="icon-search" plain="true">목록</a>
	</div>

	<!-- 댓글 작성 다이얼로그 시작 -->
	<div id="dlg_reply" title="댓글쓰기" class="easyui-dialog" style="width: 600px; height: 400px; padding: 10px"
		data-options="closed:'true', modal:'true', footer:'#tbar_reply'">
		<!-- 
	form전송시 encType옵션이 추가되면 request객체로 사용자가 입력한 값을 꺼낼 수 없다.
	MultipartRequest  => cos.jar
	 -->
		<form id="f_reply" action="./boardInsert.sp4" enctype="multipart/form-data" method="post">
			<input type="hidden" name="bm_no" value="<%=boardDetail.get(0).get("BM_NO")%>">
			<input type="hidden" name="bm_group" value="<%=boardDetail.get(0).get("BM_GROUP")%>">
			<input type="hidden" name="bm_pos" value="<%=boardDetail.get(0).get("BM_POS")%>">
			<input type="hidden" name="bm_step" value="<%=boardDetail.get(0).get("BM_STEP")%>">
			<!-- <form id="f_reply"> -->
			<table>
				<tr>
					<td width="100px">제목</td>
					<td width="500px">
						<input class="easyui-textbox" data-options="width:'350px'" name="bm_title" required />
					</td>
				</tr>
				<tr>
					<td width="100px">작성자</td>
					<td width="500px">
						<input class="easyui-textbox" data-options="width:'150px'" name="bm_writer" required />
					</td>
				</tr>
				<tr>
					<td width="100px">이메일</td>
					<td width="500px">
						<input class="easyui-textbox" data-options="width:'250px'" name="bm_email" required />
					</td>
				</tr>
				<tr>
					<td width="100px">내용</td>
					<td width="500px">
						<input class="easyui-textbox" name="bm_content" data-options="multiline:'true',width:'400px',height:'90px'" required />
					</td>
				</tr>
				<tr>
					<td width="100px">첨부파일</td>
					<td width="500px">
						<input class="easyui-filebox" name="bs_file" label="첨부파일:" labelPosition="top" data-options="width:'400px'" />
					</td>
				</tr>
				<tr>
					<td width="100px">비번</td>
					<td width="500px">
						<input class="easyui-textbox" type="password" data-options="width:'100px'" name="bm_pw" required />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div id="tbar_reply" align="right">
		<a href="javascript:isCorrectReply()" class="easyui-linkbutton" iconCls="icon-save">저장</a>
		<a href="javascript:$('#dlg_reply').dialog('close')" class="easyui-linkbutton" iconCls="icon-cancel">닫기</a>
	</div>
	<!-- 댓글 작성 다이얼로그 끝 -->
</body>
</html>