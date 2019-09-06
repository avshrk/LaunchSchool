function maker(rate,down){
  return {
    speed: 0,
    rate: rate,
    slowDown: down,
    accelerate: function(){
      this.speed += this.rate ;
    },
    break: function(){
      if (this.speed > this.slowDown) {
        this.speed -= this.slowDown;
      }else {
        this.speed = 0;
      }
    }
  };
}

var hatchback = maker(5,4);
console.log(hatchback.speed);
console.log(hatchback.rate);
console.log(hatchback.accelerate());
console.log(hatchback.accelerate());
console.log(hatchback.speed);
hatchback.break();
console.log(hatchback.speed);
hatchback.break();
hatchback.break();
console.log(hatchback.speed);

