
function indexOf(searchString, substring) {
  var lengthSubstring = substring.length;
  var lengthSearchString = searchString.length;

  for (var i = 0; i <= ( lengthSearchString - lengthSubstring ); i++){
    var chunk = stringRange(searchString, i, lengthSubstring);
    if ( chunk === substring ) return i ;
  }
  return -1;
}

function lastIndexOf(searchString, substring) {
  var lengthSubstring = substring.length;
  var lengthSearchString = searchString.length;

  for (var i = (lengthSearchString - lengthSubstring); i >= 0; i--){
    var chunk = stringRange(searchString, i, lengthSubstring);
    if ( chunk === substring ) return i ;
  }
  return -1;

}

function stringRange(text, beg, length){
  var subRange = '';
  for (var i = beg; i < beg + length; i++) {
    subRange += text[i];
  }
  return subRange;
}

// console.log(stringRange('avsharkoksal',6,6));
console.log(indexOf('Some strings', 's'));      // 5
console.log(indexOf('Blue Whale', 'Whale'));    // 5
console.log(indexOf('Blue Whale', 'Blute'));    // -1
console.log(indexOf('Blue Whale', 'leB'));      // -1

console.log(lastIndexOf('Some strings', 's'));                  // 11
console.log(lastIndexOf('Blue Whale, Killer Whale', 'Whale'));  // 19
console.log(lastIndexOf('Blue Whale, Killer Whale', 'all'));    // -1
