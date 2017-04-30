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

function shiftCells(arr,beg,len){
  for(var i = beg; i < arr.length; i++){
    arr[i] = arr[i+len];
  }
  arr.length = arr.length - len;
  return arr;
}

function splice(arr,beg,len){
  var spliced = slice(arr,beg,beg + len);
  arr = shiftCells(arr,beg,len);
  return spliced;
}

var count = [1, 2, 3, 4, 5, 6, 7, 8];
console.log(splice(count, 2, 5));        // [ 3, 4, 5, 6, 7 ]
console.log(count);                      // [ 1, 2, 8]
