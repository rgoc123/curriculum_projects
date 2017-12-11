// function Surrogate(){}
//with surrogate
Function.prototype.inherits = function (child, parent) {
  function Surrogate() {}
  Surrogate.prototype = parent.prototype;
  child.prototype = new Surrogate();
};
// Dog.prototype.__proto__ =  Surrogate.prototype;
// function Dog() {
//   Animal.call(this);
// }

//with object.create

Function.prototype.inherits2 = function(child, parent){
  child.prototype = Object.create(parent);
  child.prototype.constructor = child;
};



