function MovingObject(options){
  this.x = options.pos[0];
  this.y = options.pos[1];
  this.color = options.color;
  this.dx = options.vel[0];
  this.dy = options.vel[1];
  this.radius = options.radius;
}

MovingObject.prototype.draw = function(ctx){
  ctx.arc(this.x,this.y,this.radius,0,Math.PI);
  ctx.fillStyle = "gray";
};

MovingObject.prototype.move = function () {
  this.x += this.dx;
  this.y += this.dy;
};


module.exports = MovingObject;

