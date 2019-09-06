function push(arr,term){
  arr[arr.length] = term;
  return arr.length;
}

function add(toArr, fromArr){
  for(var i = 0; i < fromArr.length; i++){
    push(toArr,fromArr[i]);
  }
  return toArr;
}

function concat(arr1,arr2){
  var concatArr = [];
  concatArr = add(concatArr, arr1);
  return add(concatArr,arr2);
}



var arr1 = [1,2,3];
var arr2 = [4,5,6];
console.log(concat(arr1,arr2));       // [ 1, 2, 3, 4, 5, 6 ]
console.log(arr1);
console.log(arr2);
