
function incrementProperty(obj, property){
  if (obj[property]){
    obj[property]++;
  } else {
    obj[property] = 1;
  }
  return obj[property];
}

function print(message){
  console.log(message);
}
var result;

var wins = {
  steve: 3,
  susie: 4,
};

result = incrementProperty(wins, 'susie');   // 5
print(result);
result = wins;                               // { steve: 3, susie: 5 }
print(result);
result = incrementProperty(wins, 'lucy');    // 1
print(result);
result = wins;                               // { steve: 3, susie: 5, lucy: 1 }
print(result);
