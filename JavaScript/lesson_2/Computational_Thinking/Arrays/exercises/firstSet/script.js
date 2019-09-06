
function lastInArray(arr){
  return arr[arr.length - 1];
}

var myArr = [1,2,3,4];

// console.log(lastInArray(myArr));

function rollCall(names){
  for(var i = 0; i < names.length; i++){
    console.log(names[i]);
  }
}

// rollCall(['bla','foo','bla2','foo2']);

function reverseArr(arr){
  var reversed = [];
  for(var i = arr.length - 1; i >= 0; i-- ){
    var index = arr.length - 1 - i;
    reversed[index] = arr[i];
  }
  return reversed;
}

var myArr = [1,2,3,4,5,6,7];

// console.log(reverseArr(myArr));

function index(myArr,search){
  var i = 0;
  for(; i < myArr.length; i++){
    if (search === myArr[i]) break;
  }
  return (myArr[i] === search) ? i : -1;
}

var myArr = ['a','o','d','e'];
// console.log(index(myArr,'d'));
// console.log(index(myArr,'z'));

function toString(myArr){
  var stringArr = '';
  for(var i = 0; i < myArr.length; i++){
   stringArr += String(myArr[i]);
  }
  return stringArr;
}
var myArr = ['a','o','d','e',1,3,4];
console.log(toString(myArr));

