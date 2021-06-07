<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>게시판 구현 - WebContent</title>
    <jsp:include page="../common/commonUIglobal.jsp" flush="false" />
    <script type="text/javascript">
      function search() {
        $("#dg_board").datagrid({
          url: "jsonGetBoardList.sp4",
        });
      }
      function insert() {
        $("#dlg_insert").dialog("open");
      }
    </script>
    <script type="text/javascript">
      $(document).ready(function () {
        $("#dg_board").datagrid({
          toolbar: "#ft",
        });
      });
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
    <table id="dg_board" class="easyui-datagrid" data-options="title:'게시판', singleSelect:true">
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
    <div id="ft" style="padding: 2px 5px">
      <a href="javascript:search()" class="easyui-linkbutton" iconCls="icon-search" plain="true">조회</a>
      <a href="javascript:insert()" class="easyui-linkbutton" iconCls="icon-add" plain="true">입력</a>
      <a href="#" class="easyui-linkbutton" iconCls="icon-edit" plain="true">수정</a>
      <a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true">삭제</a>
    </div>
    <div id="dlg_insert" class="easyui-dialog" title="Insert Data" data-options="iconCls:'icon-save', closed : true">
      <div style="margin-bottom: 20px">
        <input
          class="easyui-textbox"
          label="Email:"
          labelPosition="top"
          data-options="prompt:'Enter a email address...',validType:'email'"
          style="width: 100%"
        />
      </div>
      <div style="margin-bottom: 20px">
        <input class="easyui-textbox" label="First Name:" labelPosition="top" style="width: 100%" />
      </div>
      <div style="margin-bottom: 20px">
        <input class="easyui-textbox" label="Last Name:" labelPosition="top" style="width: 100%" />
      </div>
      <div style="margin-bottom: 20px">
        <input class="easyui-textbox" label="Company:" labelPosition="top" style="width: 100%" />
      </div>
      <div>
        <a href="#" class="easyui-linkbutton" iconCls="icon-ok" style="width: 100%; height: 32px">INSERT</a>
      </div>
    </div>
  </body>
</html>
