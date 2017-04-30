function nthElementOf(arr,index) {
  return arr[index];
}
var digits = [4, 8, 15, 16, 23, 42];
digits[-1] = -99;
console.log(digits);
console.log(digits['-1']);
console.log(digits.length);
console.log(nthElementOf(digits, 3)); // Returns 16
console.log(nthElementOf(digits, 8)); // What does this return?
console.log(nthElementOf(digits, -1)); // What does this return?

