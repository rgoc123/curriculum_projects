const Router = require('./router.js');
const Inbox = require('./inbox.js');

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