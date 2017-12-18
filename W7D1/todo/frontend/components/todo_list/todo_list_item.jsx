import React from 'react';

function bindCallback(arg, callback) {
  return () => {callback(arg);};
}

class TodoListItem extends React.Component  {
  constructor(props) {
    super(props);
    this.todoItem = props.todoItem;
    this.removeTodo = props.removeTodo;
    this.receiveTodo = props.receiveTodo;
  }

  render(){
    const [ todoItem, removeTodo, receiveTodo ] = [ this.todoItem, this.removeTodo, this.receiveTodo ];
    return (
      <li>
        {todoItem.title}
        <button onClick={bindCallback(Object.assign(todoItem,{done: !todoItem.done}), receiveTodo.bind(this))}>{todoItem.done ? "Wait not finished" : "Yaay I'm finished"}</button>
          <button onClick={bindCallback(todoItem.id, removeTodo.bind(this))}>"Delete Me~"</button>
          <ul>
            <li>{todoItem.body}</li>
            <li>{todoItem.done ? "Done" : "Unfinished"}</li>
        </ul>
      </li>
    );
  }
}
export default TodoListItem;
