function isPrime(number) {
  if ( number < 2 ) return false;
  if ( number < 4 ) return true;
  if ( ( number % 2 === 0 ) || ( number % 3 === 0 )) return false;


  for (var i = 5; (i * i) < number; i += 6) {
    if (( number % i === 0 ) || ( number % ( i + 2 ) === 0 )) {
      return false;
    }
  }
  return true;
}

function checkGoldbach (number) {
  if ((number % 2 !== 0 ) || ( number < 4 )) {
    console.log('nul');
  }

  for (var i = 1; i <= (number / 2); i++ ) {
    if (isPrime(i) && (isPrime(number - i ))) {
      console.log(i + ' ' + (number - i));
    }
  }
}

checkGoldbach(3);
checkGoldbach(4);
checkGoldbach(12);
checkGoldbach(100);
