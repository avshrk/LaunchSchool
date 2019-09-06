
function copyProperties(first,second){
  var count = 0;
  for( var property in first){
    second[property] = first[property];
    count++;
  }
  return count;
}
function print(message){
  console.log(message);
}
var result ;
var hal = {
  model: 9000,
  enabled: true,
};
var sal = {};
result = copyProperties(hal, sal);  // 2
print(result);
result = sal;                       // { model: 9000, enabled: true }
print(result);
