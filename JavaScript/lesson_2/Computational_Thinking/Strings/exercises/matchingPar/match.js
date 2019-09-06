
function isBalanced(text){
  var open = 0;
  var close = 0;
  for (var i = 0; i < text.length; i++) {
    if (text[i] === '(') open += 1 ;
    if (text[i] === ')') close += 1;
    if (close > open) return false;
  }
 return open === close;
}




var r;

r = isBalanced('What (is) this?');        // true
console.log(r);
r = isBalanced('What is) this?');         // false
console.log(r);
r = isBalanced('What (is this?');         // false
console.log(r);
r = isBalanced('((What) (is this))?');    // true
console.log(r);
r = isBalanced('((What)) (is this))?');   // false
console.log(r);
r = isBalanced('Hey!');                   // true
console.log(r);
r = isBalanced(')Hey!(');                 // false
console.log(r);
r = isBalanced('What ((is))) up(');       // false
console.log(r);
