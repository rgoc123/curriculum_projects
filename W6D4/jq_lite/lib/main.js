const DOMNodeCollection = require('./dom_node_collection.js');

window.$l = $l;

function $l(arg){
  // 1. takes in a string, this uses a css selector format, returns an array of dom elements
  // 2. takes a html element and converts it into jquery object
  // 3. takes a html code... then creates a htmlElement and returns jquery object
  // 4. takes a callback, this invokes when document is ready

  if (typeof arg === 'string') {
    const nodeList = document.querySelectorAll(arg);
    return new DOMNodeCollection(Array.from(nodeList));
  } else if (arg instanceof HTMLElement) {
    return new DOMNodeCollection(Array.from(arg));
  } else if (typeof arg === 'function'){
    document.addEventListener("DOMContentLoaded", arg);
  }
}

$l.ajaxConstant = function(){
  return {
    type:'GET',
    url: window.location.href,
    success(){console.log('success');},
    failure(){console.log('failure');}
  };
};

$l.extend = function(...JSObjects){
  const extendObj = {};
  JSObjects.forEach((object)=>{
    for(let element in object){
      extendObj[element] = object[element];
    }
  });
  return extendObj;
};

$l.ajax = function(options){
  const ajaxParams = $l.extend($l.ajaxConstant(), options);
  const xhr = new XMLHttpRequest();
  xhr.open(ajaxParams.type, ajaxParams.url);
  xhr.onload = function(){
    if(xhr.status === 200){
      ajaxParams.success(xhr.response);
    } else {
      ajaxParams.failure(xhr.response);
    }
  };
  xhr.send(ajaxParams.data);
};

$l.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=London,uk&appid=bcb83c4b54aee8418983c2aff3073b3b",
  success(data) {
    console.log("We have your weather!")
    console.log(data);
  },
  error() {
    console.error("An error occurred.");
  },
});