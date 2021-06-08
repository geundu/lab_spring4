// 즉시실행함수

{
  (function () {
    let num = 100;
    function menu() {
      num += 100;
      console.log(num);
    }
    menu();
  })();

  // 개발자 A와 B가 즉시 실행 함수에 지역변수와 지역함수를 선언하여 충돌을 방지함.

  (function () {
    let num = 100;
    function menu() {
      console.log(`num = ${num}`);
    }
    menu();
  })();
}
