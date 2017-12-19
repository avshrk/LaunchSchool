# 220 Front End Development with JavaScript
## Objects
* Methods and Properties
* Methods are functions with a receiver.
```javascript

        var greeter = {
          morning: function() {
            console.log('Good morning!');
          }
        };

        greeter.morning(); // invoke as method
        functionGreeter = greeter.morning; // copies function definition
        functionGreeter(); // invoke as function

```

* Value of `this`  is a reference to the object itself.

```JavaScript
        var counter = {
          count: 0,
          advance: function() {
            this.count += 1;
          }
        };

        counter;                // { count: 0, advance: [Function] }

        counter.advance();
        counter;                // { count: 1, advance: [Function] }

        counter.advance();
        counter.advance();

        counter;                // { count: 3, advance: [Function] }
```
* Object methods are properties with function value.
```JavaScript
        // adding a method
        counter.reduce = function(amount) {
          this.count -= amount;
        }
        counter.reduce();

        // adding a property
        counter.stop = true;

```
### Object Methods
```JavaScript
var me = {
  first_name: 'Joe',
  last_name: 'Doe'
}

```
