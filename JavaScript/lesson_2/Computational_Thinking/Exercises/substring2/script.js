function substring(string, start, end) {
  var substring = '';
  var start = determineIndex(start,string.legth);
  var end = determineIndex(end,string.length);

  if ( start > end  ) {
    substring = extractSubstring(string,end,start);
  } else {
    substring =  extractSubstring(string,start,end);
  }
  print(substring);
}

function determineIndex(index, length) {
  if (index === undefined) return length;
  if ( isNaN((Number(index))) || (index < 0)) return 0;
  if (index > length) return length ;
  return index;
}

function extractSubstring(string, begIndex, endIndex) {
  var sub = '';
  for(var i = begIndex; i < endIndex; i++){
    sub += string[i];
  }
  return sub;
}

function print(text){
  console.log(text);
}


var string = 'hello world';

substring(string, 2, 4);    // "ll"
substring(string, 4, 2);    // "ll"
substring(string, 4,4);    //''
substring(string, 0, -1);   // ""
substring(string, 2);       // "llo world"
substring(string, 'a');     // "hello world"
substring(string, 8, 20);   // "rld"
