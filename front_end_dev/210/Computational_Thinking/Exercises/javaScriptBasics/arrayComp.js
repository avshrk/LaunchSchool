
function areArraysEqual(array1, array2) {
  var sortedAr1;
  var sortedAr2;

  if (array1.length !== array2.length) return false;

  sortedAr1 = array1.slice().sort();
  sortedAr2 = array2.slice().sort();

  return compareElements(sortedAr1, sortedAr2);
}

function compareElements(ar1, ar2) {
  for (var i = 0; i < ar1.length; i++) {
    if (ar1[i] !== ar2[i]) return false;
  }
  return true;
}

function log(term) {
  console.log(term);
}
// log(areArraysEqual([1, 2, 3], [1, 2, 3]));                  // true
// log(areArraysEqual([1, 2, 3], [3, 2, 1]));                  // true
// log(areArraysEqual(['a', 'b', 'c'], ['b', 'c', 'a']));      // true
// log(areArraysEqual(['1', 2, 3], [1, 2, 3]));                // false
// log(areArraysEqual([1, 1, 2, 3], [3, 1, 2, 1]));            // true
// log(areArraysEqual([1, 2, 3, 4], [1, 1, 2, 3]));            // false
// log(areArraysEqual([1, 1, 2, 2], [4, 2, 3, 1]));            // false
