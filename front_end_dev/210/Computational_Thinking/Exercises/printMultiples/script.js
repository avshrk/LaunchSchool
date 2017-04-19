function logMultiples(number) {
  for(var i = 100; i > 0 ; i--){
    if ( i % 2 !== 0 && i % number === 0 ){
      console.log(i);
    }
  }
}

logMultiples(17);
logMultiples(21);
