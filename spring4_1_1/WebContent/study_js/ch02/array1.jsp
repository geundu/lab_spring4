<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
  </head>
  <body>
    <script type="text/javascript">
      const d = new Array();
      d[0] = 28;
      d[1] = '유성열';
      d[2] = true;

      const d2 = new Array(50, 'hello', false);
      const d3 = [70, 'world', true];

      d.forEach((element) => {
        document.write(element, '<br>');
      });
      d2.forEach((element) => {
        document.write(element, '<br>');
      });
      d3.forEach((element) => {
        document.write(element, '<br>');
      });
    </script>
  </body>
</html>
