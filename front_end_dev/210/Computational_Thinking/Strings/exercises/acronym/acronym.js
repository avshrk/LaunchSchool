function acronym(string) {
  return string.split(/[ -]/).map(function(word){
    return word[0].toUpperCase();
  }).join('');
}

var r ;
console.log(r);
r = acronym('Portable Network Graphics');                 // "PNG"
console.log(r);
r = acronym('First In, First Out');                       // "FIFO"
console.log(r);
r = acronym('PHP: HyperText Preprocessor');               // "PHP"
console.log(r);
r = acronym('Complementary metal-oxide semiconductor');   // "CMOS"
console.log(r);
r = acronym('Hyper-text Markup Language');                // "HTML"
console.log(r);
