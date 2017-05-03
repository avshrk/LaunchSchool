//Convert to string array: split
//convert each number to decimal: map
//add numbers: reduce

function octalToDecimal(number) {
  return number.split('').reverse().map(toDecimal).reduce(add);
}

function add(accu, value){
  return accu + value;
}

function toDecimal(number,power){
  return  parseInt(number,10) * Math.pow(8,power);
}
var r ;
r = octalToDecimal('1');           // 1
console.log(r);
r = octalToDecimal('10');          // 8
console.log(r);
r = octalToDecimal('130');         // 88
console.log(r);
r = octalToDecimal('17');          // 15
console.log(r);
r = octalToDecimal('2047');        // 1063
console.log(r);
r = octalToDecimal('011');         // 9
console.log(r);
