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