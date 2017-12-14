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