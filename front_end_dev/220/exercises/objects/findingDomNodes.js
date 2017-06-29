Array.from(document.getElementsByClassName('intro')).forEach(function(element){
  Array.from(element.getElementsByTagName('P')).forEach(function(pElement){
    pElement.classList.add('article-text');
  });
});


// Array.from(document.getElementsByTagName('P')).forEach(function(element){
//   element.classList.add('article-text');
// });

// function getElementsByName(name){
//   var matches = [];

//   traverse(document.body, function(node){
//     if (node.tagName === name ) matches.push(node);
//   });
//   return matches;
// }

// function traverse(node, callback){
//   callback(node);
//   for(var i = 0; i < node.childNodes.length; i++){
//     traverse(node.childNodes[i], callback);
//   }
// }

// getElementsByName('P').forEach(function(element){
//   element.classList.add('article-text');
// });



// function findAllPs() {
//   var nodes = document.body.childNodes;
//   var paragElements = [];

//   for (var i = 0; i < nodes.length; i++){
//     if (nodes[i] instanceof HTMLParagraphElement) {
//       paragElements.push(nodes[i]);
//     }
//   }
//   return paragElements;
// }


// console.log(findAllPs());
