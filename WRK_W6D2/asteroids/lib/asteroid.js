const MovingObject = require('./moving_object.js');
const Util = require('./utils.js');

const COLOR = 'blue';
const RADIUS = 10;

function Asteroid(input){
  const vel = Util.randomVec(Math.random()*3);
  MovingObject.call(this, {vel: vel, pos: input.pos, color: COLOR, radius: RADIUS});
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;