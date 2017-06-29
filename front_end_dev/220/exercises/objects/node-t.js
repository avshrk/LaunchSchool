
var p1 = {
  first: 'foo1',
  last: 'bar1',
};

var p2 = {
  first: 'foo2',
  last: 'bar2',
};

var p3 = {
  first: 'foo3',
  last: 'bar3',
};


people = {
  collection: [p1, p2, p3],
  fullName: function(person) {
    console.log(person.first + '   ' + person.last);
  },
  rollCall: function() {
    this.collection.forEach(this.fullName);
  },
};

people.isInvalidPerson = function (person){
  return !(typeof person.first === 'string' && typeof person.last === 'string');
};

people.add = function(person) {
  if (this.isInvalidPerson(person)) return ;

  this.collection.push(person);
};

people.get = function(person) {
  if (this.isInvalidPerson(person)) return ;
  return this.collection[this.getIndex(person)];
};


people.update = function(person) {
  var personIndex = this.getIndex(person);

  if (this.isInvalidPerson(person)) return;

  if ( personIndex  === -1 ){
    this.add(person);
  } else {
    this.collection[personIndex] = person;
  }
};


people.getIndex = function(person) {
  var index = -1;
  this.collection.forEach(function(compare, i) {
    if (compare.first === person.first &&
      compare.last === person.last)
    {
      index = i;
    }
  });
  return index;
};

people.remove = function(person){
  if (this.isInvalidPerson(person)) return;

  var index = this.getIndex(person);

  if (index === -1) return;

  this.collection.splice(index, 1);

};

p9 = {
  first: 'foo9',
  last: 'bar9',
};


console.log(people.add(p9));
console.log(people.get(p9));
p9 = {
  first: 'ff9',
  last: 'bb9',
};

people.update(p9);
console.log(people.get(p9));


i = 1;
var a = 2;
console.log(window.i);
console.log(window.a);
console.log(delete window.a);
console.log(delete window.i);
