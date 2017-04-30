function shift(arr) {
  var firstElement = arr[0];

  shiftElementsLeft(arr);

  return firstElement;
}

function unshift(arr) {
  shiftElementsRight(arr,arguments.length - 1);

  for (var i = 1; i < arguments.length; i++) {
    arr[i] = arguments[i];
  }

  return arr.length;
}

function shiftElementsRight(arr,len) {
  for (var i = 0 ; i < arr.length; i++) {
    arr[len -1 + i] = arr[i];
  }
}

function shiftElementsLeft(arr) {
  if (arr.length === 0) return arr.length ;
  for (var i = 1; i < arr.length ; i++) {
    arr[i-1]= arr[i];
  }
  arr.length = arr.length - 1 ;
}

var arr2 = [1,2,3];
// console.log(shiftElementsRight(arr2,3));
console.log(shift(arr2));                // 1
console.log(shift([]));                       // undefined
var arr3 = shift([[1, 2, 3], 4 ,5]);
console.log(arr3);                          // [1, 2, 3]

var arr4 = unshift([1, 2, 3], 5, 6);        // 5
console.log(arr4);
var arr5 = unshift([1, 2, 3]);              // 3
console.log(arr5);
var arr6 = unshift([4, 5], [1, 2 ,3]);      // 3
console.log(arr6);

var testArray = [1, 2, 3];
console.log(shift(testArray));                // 1
console.log(testArray);                       // [2, 3]
console.log(unshift(testArray, 5));           // 3
console.log(testArray);                       // [5, 2, 3]
