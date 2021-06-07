<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <script type="text/javascript">
      function switchToDay(day) {
        switch (day) {
          case 0:
            day = '일';
            break;
          case 1:
            day = '월';
            break;
          case 2:
            day = '화';
            break;
          case 3:
            day = '수';
            break;
          case 4:
            day = '목';
            break;
          case 5:
            day = '금';
            break;
          case 6:
            day = '토';
            break;
        }

        return day;
      }
    </script>
  </head>
  <body>
    <script type="text/javascript">
      var tv = new Object();
      tv.color = 'bkack';
      tv.price = 300000;
      tv.info = function () {
        document.write('색상 = ' + tv.color, '<br>');
        document.write('가격 = ' + tv.price, '<br>');
      };
      tv.info();
      const today = new Date();
      let mon = today.getMonth() + 1;
      let date = today.getDate();
      let day = today.getDay();

      day = switchToDay(day);

      document.write(mon + '월 ' + date + '일 ' + day + '요일', '<br>');

      const worldcup = new Date(2020, 4, 30);
      mon = worldcup.getMonth();
      date = worldcup.getDate();
      day = worldcup.getDay();

      day = switchToDay(day);

      document.write(mon + '월 ' + date + '일 ' + day + '요일');
    </script>
  </body>
</html>
