const Game = require('./game.js');

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