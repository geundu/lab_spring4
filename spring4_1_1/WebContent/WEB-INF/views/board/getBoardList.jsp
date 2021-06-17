<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map"%>
<%@ page trimDirectiveWhitespaces="true"%>
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
<jsp:include page="../../../common/commonUIglobal.jsp" flush="false" />
<style type="text/css">
a {
	text-decoration: none;
}
</style>
<script type="text/javascript">
	function boardInsert() {
		$('#dlg_ins').dialog('open');
	}

	function boardSelect() {
		$('#dg_board').datagrid({
			url : './jsonGetBoardList.sp4',
			onLoadSuccess : function() {
				console.log('onLoadSuccess');
			}
		});
	}

	function insertButton() {
		document.insert_dialog.submit();
		alert('저장되었습니다.');
		$('#dlg_ins').dialog('close');
	}

	function boardDelete() {
		let row = $('#dg_board').datagrid('getSelected');
		if (row) {
			location.href = "boardDelete.sp4?bm_no=" + row.BM_NO;
		}
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$('#dg_board').datagrid({
			columns : [ [ {
				field : 'BM_NO',
				title : '글번호',
				width : 100
			}, {
				field : 'BM_TITLE',
				title : '제목',
				width : 300
			}, {
				field : 'BM_WRITER',
				title : '작성자',
				width : 100
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
				width : 100
			} ] ],
			toolbar : '#tb_board',
		/* onDblClickCell : function(index, field, value) {
			if ("BS_FILE" == field) {
				location.href = 'download.jsp?bs_file=' + value;
			}
		} */
		});
		$('#btn_sel').bind('click', function() {
			/* boardSelect(); */
		});

		$('#btn_ins').bind('click', function() {
			boardInsert();
		});
		$('#btn_upd').bind('click', function() {

		});
		$('#btn_del').bind('click', function() {
			/* boardDelete(); */
		});
	});
</script>
</head>
<body>
	<br /> WEB-INF 게시판 목록 페이지입니다.
	<br />
	<table id="dg_board" class="easyui-datagrid" data-options="title:'게시판', singleSelect:true" style="width: 1002px; height: 700px">
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
				<td>
					<!-- 댓글 -->
					<%
						String imgPath = "\\board\\";

					if (Integer.parseInt(String.valueOf((index.get("BM_POS")))) > 0) {

						for (int i = 0; i < Integer.parseInt(String.valueOf((index.get("BM_POS")))); i++) {
							out.print("&nbsp;&nbsp");
						}
					%>
					<img src="<%=imgPath%>reply.png" border="0">
					<%
						}
					%>
					<%=index.get("BM_NO")%></td>
				<td>
					<a href="./getBoardDetail.sp4?bm_no=<%=index.get("BM_NO")%>"><%=index.get("BM_TITLE")%></a>
				</td>
				<td><%=index.get("BM_WRITER")%></td>
				<td><%=index.get("BM_DATE")%></td>
				<%
					if (!"없음".equals(index.get("BS_FILE"))) {
				%>
				<td>
					<a href="./download.jsp?bs_file=<%=index.get("BS_FILE")%>"><%=index.get("BS_FILE")%></a>
				</td>
				<%
					}
				else {
				%>
				<td><%=index.get("BS_FILE")%></td>
				<%
					}
				%>
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

	<!-- [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[게시글 작성 다이얼로그]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] -->
	<div id="dlg_ins" class="easyui-dialog" title="글쓰기" data-options="iconCls:'icon-save, footer:#ft_ins', closed:'false'"
		style="width: 500px; height: 650px; padding: 10px">
		<form name="insert_dialog" action="./boardInsert.sp4" enctype="multipart/form-data" method="post">
			<div>
				<input class="easyui-textbox" type="text" name="bm_title" label="제목:" labelPosition="top" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_writer" label="작성자:" labelPosition="top" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_email" label="이메일:" labelPosition="top"
					data-options="prompt:'abcd@gmail.com', validType:'email'" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" type="text" name="bm_content" label="내용:" labelPosition="top" style="width: 100%"
					data-options="prompt:'내용', multiline:true, width:500, height:120" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="bm_pw" label="비밀번호:" labelPosition="top" type="password" style="width: 100%" />
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-filebox" name="bs_file" label="첨부파일:" labelPosition="top" data-options="width:'400px'">
			</div>
			<!-- <div>
				<button onClick="insertButton()" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">작성</button>
				<a href="javascript:insertButton()" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">작성</a>
			</div> -->
		</form>
		<div id="ft_ins">
			<a href="javascript:insertButton()" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">작성</a>
			<a href="javascript:$('dlg_ins').dialog('close')" class="easyui-linkbutton" data-options="iconCls:'icon-cancel',plain:true">닫기</a>
		</div>
	</div>
	<!-- [[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[게시글 작성 다이얼로그]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]] -->
</body>
</html>