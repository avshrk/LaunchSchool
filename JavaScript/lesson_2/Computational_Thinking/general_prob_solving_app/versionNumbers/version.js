// PEDAC
//
// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
// If version1 > version2, we should return 1.
// If version1 < version2, we should return -1.
// If version1 === version2, we should return 0.
// If either version number contains characters other than digits and the '.'
// character, we should return null.

// Input: two String
// Output: 1, -1, 0
// Data Array of numbers
// Convert each string parameter into a integer array
// trailing zeros are redundant
// forEach array element compare

function compareVersions(version1, version2) {
  var firstVer = numbersList(version1);
  var secondVer = numbersList(version2);

  if (version1.match(/[^0-9.]/) || version2.match(/[^0-9\.]/)) return null;

  firstVer.length = removeTrailingZeros(firstVer);
  secondVer.length = removeTrailingZeros(secondVer);

  var len = (firstVer.length < secondVer.length) ? firstVer.length : secondVer.length;

  for (var i = 0; i < len; i++) {
    if (firstVer[i] > secondVer[i]) return 1;
    if (firstVer[i] < secondVer[i]) return -1;
  }

  if (firstVer.length !== secondVer.length){
    return (firstVer.length > secondVer.length) ? 1 : -1;
  }

  return 0;
}

function numbersList(nums){
  return  nums.split('.').map(Number);
}

function removeTrailingZeros(numList){
  var trueLength = numList.length;

  for (var i = numList.length - 1; i >= 0; i--) {
    if (numList[i] === 0 ){
      trueLength -= 1;
    } else {
      return trueLength ;
    }
  }
}

console.log(compareVersions('1', '1'));          // 0
console.log(compareVersions('1.1', '1.0'));      // 1
console.log(compareVersions('2.3.4', '2.3.5'));  // -1
// console.log(compareVersions('1.a', '1'));        // null
// console.log(compareVersions('.1', '1'));         // null
// console.log(compareVersions('1.', '2'));         // null
// console.log(compareVersions('1..0', '2.0'));     // null
console.log(compareVersions('1.0', '1.0.0'));    // 0
console.log(compareVersions('1.0.0', '1.1'));    // -1
console.log(compareVersions('1.0', '1.0.5'));    // -1
// var r ;

// r = compareVersions('1.0','1.0.2'); // -1
// console.log(r);
// r = compareVersions('1.1','1.1.2'); // -1
// console.log(r);
// r = compareVersions('2.1','3.1'); //-1
// console.log(r);
// r = compareVersions('1.1.1.1','1.1.1.2'); //-1
// console.log(r);
// r = compareVersions('0.1','1'); // -1
// console.log(r);
// r = compareVersions('1','1.0'); // 0
// console.log(r);
// r = compareVersions('1','1.0.0'); // 0
// console.log(r);
// r = compareVersions('3','1.0'); // 1
// console.log(r);
// r = compareVersions('1.0.1','1.0'); // 1
// console.log(r);
// r = compareVersions('1.0','1.1'); //-1
// console.log(r);
// r = compareVersions('1.1','1.2'); //-1
// console.log(r);
// r = compareVersions('1.2','1.2.0.0'); //0
// console.log(r);
// r = compareVersions('1.2.0.0','1.18.2'); //-1
// console.log(r);
// r = compareVersions('1.18.2','13.37'); // -1
// console.log(r);


// 0.1 < 1 = 1.0 < 1.1 < 1.2 = 1.2.0.0 < 1.18.2 < 13.37
