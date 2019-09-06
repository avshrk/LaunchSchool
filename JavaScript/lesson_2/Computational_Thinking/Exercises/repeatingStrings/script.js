
function repeat(string, times) {
  var concatString = '';

  if ((typeof times !== 'number')  || (times < 0 )) return print(undefined);

  for(var i = 0; i < times; i++ ){
    concatString += string;
  }
  return print(concatString);
}

function print(text) {
  console.log(text);
}

repeat('abc', 1);    // "abc"
repeat('abc', 2);    // "abcabc"
repeat('abc', -1);   // undefined
repeat('abc', 0);    // ""
repeat('abc', 'a');  // undefined
