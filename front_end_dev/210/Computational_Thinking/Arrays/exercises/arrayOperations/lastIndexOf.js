function lastIndexOf(arr,value){
  for(var i = (arr.length - 1); i >= 0; i--){
    if (arr[i] === value) return i ;
  }
  return -1;
}
