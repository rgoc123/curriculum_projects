/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// identity function for calling harmony imports with the correct context
/******/ 	__webpack_require__.i = function(value) { return value; };
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, {
/******/ 				configurable: false,
/******/ 				enumerable: true,
/******/ 				get: getter
/******/ 			});
/******/ 		}
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = 0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports, __webpack_require__) {

const DOMNodeCollection = __webpack_require__(1);

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

/***/ }),
/* 1 */
/***/ (function(module, exports) {

class DOMNodeCollection{
  constructor(nodeListArray){
    this.nodeListArray = nodeListArray;
  }

  html(string){
    if (string === undefined) {
      return this.nodeListArray[0].innerHTML;
    } else {
      for (let i = 0; i < this.nodeListArray.length; i++) {
        this.nodeListArray[i].innerHTML = string;
      }
      return true;
    }
  }

  empty(){
    this.html('');
  }

  append(elementToAppend){
    if (elementToAppend instanceof DOMNodeCollection) {
      let outerHtmlList = '';
      for (let i = 0; i < elementToAppend.nodeListArray.length; i++) {
        outerHtmlList += elementToAppend.nodeListArray[i].outerHTML;
      }
      for (let i = 0; i < this.nodeListArray.length; i++) {
        this.nodeListArray[i].innerHTML += outerHtmlList;
      } 
    } else if (typeof elementToAppend === 'string') {
      for (let i = 0; i < this.nodeListArray.length; i++) {
        this.nodeListArray[i].innerHTML += elementToAppend;
      }
    } else {
      for (let i = 0; i < this.nodeListArray.length; i++) {
        this.nodeListArray[i].appendChild(elementToAppend);
      }
    }
  }

  attr(attributeName, attributeValue){
    if(attributeValue === undefined){
      return this.nodeListArray[0].getAttribute(attributeName);
    } else {
      this.nodeListArray[0].setAttribute(attributeName, attributeValue);
    }
  }

  addClass(className){
    this.nodeListArray.forEach( (htmlElement) => {
      htmlElement.classList.add(className);
    });
  }

  removeClass(className){
    this.nodeListArray.forEach( (htmlElement) => {
      htmlElement.classList.remove(className);
    });
  }

  // TRAVERSAL

  children(){
    
    let childArray = [];
    
    this.nodeListArray.forEach((parentNode) => {

      Array.from(parentNode.children).forEach((child) => {
        if(!childArray.includes(child)){
          childArray.push(child);
        }
      });
    });
    return new DOMNodeCollection(childArray);
  }

  parent(){
    
    let parentArray = [];

    this.nodeListArray.forEach((childNode) => {
      if(!parentArray.includes(childNode.parentNode)){
        parentArray.push(childNode.parentNode);
      }
    });
    
    return new DOMNodeCollection(parentArray);
  }

  find(selector){
    let myArray = [];
    this.nodeListArray.forEach( (node) => {
      node.querySelectorAll(selector).forEach(ele => {
        if (!myArray.includes(ele)) {
          myArray.push(ele);
        }
      });
    });
    return new DOMNodeCollection(myArray);
  }

  remove(){
    this.nodeListArray.forEach( (node) => {
      node.remove();
    });
    this.nodeListArray = [];
  }
  
  on(eventType, callback){
    this.nodeListArray.forEach (node => {
      node.addEventListener(eventType, callback);
      node[eventType] = callback;
    });
  }
  
  off(eventType){
    this.nodeListArray.forEach (node => {
      node.removeEventListener(eventType, node[eventType]);
    });
  }

}


module.exports = DOMNodeCollection;

















/***/ })
/******/ ]);