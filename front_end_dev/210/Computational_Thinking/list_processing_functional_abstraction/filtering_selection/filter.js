function myFilter(array, func) {
  var result = [];
  for (var i = 0, len = array.length; i < len; i++) {
    if (isPythagoreanTriple(array[i])) {
      result.push(array[i]);
    }
  }
  return result ;
}

var isPythagoreanTriple = function(triple) {
  return Math.pow(triple.a, 2) + Math.pow(triple.b, 2) === Math.pow(triple.c, 2);
};

var res = myFilter([{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13},
          {a: 1, b: 2, c: 3}], isPythagoreanTriple);
console.log(res);
// returns [{a: 3, b: 4, c: 5}, {a: 5, b: 12, c: 13}]
