function greetings(name,info) {
  var greeting = 'Hello, ' + name.join(' ') ;
  return greeting + '! Nice to have a ' + info.title + ' ' + info.occupation + ' around.';
}
console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));

// console output
// Hello, John Q Doe! Nice to have a Master Plumber around.
