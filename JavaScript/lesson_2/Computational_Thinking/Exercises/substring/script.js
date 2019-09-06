function substr(string, start, length) {
  var beg ;
  var end;
  var substring = '';

  beg = begIndex(start, string.length);
  end = length + beg ;

  for(var i = beg; i < end; i++){
    if ( string[i] === undefined ) break ;
    substring += string[i];
  }
  return print(substring);
}

function begIndex(index, length) {
  return (index < 0 ) ? length + index : index ;
}

function print(text){
  console.log('-' + text + '-');
}

var string = 'hello world';

substr(string, 2, 4);     // "llo "
substr(string, -3, 2);    // "rl"
substr(string, 8, 20);    // "rld"
substr(string, 0, -20);   // ""
substr(string, 0, 0);     // ""
