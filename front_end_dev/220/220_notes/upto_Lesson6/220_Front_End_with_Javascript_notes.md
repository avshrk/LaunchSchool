# Front End Development with JavaScript

## Objects
- JavaScript contains Methods and Properties.
- Methods: Functions with receiver
- Function: without receiver

```Javascript
  greeter.morning();  // Method Invocation

  functionGreeter = greeter.morning;

  functionGreeter(); // function invocation

  evening(); // Function Invocation
```

### `this` during Method Invocation

- Value of `this` is a reference to the Object itself.
- Object methods are properties with function values
- Object Methods can be defined when you create object.
- Object Methods can be added afterwards.

    ```javascript
   var car = {
      fuel: 7.8,
      running: false,
      start: function() {
        this.running = true;
      }
   }; // adding at object creation

   car.stop = function () {
      this.running = false;
   }; // adding after object creation

    ```
### Object Methods
```javascript
    var people = {
      collection: [me, mother, father],
      fullName: function(person){
        console.log(person.first_name + '  ' + person.last_name);
      },
      rollCall: function(){
        this.collection.forEach(this.fullName);
      },
      add: function(person){
        if (this.isInvalidPerson(person)) return;

        this.collection.push(person);
      },
      getIndex: function(person){
        return this.collection.findIndex(function(element,index){
          return element.first_name === person.first_name &&
            element.last_name === person.last_name;
        });
      },
      remove: function(person){
        if (this.isInvalidPerson(person)) return;

        var index = this.getIndex(person);
        if ( index === -1 ) return ;

        this.collection.splice(index,1);
      },
      isInvalidPerson: function(person){
        return (typeof person.first_name !== 'string' ||
          typeof person.last_name !== 'string');
      },
      get: function(person){
        if (this.isInvalidPerson(person)) return;

        return this.collection[this.getIndex(person)];
      },
      update: function(person){
        var index = this.getIndex(person);

        if (index === -1 ){
          this.add(person);
        } else {
          this.collection[index] = person;
        }
      }
    };

```

### Practice Problems
```javascript

var invoices = {
  unpaid: [],
  paid: [],
  add: function(name, amount){
    this.unpaid.push({
      name: name,
      amount: amount
    });
  },
  totalDue: function(){
    return this.getTotal(this.unpaid);
  },
  totalPaid: function(){
    return this.getTotal(this.paid);
  },
  getTotal: function(collection){
    return collection.reduce(function(total,invoice){
      return total + invoice.amount;
    },0);
  },
  payInvoice: function(name){
    var temp_unpaid = [];
    this.unpaid.forEach(function(invoice){
      if (invoice.name === name){
        this.paid.push(invoice);
      } else {
        temp_unpaid.push(invoice);
      }
    },this);
    this.unpaid = temp_unpaid;
  },
};
```
### Mutating Objects

- Primitive types are immutable
- Objects are mutable
- Primitive types copied by value
- Object/reference types copied by reference.
- primitive values: number, string, boolean, null, undefined, symbol
- primitive types are stored on stack ( fast, limited in space )
- reference types values ( objects and arrays )  are stored on the heap: takes longer, hold more information.
- reference to heap stored in stack-
- when object created reference stored in stack, data stored in heap
- pointer/reference gets copied-
- `.slice()` method by itself, creates and returns a new array

### Functions as Object Factories



