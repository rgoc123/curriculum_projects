// sum using keyword arguments
function sum(){
  let sum = 0;
  const nums = Array.from(arguments);
  nums.forEach( (el) => {
    sum += el;
  });
  return sum;
}


//sum using reduce and rest
function sum3(...nums){
  return nums.reduce((x,y) => x + y);
}
//my bind with a constant and keyword arguments
Function.prototype.myBind = function(ctx){
  const bindArgs = Array.from(arguments).slice(1);
  const oldFunction = this;

  return function(){
    return oldFunction.apply(ctx, bindArgs.concat(Array.from(arguments)));
  };
};

//my bind with rest operator and fat arrow
Function.prototype.myBind2 = function(ctx, ...bindArgs){
  
  return (...callArgs) => {
    return this.apply(ctx, bindArgs.concat(callArgs));
  };
  
};

class Cat {
  constructor(name) {
    this.name = name;
  }
  
  says(sound, person) {
    console.log(`${this.name} says ${sound} to ${person}!`);
    return true;
  }
}

const markov = new Cat("Markov");
const breakfast = new Cat("Breakfast");
markov.says.myBind2(breakfast, "meow")("Markov");

const notMarkovSays = markov.says.myBind2(breakfast);
notMarkovSays("meow", "me");

// sum using currying
function curriedSum(numArgs){
  const curryArr = [];
  
  return function currySum(number) {
    curryArr.push(number);
    if (curryArr.length === numArgs) {
      return curryArr.reduce( (a, b) => a + b);
    } else {
      return currySum;
    }
  };
}

const test = curriedSum(3);
test(1)(2)(3);

//sum using rest operator
function sum2(...nums){
  // console.log(this);
  let sum = 0;
  nums.forEach( (el) => {
    sum += el;
  });
  return sum;
}

Function.prototype.curry = function(numArgs){
  const curryArgs = [];
  // const oldFunction = this;
  
  const curryFunc = (arg) => {
    curryArgs.push(arg);
    if (curryArgs.length === numArgs) {
      // return oldFunction.apply(null, curryArgs);
      return this(...curryArgs);
    } else {
      return curryFunc;
    }
  };
  return curryFunc;
};


const testCurry = sum2.curry(3);
console.log(testCurry(1)(2)(3));

