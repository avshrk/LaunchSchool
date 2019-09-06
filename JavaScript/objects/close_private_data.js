function makeCounterLogger(from) {
  'use strict';
  return function(to) {
    var i ;
    if (to > from){
      for(i = from; i <= to ; i++){
        console.log(i);
      }
    } else {
      for(k = from; k >= to; k--){
        console.log(k);
      }
    }
  };
}

var countLog = makeCounterLogger(5);
countLog(8);
countLog(2);
