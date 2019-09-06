function pop(arr) {
  var popped = arr[arr.length - 1]  ;

  if (arr.length > 0) arr.length = arr.length - 1 ;

  return popped ;
}

function push(arr) {
  for (var i = 1, len = arguments.length; i < len; i++) {
    arr[arr.length]  = arguments[i];
  }

  return arr.length;
}


var array = [1, 2, 3];
console.log(pop(array));                   // 3
console.log(array);           // [1, 2]
console.log(pop([]));                      // undefined
console.log(pop([1, 2, ['a', 'b', 'c']])); // [ 'a', 'b', 'c' ]

var array = [1, 2, 3];
console.log(push(array, 4, 5, 6));         // 6
console.log(array);           // [1, 2, 3, 4, 5, 6]
console.log(push([1, 2], ['a', 'b']));     // 3
console.log(push([], 1));                  // 1
console.log(push([]));                     // 0
