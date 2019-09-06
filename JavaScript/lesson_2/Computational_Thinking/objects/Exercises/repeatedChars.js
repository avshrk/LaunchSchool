function repeatedCharacters(text){
  var chars = text.split('');
  var repeatedChars = {};

  for (var i = 0, len = chars.length; i < len; i++) {
    if (!repeatedChars[chars[i].toLowerCase()]) {
      var repCount = repetitionCount(chars, chars[i].toLowerCase());
      if ( repCount > 1  ) repeatedChars[chars[i].toLowerCase()] = repCount;
    }
  }
  return repeatedChars;
}
function repetitionCount(list,element){
  var count = 0 ;
  for (var i = 0, len = list.length; i < len; i++) {
    if(list[i].toLowerCase() === element.toLowerCase()) count++;
  }
  return count;
}

function print(message){
  console.log(message);
}

var result ;
result = repeatedCharacters('Programming');    // { r: 2, g: 2, m: 2 }
print(result);
result = repeatedCharacters('Combination');    // { o: 2, i: 2, n: 2 }
print(result);
result = repeatedCharacters('Pet');            // {}
print(result);
result = repeatedCharacters('Paper');          // { p: 2 }
print(result);
result = repeatedCharacters('Baseless');       // { s: 3, e: 2 }
print(result);
