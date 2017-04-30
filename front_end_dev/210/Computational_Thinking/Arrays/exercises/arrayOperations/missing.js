function missing(arr){
  var first  = firstElement(arr);
  var last = lastElement(arr);
  var missingElemets = [];
  for(var i = first; i <= last;i++){
    if (arr.indexOf(i) === -1) missingElemets.push(i);
  }
  return missingElemets;
}

function firstElement(arr){
  return arr[0];
}
function lastElement(arr){
  return arr[arr.length - 1];
}
console.log(missing([-3, -2, 1, 5]));                  // [-1, 0, 2, 3, 4]
console.log(missing([1, 2, 3, 4]));                    // []
console.log(missing([1, 5]));                          // [2, 3, 4]
console.log(missing([6]));                             // []
