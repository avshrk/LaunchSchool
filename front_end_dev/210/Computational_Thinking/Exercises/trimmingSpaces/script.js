function trim(text) {
  var trimmed = trimLeading(text);
  return '"' + trimTrailing(trimmed)+ '"';
}

function trimLeading(text) {
  var i = 0;
  for(; i < text.length; i++){
    if (text[i] !== ' ') break;
  }
  return subString(text,i,text.length);
}

function trimTrailing(text){
  var i = text.length-1;
  for(; i > -1; i--){
    if (text[i] !== ' ') break;
  }
  return subString(text,0,i+1);
}

function subString(text, beg, length){
  var subRange = '';
  for (var i = beg; i < length; i++) {
    subRange += text[i];
  }
  return subRange;
}

console.log(trim('  abc  '));  // "abc"
console.log(trim('abc   '));   // "abc"
console.log(trim(' ab c'));    // "ab c"
console.log(trim(' a b  c'));  // "a b  c"
console.log(trim('      '));   // ""
console.log(trim(''));         // ""

