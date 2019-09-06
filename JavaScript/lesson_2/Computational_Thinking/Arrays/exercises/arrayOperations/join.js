var assert = require('assert');
var join = function (arr,seperator){
  var joined = '';
  var i = 0;
  for(; i < arr.length - 1; i++){
    joined += String(arr[i]) + seperator ;
  }
  joined += String(arr[i]);
  return joined;
}

assert(join(['bri', 'tru', 'wha'], 'ck ') === 'brick truck wha','is not equal "brick truck wha"');
// console.log(join(['bri', 'tru', 'wha'], 'ck '));       // 'brick truck wha'
// console.log(join([1, 2, 3], ' and '));
