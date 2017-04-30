
function objectHasProperty(obj, property){
  if (Object.keys(obj).indexOf(property) > -1 ){
    return true;
  }
  return false;
}

function print(message){
  console.log(message);
}

var pets = {
  cat: 'Simon',
  dog: 'Dwarf',
  mice: null,
};

var result = objectHasProperty(pets, 'dog');       // true
print(result);
result = objectHasProperty(pets, 'lizard');    // false
print(result);
result = objectHasProperty(pets, 'mice');      // true
print(result);
