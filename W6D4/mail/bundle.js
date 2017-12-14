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

const Router = __webpack_require__(1);
const Inbox = __webpack_require__(2);

document.addEventListener('DOMContentLoaded', afterLoad);

function afterLoad(){
  const sidebarLists = document.querySelectorAll('.sidebar-nav li');
  sidebarLists.forEach((list)=>{
    list.addEventListener('click', (e)=>{
      window.location.hash = e.target.innerText.toLowerCase();
    });
  });
  
  const Route = new Router(document.querySelector('.content'), Routes);
  Route.start();
}


const Routes = {
  inbox: new Inbox()
};

/***/ }),
/* 1 */
/***/ (function(module, exports) {

class Router{
  constructor(node, routes){
    this.routes = routes;
    this.node = node;
    this.render = this.render.bind(this);
    this.start = this.start.bind(this);
    this.activeRoute = this.activeRoute.bind(this);
  }
  start(){
    this.render();
    window.addEventListener('hashchange', this.render);
  }
  
  render(){
    this.node.innerHTML = '';
    const component = this.activeRoute();
    if(component === undefined){
      return;
    } else {
      this.node.append(component.render());
    }
  }
  
  activeRoute(){
    return this.routes[window.location.hash.slice(1)];
  }
  
}

module.exports = Router;

/***/ }),
/* 2 */
/***/ (function(module, exports, __webpack_require__) {

const MessageStore = __webpack_require__(3);

class Inbox{
  constructor(){
    this.render.bind(this);
    this.messageStore = new MessageStore();
  }
  
  render(){
    const unorderedList = document.createElement('ul');
    unorderedList.classList.add('messages');
    document.getElementsByClassName('content')[0].append(unorderedList);
    
    const inboxMessages = this.messageStore.getInboxMessages();
    inboxMessages.forEach((msg) => {
      unorderedList.append(this.renderMessage(msg));
    });
  }
  
  renderMessage(message){
    const newList = document.createElement('li');
    newList.classList.add('message');
    const fromSpan = `<span>${message.from}</span>`;
    const subjectSpan = `<span>${message.subject}</span>`;
    const bodySpan = `<span>${message.body}</span>`;
    newList.innerHTML = `${fromSpan}${subjectSpan}${bodySpan}`;
    return newList;
  }
}


module.exports = Inbox;

/***/ }),
/* 3 */
/***/ (function(module, exports) {

const messages = {
  sent: [
    {to: 'test@gmail.com', subject: 'IM WORKING', body: "YAAY"},
    {to: 'testANOTHER@gmail.com', subject: 'IM WORKING AGAIN', body: "YAAY AGAIN"}
  ],
  inbox: [
      {from: "grandma@mail.com", subject: "Fwd: Fwd: Fwd: Check this out", body:
  "Stay at home mom discovers cure for leg cramps. Doctors hate her"}, {from: "person@mail.com", subject: "Questionnaire", body: "Take this free quiz win $1000 dollars"} ] 
};


class MessageStore{
  constructor(){
  }
  getInboxMessages(){
    return messages.inbox;
  }
  getSentMessages(){
    return messages.sent;
  }
}



module.exports = MessageStore;

/***/ })
/******/ ]);