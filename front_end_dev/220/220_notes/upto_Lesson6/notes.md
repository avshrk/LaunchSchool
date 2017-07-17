# Notes
## Objects and Methods
 Methods -> explicit receiver

 Function -> no explicit receiver

### Function and Method Invocation

- `this` : reference to the object itself. Function use it to access/change objects properties.
- Object Methods are properties with function value.
- You can define methods: when you create objects, add them anytime later.

### Object Methods

```javascript
  var people = {
    collection: [],
    fullName: function (person){
      console.log(person.firstName + ' ' + person.lastName);
    },
    rollCall: function(){
      this.collection.forEach(this.fullName);
    },
    add: function(){
      if (this.isInvalidPerson){
        return;
      }
      this.collection.push(person);
    },
    get: function(person){
      if (this.isInvalidPerson){
        return;
      }
     return this.collection[this.getIndex(person)];
    },
    update: function(person){
      if (this.isInvalidPerson){
        return;
      }
      var index = this.getIndex(person);
      if (index === -1){
        this.add(person);
      } else {
        this.collection[index] = person;
      }
    },
    getIndex: function(person){
      var index = -1;
      this.collection.forEach(function(compare, i){
        if (compare.firstName === person.firstName &&
           compare.LasteName === person.lastName){
             index = i;
           }
        return index;
      });
    },
    remove: function(person){
      if (this.isInvalidPerson){
        return;
      }

      var index = this.getIndex(person);

      if (index === -1 ){
        return;
      } else {
        this.collection.splice(index,1);
      }
    },
    isInvalidPerson: function(person){
      return typeof person.firstName !== 'string' || typeof person.lastName !== 'string';
    },

  }
```

```javascript

var invoices = {
  unpaid: [],
  paid: [],
  add: function(name, amount){
    this.unpaid.push({name: name, amount: amount});
  },
  totalAmount: function(collection){
    return collection.reduce(function(total,invoice){
      return total + invoice.amount;
    },0);
  },
  totalDue: function(){
    return this.totalAmount(this.unpaid);
  },
  totalPaid: function(){
    return this.totalAmount(this.paid);
  },
  payInvoice: function(name){
    var tempUnpaid = [];
    this.unpaid.forEach(function(invoice){
      if (name === invoice.name){
        this.paid.push(invoice);
      } else {
        tempUnpaid.push(invoice);
      }
    }, this);

    this.unpaid = tempUnpaid;
  },
};

```

### Mutating Objects
Primitive types are immutable. Objects are mutable. Function can alter the content of Objects passed in as arguments. It does so by reassigning a property. Variables holds references to values.

### Functions as Object Factories
Object collects related data and behavior.


Object Factory:
```javascript

  function makeCar(speedRate, breakRate) {
    return {
      speed: 0,
      breakRate: breakRate,
      speedRate: speedRate,
      accelerate: function(){
        return this.speed += this.speedRate;
      },
      break: function(){
        this.speed -= this.breakRate;
        if (this.speed < 0 ){
          this.speed = 0;
        }
      }
    };
  }

var hatcback = makeCar(9,6);
```

### Object Orientation
Object oriented programming is a pattern that uses objects as the basic building blocks, instead of variables and functions. Grouping related data together. The object oriented approach puts data and procedures into containers as objects. Smart objects that can perform action on the data they own. Complexity stays inside of an object, not exposed globally. Changes do not ripple through entire project.Duplication reduction is not the goal, side-effect. Makes code easier to understand, and maintain. Objects contain data/state or methods/behavior.

- Organize related data and code together
- useful when more than one instance required
- more useful as code base gets larger

## Function Context and Objects
Javascript has first class functions: add them to objects, execute them within objects context, remove them from objects, pass them to other functions, run them entirely different context. They have initially have no context, they receive when program executes. Javascript let developer control execution context.

### Global Object

Javascript global object, implicit execution context, window:browser, global:node.
Global values: isNaN, window.Infinity

### Global Variables and Function Declarations
Global variables and functions are added to global object as properties.
You can not delete variables that you defined, but you can delete the ones that you did not define.

```javascript
  var foo = 3;
  window.foo; // 3

  function bar() {
    return 1;
  }
  window.bar(); // 1

  moreFoo = 2 ;
  window.moreFoo; //2
  delete window.foo ; // false
  delete window.moreFoo; //true
```
## Implicit and Explicit Function Execution Context
### Implicit Function Execution Context
Implicit function execution concept: implicit binding; invoke without supplying an explicit context; binds to global object. Within function 'this' refers to window object.
Function binds to context when invoked/execute not when defined.
Function is executed when () placed, returns code without it.

```javascript
  var obj = {
   foo: function (){
    return 'this here is ' + this;
   },
  }

  obj.foo(); // this here is obj
  var bar = obj.foo;
  bar(); // this here is window

```

### Explicit Function Execution Context
`call` and `apply` methods to change execution context. Explicitly bind a function's execution context to an object.
```javascript
  var a = 'global object';

  function foo () {
    return this.a;
  }

  var bar = {
    a: 'bar object',
  }

  foo(); // global object
  foo.call(bar); // bar object

```

Borrowing a method from an object:
```javascript
  var greeting = {
   a: 'hello',
   b: 'world',
   foo: function() {
     return this.a + '  ' + this.b;
   }
  };

  var numbers = {
    a: 1,
    b: 2,
  };

  greeting.foo.call(numbers); // 1 2

```
#### Passing arguments with call and apply:
foo.call(contextObject, arguments required by foo funtion)

Call and apply executes the function.

call : pass arguments after context, separated by commas

apply: pass arguments as an array

## Hard Binding - Permanently
`bind` method, binding object to a function.

It returns a new function and permanently binds to an object (does not execute).

### Changing Function Context

```Javascript
  var num_list = [1,2,3,4,5];

  function total() {
    var total ;
    for(var i = 0; i < this.length ; i++){
      total += this[i];
    }
    return total;
  }

  var num_total = total.bind(num_list);
  num_total(); // outputs total of array

```
## Dealing with Context loss
### Method loosing Context when taken out of Object

When you remove method from its containing object and execute it.
```Javascript
  function repeatThreeTimes(func){
    func();
    func();
    func();
  }
  function foo() {
    var john = {
      name: 'john',
      greet: function (){
        console.log(this.name);
      },
    };

    repeatThreeTimes(john.greet); // strips context
  }

  foo();
```
Solution:

Pass in desired context.
```Javascript
  function repeatThreeTimes(func,context){
    func.call(context);
    func.call(context);
    func.call(context);
  }
  function foo() {
    var john = {
      name: 'john',
      greet: function (){
        console.log(this.name);
      },
    };

    repeatThreeTimes(john.greet, john); // pass context
  }

  foo();
```
Hard binding with bind.( when you can not update function or supply context )

```Javascript
  function repeatThreeTimes(func){
    func();
    func();
    func();
  }
  function foo() {
    var john = {
      name: 'john',
      greet: function (){
        console.log(this.name);
      },
    };

    repeatThreeTimes(john.greet.bind(john)); // bind permanently
  }

  foo();

  ```
### Internal Function Loosing Method Context
When function is not provided explicit context, it binds to global object, even when executed within another object.

```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      function bar() {
        console.log(this.a + ' ' + this.b);
      }
      bar();
    }
  };

  obj.foo(); // undefined unedfined
```

solution:

Preserve context with a local variable in the lexical scope
```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      var self = this;
      function bar() {
        console.log(self.a + ' ' + self.b);
      }
      bar();
    }
  };

  obj.foo(); // hello word
```
Pass the context to internal functions.
```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      function bar() {
        console.log(this.a + ' ' + this.b);
      }

      bar.call(this);
    }
  };

  obj.foo(); // hello word



```
Bind the context with function expression. Bind once and use it many times.

```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      var bar = function () {
        console.log(this.a + ' ' + this.b);
      }.bind(this);

      bar();
    }
  };

  obj.foo(); // hello word

```

### Function as Argument Losing Surrounding Context

```javascript

  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      [1, 2, 3].forEach(function(number) {
        console.log(String(number) + ' ' + this.a + ' ' + this.b);
      });
    }
  };

  obj.foo(); // undefined undefined

```
Using local variable in lexical scope:

```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      var self = this;
      [1, 2, 3].forEach(function(number) {
        console.log(String(number) + ' ' + self.a + ' ' + self.b);
      });
    }
  };

  obj.foo(); // hello world
```
Hand Binding

```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      [1, 2, 3].forEach(function(number) {
        console.log(String(number) + ' ' + this.a + ' ' + this.b);
      }.bind(this));
    }
  };

  obj.foo(); // hello world
```
Use optional thisArg  argument
```javascript
  obj = {
    a: 'hello',
    b: 'world',
    foo: function() {
      [1, 2, 3].forEach(function(number) {
        console.log(String(number) + ' ' + this.a + ' ' + this.b);
      },this);
    }
  };

  obj.foo(); // hello world
```

Summary of this:

`this` current execution context of a function.

4 function invocation types:
- function : foo();
- method: obj.foo();
- consrutor: new foo();
- indirect: foo.call()


IIFE (immediately invoked function expression)
```javascript
var message = (function(name){ return 'hello ' + name; })('World');
```
`this` is a global object in a function invocation, undefined in strict mode

Function call sets the execution context.

# Closures and Functions Review

Function expression syntax of creating functions are good for passing/returning function.

Function Lexical Rules:
- it can access it's local variables.
- it can access any variable within its scope when it was defined.

## Higher Order Functions
- A function that Accepts or returns a function.

```javascript
  // function passed as an argument
  [1, 2, 3, 4].forEach(function(number) {
    console.log(number);
  });
```

```javascript
  // function as return value
  function helloFactory() {
    return function() {
      console.log("hi");
    }
  }

  helloFactory(); //returns a function definition
  helloFactory()();  //immediate function invocation
  var hello = helloFactory(); //storing function in a variable
  hello();  // invoking it later
```

```javascript
  function timed(func) {
    return function() {
      var start = new Date();
      func();
      var stop = new Date();
      console.log((stop - start).toString() + " ms have elapsed");
    }
  }

  var timeHi = timed(function(){console.log('hi');});
  timeHi();

  var timeSomeFunc = timed(someFuncName);
  timeSomeFunc();

  timed(someOtherFunc)(); // Immediate invocation of returned function
```

## Closures and Private Data

- Functions close over or enclose context at their definition point.
- They always have access to that context.

```javascript
  function makeCounter() {
    var count = 0;       // declare a new variable
    return function() {
      count += 1;        // references count from the outer scope
      console.log(count);
    }
  }
```
- Partial application: Original function has some of its arguments defined.
    ```javascript
  function later(func, argument) {
    return function() {
     func(argument);
    }
  }

    ```

## Objects and Closures
- Use closures to make data private.
- To manipulate private data we need to have an access to original function definition.
```javascript
  var makeBank = function() {
    var accounts = [];

    function makeAccount(number) {
      var balance = 0;
      var transactions = [];

      return {
        deposit: function(amount) {
          transactions.push({type: "deposit", amount: amount});
          balance += amount;
          return amount;
        },
        withdraw: function(amount) {
          if (amount > balance) {
            amount = balance;
          }
          transactions.push({type: "withdraw", amount: amount});
          balance -= amount;
          return amount;
        },
        balance: function() {
          return balance;
        },
        number: function() {
          return number;
        },
        transactions: function() {
          return transactions;
        }
      };
    }

    return {
      openAccount: function() {
        var nextId = accounts.length + 101;
        var account = makeAccount(nextId);
        accounts.push(account);
        return account;
      },
      transfer: function(source, destination, amount) {
        return destination.deposit(source.withdraw(amount));
      }
    };
  }

   var bank = makeBank();
   var account = bank.openAccount();

   account.balance()
   account.deposit(17);

   var secondAccount = bank.openAccount();
   secondAccount.number();
```
## Garbage Collection
- Memory is claimed when there is no more references to that specific object.

## How Closures Effect Garbage Collection
- JS can not garbage collect any objects or values referenced by closure.

## Partial Function Application

```javascript
  function makeAddN(func, arg1) {
    return function(arg2) {
      return func(arg1, arg2);
    }
  }

  function add(first, second){
    return first + second ;
  }

  var add1 = makeAddN(add, 1);
  add1(1);                           // => 2
  add1(41);                          // => 42

  var add9 = makeAddN(add,9);
  add9(1);  // 10
  add9(11); //20
```

