function later(func,args){
  return function(){
    func(args);
  };
}

var logwarning = later(console.log, 'the system is shutting down!');
logwarning();
