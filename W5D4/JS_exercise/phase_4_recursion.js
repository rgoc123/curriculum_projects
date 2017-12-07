//#range(start, end)

function range(start, end){
  if(start == end){
    return [];
  }else{
    end--;
    // console.log(end);
    return range(start,end).concat(end);
    // return [start].concat(range(start++, end));
  }
}


//sumRec(arr)

function sumRec(arr) {
  if (arr.length == 1) {
    return arr[0]; 
  } else {
    return arr[0] + sumRec(arr.slice(1));
  }
}

// exponent(base, exp)

function exponent(base,exp) {
  if (exp === 0) {
    return 1 ;
  } else {
    return base * exponent(base,exp-1);
  }
}

function exponent2(b,n) {
  if (n == 0) { return 1; }
  if (n == 1) { return b; }
  
  if (n % 2 == 0 ) {
    return exponent2(b, n / 2) * b ;
  } else {
    return b * (exponent2(b, (n - 1) / 2) * b);
  }
}

//fibonacci(n) we start with [0,1]
//[0,1,1]

function fib(n){
  if(n == 1 ){
    return [0];
  } else if (n == 2){
    return [0,1];
  } else {
    var arr = fib(n-1);
    return arr.concat(arr[arr.length-1] + arr[arr.length - 2]);
  }
}

//BSEARCH(ARR,TARGET)

function bSearch(arr,target){
  if(arr.length == 0){
    return -1;
  }
  let middle_i = arr.length / 2; 
  if(target == arr[middle_i]){
    return middle_i;
  }else if(target > arr[middle_i]){
    i = bsearch(arr.slice(middle_i + 1), target);
    if(i == -1){
      return -1;
    }else{
      return i + 1;
    }
  }else{
    i = bsearch(arr.slice(0,middle_i),target);
    if(i == -1){
      return -1;
    } else{
      return i;
    }
  }
}

function mergeSort(arr){
  if(arr.length <= 1){
    return arr;
  }
  
  let middle_i = Math.floor(arr.length / 2); 
  
  let left = arr.slice(0, middle_i);
  let right = arr.slice(middle_i);

  return merge(mergeSort(left), mergeSort(right));
}

function merge(left, right){
  var merged = [];

  while(left.length > 0 && right.length > 0){
    switch(true){
      case left[0] > right[0]:
        merged.push(right.shift());
        break;
      case right[0] > left[0] || right[0] == left[0]:
        merged.push(left.shift());
        break;
    }
  }
  return merged.concat(left).concat(right);
}


// subsets
// [1,2]
// [][1][2][1,2]

// [1,2,3]
// [][1][2][3][1,2][1,3][1,2,3][2,3]

function subsets(arr){
  if(arr.length == 0){
    return [[]];
  } else {
    var prev_sub = subsets(arr.slice(0,arr.length-1));
    return prev_sub.concat(prev_sub.map((el) => el.concat(arr[arr.length-1])));
  }
}





