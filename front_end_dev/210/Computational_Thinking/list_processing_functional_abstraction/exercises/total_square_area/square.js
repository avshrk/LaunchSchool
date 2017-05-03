var rectangles = [[3, 4], [6, 6], [1, 8], [9, 9], [2, 2]];

//firs calculate each area of rectangle: map
//add all areas: reduce

function calculateArea(rectangle) {
  return rectangle[0] * rectangle[1];
}
function addAllArea(accum, current, index, arr){
  return accum + current ;
}

function totalArea(rectangles){
  var areaAllRectangle = rectangles.map(calculateArea);
  return areaAllRectangle.reduce(addAllArea);
}
function isSquare(rectangle){
   return rectangle[0] === rectangle[1];
}

function totalSquareArea(rectangles){
  return totalArea(rectangles.filter(isSquare));
}

console.log(totalArea(rectangles)); // 141
console.log(totalSquareArea(rectangles)); //121
