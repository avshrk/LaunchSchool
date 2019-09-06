function uniqueElements(arr) {
  var uniqs = [];

  for (var i = 0, len = arr.length; i < len; i++) {
    if (uniqs.indexOf(arr[i]) === -1){
      uniqs.push(arr[i]);
    }
  }
  return uniqs;
}


console.log(uniqueElements([1, 2, 4, 3, 4, 1, 5, 4])); // Returns [1, 2, 4, 3, 5]
