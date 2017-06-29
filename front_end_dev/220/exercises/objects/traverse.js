var words = [];

function walk(node, callback){
  callback(node);
  for(var i = 0; i < node.childNodes.length; i++){
    walk(node.childNodes[i], callback);
  }
}

// walk(document, function(node){
//   if (node.nodeName === "P") {
//     // words.push(node.textContent.trim().split(' ')[0]);
//     words.push(node.firstChild.data.trim().split(' ')[0]);
//   }
// });

// console.log(words);

var first = true ;

walk(document, function(node){
  if (node.nodeName === "P") {
    if (first){
      first = false;
    } else {
      node.classList.add('stanza');
    }
  }
});
