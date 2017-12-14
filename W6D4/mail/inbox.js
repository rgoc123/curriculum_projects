const MessageStore = require('./message_store.js');

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