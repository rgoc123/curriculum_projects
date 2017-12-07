// Bubble Sort!! 

Array.prototype.bubbleSort = function(arr) {
  let sorted = false;
  while(!sorted){
    let swap = 0;
    let i = 0;
      while(i < arr.length - 1){
        if(arr[i] > arr[i+1]){
          let x = arr[i+1];
          arr[i+1] = arr[i];
          arr[i] = x;
          swap += 1;
        }
      i++;
    }
    i = 0;
    if(swap === 0){
      sorted = true;
    }
  }
  return arr;
};

//String#substring

String.prototype.substring = function(string){
  let answer = [];
  for(i = 0; i < string.length; i++){
    for (j = i+1; j < string.length+1; j++) {
      answer.push([string.slice(i,j)]);
    }
  }
  return answer; 
};

