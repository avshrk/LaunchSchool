var me =  {
  first_name: 'John',
  last_name: 'doe'
};

var friend =  {
  first_name: 'Micheal',
  last_name: 'Smith'
};

var mother =  {
  first_name: 'sue',
  last_name: 'Smith'
};

var father =  {
  first_name: 'dave',
  last_name: 'Smith'
};


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

function fullName(person) {
  console.log(person.first_name + ' ' + person.last_name);
}

function rollCall(people){
  people.forEach(fullName);
}

people.rollCall();
people.add(friend);
console.log('   ');
people.rollCall();
console.log(people.getIndex(friend));
people.remove(friend);
console.log(people.getIndex(friend));
people.rollCall();
console.log(people.isInvalidPerson(friend));

console.log(people.get(father));

