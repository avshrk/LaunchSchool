function myMap(array, func) {
  var result = [];
  for (var i = 0, len = array.length; i < len; i++) {
     result.push(func(array[i])) ;
  }
  return result;
}

// var plusOne = function(n) { return n + 1; };

// console.log(myMap([1, 2, 3, 4], plusOne));       // [2, 3, 4, 5]


var getTitle = function(book) {
  return book.title;
};

// function getBooksTitle(books) {
//   return myMap(books,getTitle);
// }
//inline style
function getBooksTitle(books) {
  return myMap(books,function(book){
    return book.title;
  });
}

var books = [
  {
    title: 'JavaScript and JQuery: Interactive Front-End Web Development',
    author: 'Jon Ducket',
    edition: '1st',
  },
  {
    title: 'Eloquent JavaScript: A Modern Introduction to Programming',
    author: 'Haverbeke',
    edition: '2nd',
  },
  {
    title: 'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics',
    author: 'Jennifer Niederst Robbins',
    edition: '4th',
  },
];


console.log(getBooksTitle(books));
// console output
// [
//   'JavaScript and JQuery: Interactive Front-End Web Development',
//   'Eloquent JavaScript: A Modern Introduction to Programming',
//   'Learning Web Design: A Beginner\'s Guide to HTML, CSS, JavaScript, and Web Graphics'
// ]
