function firstNOf(arr, count) {
  return arr.slice(0,count);
}

var digits = [4, 8, 15, 16, 23, 42];
console.log(firstNOf(digits, 3)); // Returns [4, 8, 15]
