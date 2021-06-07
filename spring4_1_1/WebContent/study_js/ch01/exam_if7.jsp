<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/common/commonUIglobal.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script type="text/javascript">
      function test() {
        let search = prompt('당신이 좋아하는 검색엔진은?', '');
        let url;
        switch (search) {
          case 'naver':
            url = 'www.naver.com';
            break;
          case 'google':
            url = 'www.google.com';
            break;
          default:
            document.write('고르라고');
            break;
        }
        if (url) {
          location.href = 'http://' + url;
        }
      }
    </script>
  </head>
  <body>
    전
    <script type="text/javascript">
      test();
    </script>
    후
  </body>
</html>
