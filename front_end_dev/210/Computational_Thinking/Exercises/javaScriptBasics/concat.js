function concat(array1, secondArgument) {
  var concatArr = copyArray(array1);
  if (!Array.isArray(secondArgument)) return push(concatArr,secondArgument);
  return copyEachElement(concatArr, secondArgument);
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


console.log(concat([1, 2, 3], [4, 5, 6]));            // [1, 2, 3, 4, 5, 6]
console.log(concat([1, 2], 3));                       // [1, 2, 3]
console.log(concat([2, 3], ['two', 'three']));        // [2, 3, "two", "three"]
console.log(concat([2, 3], 'four'));                  // [2, 3, "four"]
var obj = { a: 2, b: 3 };
var newArray = concat([2, 3], obj);      // [2, 3, { a: 2, b: 3 }]
obj.a = 'two';
console.log(newArray);                                // [2, 3, { a: 'two', b: 3 }]

var arr1 = [1, 2, 3];
var arr2 = [4, 5, obj];
var arr3 = concat(arr1, arr2);
console.log(arr3);                                    // [1, 2, 3, 4, 5, { a: 'two', b: 3 }]
obj.b = 'three';
console.log(arr3);                                    // [1, 2, 3, 4, 5, { a: 'two', b: 'three' }]

arr3[5].b = 3;                           // or arr3[5]['b'] = 3
console.log(obj);                                     // { a: 'two', b: 3 }

