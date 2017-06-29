var keys = ["Kingdom", "Phylum", "Clade", "Class", "Order", "Suborder", "Family",
            "Genus", "Species"];

var classification = {};

var tds = document.querySelectorAll(".infobox td");

for (var i = 0; i < tds.length; i++) {
  var cell = tds[i];

  keys.forEach(function(key) {
    if (cell.textContent.indexOf(key) !== -1) {
      var link = cell.nextElementSibling.firstElementChild;
      classification[key] = link.textContent;
    }
  });
}

console.log(classification);

// var keys = ["Kingdom:", "Phylum:", "Clade:", "Class:", "Order:", "Suborder:", "Family:", "Genus:", "Species:"];

// var tdlist = Array.prototype.slice.call(document.querySelectorAll('.infobox td'));
// var grouping = {};

// tdlist.forEach(function(element){
//   if (keys.indexOf(element.textContent) > -1){
//     grouping[element.textContent] = element.nextElementSibling.textContent;
//   }
// });

// console.log(grouping);


// var captions = document.querySelectorAll('.thumbcaption');
// var captionArray = Array.prototype.slice.call(captions).map(function(element){
//  return element.textContent.trim();
// });
// console.log(captionArray);

// var contentLinks = document.querySelectorAll('.toc a');
// Array.prototype.slice.call(contentLinks).forEach(function(element,index){
//   if (index % 2 === 0 ){
//     element.style.color = 'green';
//   }
// });

// var h2List = document.querySelectorAll('h2');
// var h2Array = Array.prototype.slice.call(h2List);

// var wordCount = h2Array.map(function(element){
// return element.textContent.split(' ').length;
// });

// console.log(wordCount);

// var h2 = Array.from(document.querySelectorAll('h2'));
// var wordCount = h2.map(function(element){
// return element.textContent.split(' ').length;
// });

// console.log(wordCount);


// function walk(node, callback){
//   callback(node);
//   for (var i = 0; i < node.childNodes.length; i++){
//     walk(node.childNodes[i], callback);
//   }
// }
// walk(document, function(node){
//   if(node.tagName === 'A'){
//     node.style.color = 'red';
//   }
// });

// var images = [];

// walk(document, function(node){
//   if (node.tagName === 'IMG'){
//     images.push(node);
//   }
// });

// var pngs = images.filter(function(img){
//   return img.getAttribute('src').toLowerCase().match(/\.png$/);
// });

