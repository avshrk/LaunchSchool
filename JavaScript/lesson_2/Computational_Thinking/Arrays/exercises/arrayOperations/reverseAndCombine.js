function reverseAndCombine (arr) {
  var combined = [];
  for (var i = 0, len = arr.length; i < len; i++) {
    combined.push(arr[i]) ;
  }
  for (var i = arr.length - 1 ; i >= 0 ; i--) {
    combined.push(arr[i]);
  }
  return combined;
}
var digits = [1,2,3,4,5];
console.log(reverseAndCombine(digits));
