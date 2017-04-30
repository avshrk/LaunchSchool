
function stringToSignedInteger(text){
  var sign = getSign(text);
  if (sign) return sign * stringToInteger(text.slice(1));
  return stringToInteger(text);
}

function getSign(text){
  if (text[0] === '-') return -1;
  if (text[0] === '+') return 1;
  return 0;
}

function stringToInteger(text) {
  var resultInt = 0;

  for(var i = 0; i < text.length; i += 1){
    resultInt = (resultInt * 10) + getDigit(text[i]);
  }

  return resultInt;
}

function getDigit(char){
  var digits = {
    '1': 1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9, '0':0,
  };
  return digits[char];
}


console.log(stringToSignedInteger('4321'));      // 4321
console.log(stringToSignedInteger('-570'));      // -570
console.log(stringToSignedInteger('+100'));      // 100

