function makeCar(speedRate, breakRate) {
  return {
    speed: 0,
    breakRate: breakRate,
    speedRate: speedRate,
    accelerate: function(){
      return this.speed += this.speedRate;
    },
    break: function(){
      this.speed -= this.breakRate;
      if (this.speed < 0 ){
        this.speed = 0;
      }
    }
  };
}

var hatcback = makeCar(9,6);
hatcback.accelerate();
hatcback.accelerate();
hatcback.accelerate();
console.log(hatcback.speed);
hatcback.break();
console.log(hatcback.speed);
hatcback.break();
console.log(hatcback.speed);
hatcback.break();
hatcback.break();
hatcback.break();

console.log(hatcback.speed);
