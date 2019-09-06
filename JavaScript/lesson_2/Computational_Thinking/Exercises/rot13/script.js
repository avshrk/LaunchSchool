function rot13(text){
  var cipher = '';

  for(var i = 0; i < text.length; i++){
    cipher += rotate(text[i]);
  }

  return cipher;
}

function rotate(letter){
  if (isUpperCase(letter)) return rotateUpperCase(letter);
  if (isLowerCase(letter)) return rotateLowerCase(letter);
  return letter;
}

function rotateUpperCase(letter){
  return forward(letter.charCodeAt(), 'A'.charCodeAt(), 'Z'.charCodeAt());
}

function rotateLowerCase(letter){
  return forward(letter.charCodeAt(), 'a'.charCodeAt(), 'z'.charCodeAt());
}

function forward(start, lowerBound, upperBound){
  var jump = start + 13 ;
  var code = ( jump > upperBound ) ? ((jump - upperBound) + (lowerBound - 1)) : jump ;
  return  String.fromCharCode(code);
}

function isUpperCase(letter) {
  return ((letter <= 'Z' ) && (letter >= 'A'));
}

function isLowerCase(letter) {
  return ((letter <= 'z' ) && (letter >= 'a'));
}

console.log(rot13(rot13('Teachers open the door, but you must enter by yourself.')));
console.log(rot13('Teachers open the door, but you must enter by yourself.'));

// logs:
// Grnpuref bcra gur qbbe, ohg lbh zhfg ragre ol lbhefrys.
