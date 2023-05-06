// 각 항목의 현재 점수와 최고 점수를 배열로 표현
var scores = [
  { 현재점수: 84, 최고점수: 84 },
  { 현재점수: 74, 최고점수: 74 },
  // 추가 항목들...
];

// 백분율 계산 함수
function calculatePercentage(currentScore, maxScore) {
  return (currentScore / maxScore) * 100;
}

// 각 항목에 대해 백분율 계산 및 출력
scores.forEach(function (item) {
  var percentage = calculatePercentage(item.현재점수, item.최고점수);
  console.log('백분율:', percentage);
});