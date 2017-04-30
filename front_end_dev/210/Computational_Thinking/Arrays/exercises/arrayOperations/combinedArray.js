function combinedArray(even, odd) {
  var combined = [];
  for (var i = 0, len = even.length; i < len; i++) {
      combined.push(even[i]);
      combined.push(odd[i]);
  }
  return combined;
}

var digits = [4, 8, 15, 16, 23, 42];
var letters = ['A', 'L', 'V', 'A', 'R', 'H'];

console.log(combinedArray(digits, letters)); // Returns [4, "A", 8, "L", 15, "V", 16, "A", 23, "R", 42, "H"]
