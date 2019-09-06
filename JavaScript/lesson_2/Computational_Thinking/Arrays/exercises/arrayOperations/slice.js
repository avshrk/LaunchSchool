function push(arr,term){
  arr[arr.length] = term;
  return arr.length;
}

function slice(arr,start,end){
  var sliced = [];
  for(var i = start; i < end ; i++){
    push(sliced,arr[i]);
  }
  return sliced;
}



console.log(slice([1, 2, 3, 4, 5], 0, 2));                         // [ 1, 2 ]
console.log(slice(['a', 'b', 'c', 'd', 'e', 'f', 'g'], 1, 3));     // [ 'b', 'c' ]
