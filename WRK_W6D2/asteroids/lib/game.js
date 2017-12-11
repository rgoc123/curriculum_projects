const Asteroid = require('./asteroid.js');

function Game(){
  const DIM_X = 500;
  const DIM_Y = 500;
  const NUM_ASTEROIDS = 18;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function(){
  for (var i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: this.randomPosition()}));
  }
  return true;
};

Game.prototype.randomPosition = function(){
  return [this.DIM_X * Math.random(), this.DIM_Y * Math.random()];
};

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
  return true;
};

Game.prototype.draw = function(ctx){
  ctx.clearRect(0,0,500,500);
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw();
  }
  return true;
};

module.exports = Game;