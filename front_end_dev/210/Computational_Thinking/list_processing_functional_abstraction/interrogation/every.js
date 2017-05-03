function myOwnEvery(array, func) {
  for (var i = 0, len = array.length; i < len; i++) {
    if (!func(array[i])) return false;
  }
  return true;
}

var isAString = function(value) {
  return typeof value === 'string';
};

// function areAllNumbers(array) {
//   return myOwnEvery(array,isANumber);
// }

function areAllNumbers(array) {
  return myOwnEvery(array,function(element){
    return typeof value == 'number';
  });
}

var isANumber = function(value) {
  return typeof value === 'number';
};

console.log(areAllNumbers([1, 5, 6, 7, '1']));             // false
console.log(areAllNumbers([1, 5, 6, 7, 1]));               // true
console.log(myOwnEvery(['a', 'a234', '1abc'], isAString));       // true
