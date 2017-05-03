function reverse(string) {
  var reversedString = '';

  for (var i = (string.length - 1); i >= 0; i--) {
    reversedString += string[i];
  }
  return reversedString;
}

var r ;
r = reverse('hello');               // returns "olleh"
console.log(r);
r = reverse('The quick brown fox'); // returns "xof nworb kciuq ehT"
console.log(r);
