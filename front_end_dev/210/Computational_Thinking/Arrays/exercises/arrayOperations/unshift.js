function push(arr,term){
  arr[arr.length] = term;
  return arr.length;
}

function unshift(arr,value){
  for(var i = arr.length; i >= 0  ; i--){
    push(arr[i], arr[i-1]);
    // arr[i] = arr[i-1];
  }
  arr[0] = value;
 return arr.length;
}
