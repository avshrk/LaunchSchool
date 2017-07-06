# Notes
## Objects and Methods
Methods have receiver, functions don't. (Invocation - calling)

### Function and Method Invocation

`this` is a reference to the object itself. Function use it to access/change objects properties.
Object Methods are properties with function value. You can define methods: when you create objects, add them anytime later.

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
Passing arguments with call and apply:
foo.call(contextObject, arguments required by foo funtion)
call : pass arguments after context
apply: pass arguments as an array
