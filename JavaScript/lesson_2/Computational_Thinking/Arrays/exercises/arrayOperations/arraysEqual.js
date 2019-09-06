function arraysEqual(arrFirst, arrSecond) {
  if (arrFirst.length !== arrSecond.length) return false;

  for (var i = 0, len = arrFirst.length; i < len; i++) {
    if (arrFirst[i] !== arrSecond[i]) return false;
  }
  return true;
}


console.log(arraysEqual([1], [1]));                               // true
console.log(arraysEqual([1], [2]));                               // false
console.log(arraysEqual([1, 2], [1, 2, 3]));                      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hi', true]));       // true
console.log(arraysEqual([1, 'hi', true], [1, 'hi', false]));      // false
console.log(arraysEqual([1, 'hi', true], [1, 'hello', true]));    // false
console.log(arraysEqual([1, 'hi', true], [2, 'hi', true]));       // false
