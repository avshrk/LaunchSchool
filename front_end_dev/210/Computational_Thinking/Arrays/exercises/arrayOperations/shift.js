function push(arr,term){
  arr[arr.length] = term;
  return arr.length;
}

function shift(arr){
  var first = arr[0];
  for(var i = 1; i < arr.length; i++){
    push(arr[i-1], arr[i]);
    // arr[i-1] = arr[i];
  }
  arr.length = arr.length - 1;
  return  first ;
}
