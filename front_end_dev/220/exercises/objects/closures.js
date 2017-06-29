

function sayHi(name){
  console.log('Hi, ' + name +'!');
}

function sayHello(name){
  console.log('Hello, ' + name +'!');
}


function greet(func,name){
  return function (name) {
    return func(name);
  };
}


greet(sayHi, 'Joe');
greet(sayHello, 'Joe');

