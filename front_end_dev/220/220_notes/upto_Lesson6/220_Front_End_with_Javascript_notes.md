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
