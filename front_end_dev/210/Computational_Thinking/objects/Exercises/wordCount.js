function wordCount(text){
  var wordList = text.split(' ');
  var result =  {};
  for (var i = 0, len = wordList.length; i < len; i++) {
    if (!result[wordList[i]] ) {
      result[wordList[i]] = repeatCount(wordList,wordList[i]);
    }
  }
  return result;
}

function repeatCount(arr,value){
  var count = 0 ;
  for (var i = 0, len = arr.length; i < len; i++) {
    if (arr[i] === value) count++;
  }
  return count;
}

function print(message){
  console.log(message);
}

var result ;
result = wordCount('box car cat bag box');    // { box: 2, car: 1, cat: 1, bag: 1 }
print(result);
