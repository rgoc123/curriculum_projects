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
/******/ 	return __webpack_require__(__webpack_require__.s = 1);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ (function(module, exports) {

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



/***/ }),
/* 1 */
/***/ (function(module, exports, __webpack_require__) {

// require('Bullet');
// 
const GameView = __webpack_require__(4);
// require('Game');
// 

// require('Ship');
 const canvas = document.getElementById('canvas');
 const ctx = canvas.getContext('2d');
 GameView(ctx).start();1

/***/ }),
/* 2 */
/***/ (function(module, exports) {

const Util = {
  inherits (childClass, parentClass) {
    //...
    function Surrogate(){}
    Surrogate.prototype = parentClass.prototype;
    childClass.prototype = new Surrogate();
  // childClass.prototype = Object.create(parentClass);
    childClass.prototype.constructor = childClass;
},
  randomVec (length) {
  const deg = 2 * Math.PI * Math.random();
  return Util.scale([Math.sin(deg), Math.cos(deg)], length);
  },
  scale(vec, m) {
    return [vec[0] * m, vec[1] * m];
  }
};

module.exports = Util;

/***/ }),
/* 3 */
/***/ (function(module, exports, __webpack_require__) {

const MovingObject = __webpack_require__(0);
const Util = __webpack_require__(2);

const COLOR = 'blue';
const RADIUS = 10;

function Asteroid(input){
  const vel = Util.randomVec(Math.random()*3);
  MovingObject.call(this, {vel: vel, pos: input.pos, color: COLOR, radius: RADIUS});
}

Util.inherits(Asteroid, MovingObject);

module.exports = Asteroid;

/***/ }),
/* 4 */
/***/ (function(module, exports, __webpack_require__) {

const Game = __webpack_require__(5);

function GameView(ctx) {
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function() {
  const ctx = this.ctx;
  setInterval(() =>{
    this.game.moveObjects();
    this.game.draw(ctx);
  },20);
};

module.exports = GameView;

/***/ }),
/* 5 */
/***/ (function(module, exports, __webpack_require__) {

const Asteroid = __webpack_require__(3);

function Game(){
  const DIM_X = 500;
  const DIM_Y = 500;
  const NUM_ASTEROIDS = 18;
  this.asteroids = [];
  this.addAsteroids();
}

Game.prototype.addAsteroids = function(){
  for (var i = 0; i < this.NUM_ASTEROIDS; i++) {
    this.asteroids.push(new Asteroid({pos: this.randomPosition()}));
  }
  return true;
};

Game.prototype.randomPosition = function(){
  return [this.DIM_X * Math.random(), this.DIM_Y * Math.random()];
};

Game.prototype.moveObjects = function() {
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].move();
  }
  return true;
};

Game.prototype.draw = function(ctx){
  ctx.clearRect(0,0,500,500);
  for (let i = 0; i < this.asteroids.length; i++) {
    this.asteroids[i].draw();
  }
  return true;
};

module.exports = Game;

/***/ })
/******/ ]);