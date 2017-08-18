
var me = {
  first: 'joe',
  last: 'doe'
};

var friend = {
  first: 'bar',
  last: 'boe'
};

var friend2 = {
  first: 'bar2',
  last: 'boe2'
};

var friend1 = {
  first: 'bar1',
  last: 'boe1'
};

var people = {
  list: [],
  fullName: function (person){
    console.log(person.first + ' ' + person.last);
  },
  rollCall: function(){
    this.list.forEach(this.fullName);
  },
  add: function(person){
    this.list.push(person);
  },
  isInvalidPerson: function (person){
    return typeof person.first !== 'string' || typeof person.last !== 'string';
  },
  get: function(person){

    var index = this.getIndex(person);
    if (index < 0) return;

    return this.list[index];

  },
  update: function(person){

    if (this.isInvalidPerson(person)) return;

    var index = this.getIndex(person);

    if (index < 0) {
      this.add(person);
    } else {
      this.list[index] = person;
    }
  },
  getIndex: function(person){
    var index = -1;

    this.list.forEach(function(item,i){
      if (person.last === item.last && person.first === item.first ){
        index = i ;
      }
    });
    return index;
  },
  remove: function(person){

    if (this.isInvalidPerson(person)) return;

    var index = this.getIndex(person);
    if (index < 0) return;

    this.list.splice(index, 1);
  },
};

function pr(text){
  console.log(text);
}
zi = {};
people.add(me);
people.add(friend);
people.add(friend2);
people.add(friend1);
people.rollCall();
people.remove(zi);
pr('removed friend2');
people.rollCall();
pr(people.isInvalidPerson(me));
pr(people.isInvalidPerson(zi));
pr(people.get(me));

/*
var me = {
  first: 'John',
  last:'Doe',
};

var friend = {
  first: 'Jane',
  last: 'Doe',
};

var people = {
  collection: [],
  add: function(person){
    this.collection.push(person);
  },
  fullName: function(person){
   console.log(person.first + '  ' + person.last);
  },
  rollCall: function (){
    this.collection.forEach(this.fullName);
  },
  getIndex: function(person,i){
    var index = -1;
    this.collection.forEach(function(eachPerson, i){
      if (person.fullName === eachPerson.fullName){
        index = i;
      }
    });
   return index;
  },
};

people.add(me);
people.add(friend);
people.rollCall();
var index = people.getIndex(me);
console.log(index);


var me = {
  first: 'John',
  last:'Doe',
};

var friend = {
  first: 'Jane',
  last: 'Doe',
};

var people = [];

people.push(me);
people.push(friend);

function fullName(person) {
  console.log(person.first + '  ' + person.last);
}

function rollCall(people) {
  people.forEach(fullName);
}

rollCall(people);


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
hatcback.accelerate();
hatcback.accelerate();
hatcback.accelerate();
console.log(hatcback.speed);
hatcback.break();
console.log(hatcback.speed);
hatcback.break();
console.log(hatcback.speed);
hatcback.break();
hatcback.break();
hatcback.break();

console.log(hatcback.speed);


*/
