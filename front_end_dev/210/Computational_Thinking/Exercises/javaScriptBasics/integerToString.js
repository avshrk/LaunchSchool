function integerToString(digits){
  var digitString = '';
  if (digits <= 9) return getString(digits);

  while(digits > 0) {
    var lastDigit = digits % 10;
    digitString = getString(lastDigit) + digitString;
    digits = Math.floor(digits / 10)  ;
  }
  return digitString;
}
function getString(digit) {
  var numbers = ['0','1','2','3','4','5','6','7','8','9'];
  return numbers[digit];
}
console.log(integerToString(4321));    // "4321"
console.log(integerToString(0));       // "0"
console.log(integerToString(5000));    // "5000"
