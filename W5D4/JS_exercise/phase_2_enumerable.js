// Array#uniq

Array.prototype.myEach = function(callback){
  for (var i = 0; i < this.length; i++) {
    callback(this[i]);
  }
};

Array.prototype.myMap = function(callback){
  let arr = []; 
  this.myEach(function(el) {
    arr.push(callback(el));
  }); 
  return arr;
};


//Array#myReduce
Array.prototype.myReduce = function(callback, acc){
  let arr = this;
  if (acc === undefined ) {
    acc = this[0];
    arr = this.slice(1);
  } 
  arr.myEach(function(el){
    acc = callback(acc,el);
  });
  return acc; 
};
