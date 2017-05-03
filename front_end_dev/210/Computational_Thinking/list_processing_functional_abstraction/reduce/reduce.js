function myReduce(array, func, initial) {
  var result = initial ;
  var index = 0;

  if (result === undefined){
    result = array[index];
    index += 1;
  }

  array.slice(index).forEach(function(element){
    result = func(result, element);
  });

  return result;
}

var smallest = function(result, value) {
  return result <= value ? result : value;
};

var sum = function(result, value) {
  return result + value;
};

var r = myReduce([5, 12, 15, 1, 6], smallest);           // 1
console.log(r);
r = myReduce([5, 12, 15, 1, 6], sum, 10);            // 49
console.log(r);
