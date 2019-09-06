function radiantsToDegrees(radiant){
  return (180 / Math.PI) * radiant ;
  // return radiant / (Math.PI / 180);
}

function print(message){
  console.log(message);
}

var result ;
result = radiantsToDegrees(2);
print(result);
