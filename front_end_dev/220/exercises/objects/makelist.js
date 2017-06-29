function makeList() {
  var items = [];

  return {
    add: function(newItem){
      items.push(newItem);
      console.log(newItem + " added!");
    },
    remove: function(item){
      items.splice(items.indexOf(item),1);
      console.log(item + " removed!");
    },
    list: function(){
      if (items.length > 0 ) {
        items.forEach(function(item) {
          console.log(item);
        });
      } else {
        console.log("The list is empty.");
      }
    }
  };
}

var veg = makeList();
veg.add('peas');
veg.list();
veg.add('corn');
veg.list();
console.log(veg.items);
veg.remove('corn');
veg.list();
veg.remove('peas');
veg.list();

