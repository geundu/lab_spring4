//제공 함수를 통한 패턴분석 1
{
  let addNum = 0;

  var auto_2 = setInterval(() => {
    addNum--;
    console.log('addNum: ' + addNum);
  }, 500);

  const auto = setTimeout(() => {
    auto_2();
    console.log('addNum = ' + addNum);
  }, 5000);
}
