//제공 함수를 통한 패턴분석 1
{
  console.log('test');

  let addNum = 0;
  const maxNum = 30;

  // var auto_1 = setInterval(() => {
  //   addNum++;
  //   console.log('addNum: ' + addNum);
  // }, 1000);

  var auto_2 = setInterval(() => {
    addNum--;
    document.write('addNum: ' + addNum, '<br>');
  }, 1000);
}
