function oddElementsOf(arr) {
  var oddElements = [];
  for (var i = 1, len = arr.length; i < len; i += 2) {
    oddElements.push(arr[i]);
  }
  return oddElements ;
}

var digits = [4, 8, 15, 16, 23, 42];

console.log(oddElementsOf(digits)); // Returns [8, 16, 42]
