/*
일반함수 정의방식과 익명함수 선언 참조 방식의 차이점
일반함수의 정의는 함수 호출 시 호이스팅(hoisting) 기술을 지원한다.
그러나 익명함수 선언 참조 방식은 호이스팅을 지원하지 않는다.
호이스팅을 적용하면 함수 정의문보다 호출이 먼저 일어나도
함수 정의를 head로 끌어올려 함수를 호출한다.
*/
{
  ('use strict');
  let count = 0;
  myFunction(count);
}

function myFunction(count) {
  count++;
  // document.write('hello' + count, '<br>');
  document.write(`hello ${count}<br>`);
}
myFunction(count);
