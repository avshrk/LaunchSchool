var makeCountry = function(name, continent){
  return {
    name: name,
    continent: continent,
    getDescription: function(){
      return this.name + ' is located in ' + this.continent +'.';
    },
  };
};
