function concat(array1, secondArgument) {
  var concatArr = copyArray(array1);
  for (var i = 1, len = arguments.length; i < len; i++) {
    if (!Array.isArray(arguments[i])){
      push(concatArr,arguments[i]);
    } else {
      copyEachElement(concatArr, arguments[i]);
    }
  }
  return concatArr;
}

function copyArray(source) {
  var arrNew = [];
  for (var i = 0, len = source.length; i < len; i++) {
    arrNew[i] = source[i];
  }
  return arrNew;
}

function copyEachElement(arrTo, arrFrom) {
  for (var i = 0, len = arrFrom.length; i < len; i++) {
    arrTo.push(arrFrom[i]);
  }
  return arrTo;
}

function push(toArr,element) {
  toArr[toArr.length] = element;
  return toArr;
}

console.log(concat([1, 2 ,3], [4, 5, 6], [7, 8, 9]));           // [ 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
console.log(concat([1, 2], "a", ["one", "two"]));               // [ 1, 2, "a", "one", "two" ]
console.log(concat([1, 2], ["three"], 4));                      // [ 1, 2, "three", 4 ]

