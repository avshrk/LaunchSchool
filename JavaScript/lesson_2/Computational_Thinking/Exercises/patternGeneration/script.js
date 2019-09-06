
function generatePattern(number) {
  for(var i = 1; i <= number; i++) {
    console.log(numbersUpTo(i) + numberOfStars(number,i));
  }
}

function numberOfStars(number,counter) {
  var stars = '';
  for(var i = (counter + 1); i <= number; i++){
    stars += '*'.repeat(String(i).length);
  }
  return stars ;
}

function numbersUpTo(number) {
  var numbers = '';
  for(var i = 1; i <= number; i++){
    numbers += String(i);
  }
  return numbers ;
}

console.log(generatePattern(17));

