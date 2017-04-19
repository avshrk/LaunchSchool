function splitString(text, delimiter) {
  var subString = '';

  if (delimiter === undefined ) {
    print('Error: No delimiter!');
    return;
  }

  for (var i = 0; i < text.length; i++) {
    if (delimiter === text[i]){
      print(subString);
      subString = '';
    } else if (delimiter === '') {
      subString = text[i];
      print(subString);
    } else {
      subString += text[i];
    }
  }
  print(subString);
}

function print(text) {
  console.log(text);
}
splitString('hello', '');
splitString('hello');
splitString('hello', ';');
splitString('abc,123,hello world', ',');
splitString(';hello;', ';');
