function dateSuffix(date){
  var lastDigit = date % 10 ;
  switch (lastDigit) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
}
function print(message){
  console.log(message);
}
var result ;

result = dateSuffix(1);
print(result);
result = dateSuffix(2);
print(result);
result = dateSuffix(3);
print(result);
result = dateSuffix(4);
print(result);
