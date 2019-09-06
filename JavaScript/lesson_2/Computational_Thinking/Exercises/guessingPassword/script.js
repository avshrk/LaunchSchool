var password = 'password';
var guess ;
var i = 0;


while ( i < 3 ) {
  ++i;
  guess = prompt("What is the password:");
  if (guess === password) break;
}

if ( guess !== password ) {
  console.log('Access Denied!');
} else {
  console.log('Logged in!');
}





