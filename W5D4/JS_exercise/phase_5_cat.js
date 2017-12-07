function Cat(name,owner) {
  this.name = name;
  this.owner = owner;
}

Cat.prototype.cuteStatement = function() {
  return `${this.owner} loves ${this.name}`;
};

const Chibi = new Cat('Chibi', 'me');
const Papi = new Cat('Papi Chulo', 'me');

Cat.prototype.cuteStatement = function() {
  return `Everyone loves ${this.name}!!!!`;
};

Cat.prototype.meow = function() {
  return `MEOW!`;
};

Chibi.meow = function() {
  return `${this.name} woofs`;
};