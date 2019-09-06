var bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

function processBands(data) {
  return data.map(function(obj){
    return {
      name: removePeriod(obj.name).split(' ').map(capitalize).join(' '),
      country: 'Canada',
      active: obj.active,
    };
  });
}

function removePeriod(word){
  return word.replace('.','');
}

function capitalize(word){
  return word.charAt(0).toUpperCase() + word.slice(1);
}

console.log(processBands(bands));
console.log(bands);
// should return:

// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]
