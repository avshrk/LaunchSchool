


function joinArray(arr, joiner) {
  var joined = String(arr[0]);
  joiner = joiner || '';
  for (var i = 1, len = arr.length; i < len; i++) {
    joined +=  joiner + String(arr[i]) ;
  }
  return joined ;
}
console.log(joinArray(['a', 'b', 'c'], '+')); // Returns "a+b+c"
console.log(joinArray([1, 4, 1, 5, 9, 2, 7])); // Returns "1415927"
