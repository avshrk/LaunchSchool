function matrixSums(arr) {
  var sum = [];
  for (var i = 0, len = arr.length; i < len; i++) {
    sum.push(sumArray(arr[i]));
  }
  return sum;
}

function sumArray(arr){
  var sum = 0 ;
  for (var i = 0, len = arr.length; i < len; i++) {
    sum += arr[i] ;
  }
  return sum ;
}

console.log(matrixSums([[2, 8, 5], [12, 48, 0], [12]])); // Returns [15, 60, 12]
