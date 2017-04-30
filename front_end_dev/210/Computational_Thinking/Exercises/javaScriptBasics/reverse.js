function reverse(inputForReversal) {
  if (typeof inputForReversal === 'string') return reverseString(inputForReversal);
  return reverseArray(inputForReversal);
}

function reverseString(str) {
  var reversedStr = '';
  var i ;

  for (i = (str.length - 1) ; i >= 0; i--) {
    reversedStr += str[i] ;
  }
  return  reversedStr;
}

function reverseArray(arr) {
  var reversedArr = [];
  var i ;

  for (i = (arr.length - 1) ; i >= 0; i--) {
    reversedArr[(arr.length - 1) - i] =  arr[i] ;
  }
  return  reversedArr;
}


console.log(reverse('Hello'));          // olleH
console.log(reverse('a'));              // a
console.log(reverse([1, 2, 3, 4]));     // [4, 3, 2, 1]
console.log(reverse([]));               // []
