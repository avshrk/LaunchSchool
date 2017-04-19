function fizzBuzz() {
  for(var i = 1; i <= 100; i++){
    var message = '' ;

    if ( i % 3 === 0 ) {
      message = 'Fizz';
    }

    if ( i % 5 === 0 ) {
      message += 'Fuzz';
    }

    console.log( message || i);
  }
}

fizzBuzz();
