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
fullname: function (person){
console.log(person.firstName + ' ' + person.lastName);
},
rollCall: function(){
this.collection.forEach(this.fullname);
}
}

```

