function signedIntegerToString(digits){
  if (digits === 0) return integerToString(digits);
  if (digits < 0) return '-' + integerToString(Math.abs(digits));
  if (digits > 0) return '+' + integerToString(digits);
}
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

console.log(signedIntegerToString(4321));      // "+4321"
console.log(signedIntegerToString(-123));      // "-123"
console.log(signedIntegerToString(0));         // "0"
