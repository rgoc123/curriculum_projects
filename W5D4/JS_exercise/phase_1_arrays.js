
// Array#uniq 
Array.prototype.uniq = function(arr) {
  let answer = [];
  for (var x = 0; x < arr.length; x++) {
    if(answer.includes(arr[x])){
      continue;
    } else {
      answer.push(arr[x]);
    }
  }
  return answer;
}; 

// Array#twoSum

Array.prototype.twoSum = function(arr) {
  let answer = [];
  for ( var x = 0; x < arr.length -1 ; x++) {
    for ( var y = x+1; y < arr.length; y++) {
      if ( arr[x] + arr[y] === 0 ) {
        answer.push([x,y]);
      }
    }  
  }
  return answer;
};

//Array#transpose
//[[0,1,2],
//[3,4,5],
//[6,7,8]]

//[[0,3,6],
//[1,4,7],
//[2,5,8]]

Array.prototype.transpose = function(arr){
  let answer = [];
  for(var  x = 0; x < arr.length; x++){
    let temp = [];
    for (var y = 0; y < arr.length; y++) {
      temp.push(arr[y][x]);
    }
    answer.push(temp);
  }
  return answer;
};

