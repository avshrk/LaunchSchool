var newReleases = [
  {
    'id': 70111470,
    'title': 'Die Hard',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/DieHard.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 654356453,
    'boxart': 'http://cdn-0.nflximg.com/images/2891/BadBoys.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
  {
    'title': 'The Chamber',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/TheChamber.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [4.0],
    'bookmark': [],
  },
  {
    'id': 675465,
    'title': 'Fracture',
    'boxart': 'http://cdn-0.nflximg.com/images/2891/Fracture.jpg',
    'uri': 'http://api.netflix.com/catalog/titles/movies/70111470',
    'rating': [5.0],
    'bookmark': [{ id:432534, time:65876586 }],
  },
];

//Keep only releases that have both id and title data present.
//Keep only the id and title data for each release.
//
//Input Array of objects
//Iterate and filter the ones that have both title and id
//Create new Array of objects with only Id and title

function propertyExist(obj, property){
  return Object.keys(obj).includes(property);
}

function objWithIdTitle(obj){
  var newObj = {};
  newObj.id = obj.id;
  newObj.title = obj.title;
  return newObj;
}

function processReleaseData(data) {
  var relWithIdTitle = data.filter(function(obj){ return propertyExist(obj, 'id') && propertyExist(obj, 'title'); });
  return relWithIdTitle.map(objWithIdTitle);
}
var result = processReleaseData(newReleases);
// console.log(processReleaseData(newReleases));
console.log(result);
// should return:
//[{ id: 70111470, title: 'Die Hard'}, { id: 675465, title: 'Fracture' }]
