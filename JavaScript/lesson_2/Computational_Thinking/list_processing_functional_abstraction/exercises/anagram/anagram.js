//Iterate each element,
//sort and compare each element with given word
//if equal add to array: filter

function anagram(word, list) {
  return list.filter(function(element){
    return element.split('').sort().join('') === word.split('').sort().join('');
  });
}

var r ;

r = anagram('listen', ['enlists', 'google', 'inlets', 'banana']); // [ "inlets" ]
console.log(r);
r = anagram('listen', ['enlist', 'google', 'inlets', 'banana']);  // [ "enlist", "inlets" ]
console.log(r);
