function lastNOf(arr, count) {
  if (arr.length < count) return arr.slice(0);
  return arr.slice((arr.length - count));
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(lastNOf(digits, 3)); // Returns [16, 23, 42]
console.log(lastNOf(digits, 8)); // Returns [4, 8, 15, 16, 23, 42]
console.log(lastNOf(digits, 6)); // Returns [4, 8, 15, 16, 23, 42]
console.log(lastNOf(digits, 5)); // Returns [4, 8, 15, 16, 23, 42]
