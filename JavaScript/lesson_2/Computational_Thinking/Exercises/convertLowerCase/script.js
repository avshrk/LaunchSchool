function toLowerCase(string) {
  var converted = '';

  for(var i = 0; i < string.length; i++){
    var ch = string[i];
    if (isUpperCase(ch)) ch = toLowerChar(ch);
    converted += ch ;
  }

  print(converted);
}

function toLowerChar(ch) {
  return String.fromCharCode(ch.charCodeAt() + 32 );
}

function isUpperCase(ch) {
  return ((ch <= 'Z' ) && (ch >= 'A'));
}

function print(text) {
  console.log(text);
}

toLowerCase('ALPHABET');      // "alphabet"
toLowerCase('123');           // "123"
toLowerCase('abcDEF');        // "abcdef"
