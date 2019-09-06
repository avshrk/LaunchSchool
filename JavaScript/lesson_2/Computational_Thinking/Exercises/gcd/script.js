// function gcd(first, second) {
//   var firstNumber = Math.abs(first);
//   var secondNumber = Math.abs(second);
//   while ( secondNumber > 0 ) {
//     var temp = firstNumber ;
//     firstNumber = secondNumber;
//     secondNumber = temp % secondNumber;
//   }
//   console.log(firstNumber);
// }

function gcd(first,second) {
  return (second > 0) ? gcd(second, first % second) : first ;
}

console.log(gcd(4,12));   // 4
console.log(gcd(12, 4));   // 4
console.log(gcd(15, 10));  // 5
console.log(gcd(9, 2));    // 1
