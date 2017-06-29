function makeMultipleLister(num) {
  return function (){
    var i;
    for (i = num; i < 100 ; i += num) {
      console.log(i);
    }
  };
}

var lister = makeMultipleLister(13);
lister();
