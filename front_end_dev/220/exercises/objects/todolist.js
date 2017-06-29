
function makeList() {
  var list = [];
  return function (todo) {
    if (todo){
      if (list.length > 0) {
        list.forEach(function(element){
          console.log(element);
        });
      } else {
        console.log('The list is empty!');
      }
    } else {
      if (list.includes(todo)) {
        list.splice(list.indexOf(todo),1);
        console.log(todo + ' removed!');
      } else {
        list.push(todo);
        console.log(todo + ' added!');
      }
    }
  };
}

var list = makeList();
list();
list('make breakfast');
list('read book');
list();
list('read book');
list();
