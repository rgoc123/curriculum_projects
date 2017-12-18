import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
import TodoForm from '../todo_list/todo_form';

const TodoList = ({todos, receiveTodo, removeTodo}) => {
  const todoList = todos.map((todo,idx) => {
    return (<TodoListItem key={todo.id} todoItem={todo} receiveTodo={receiveTodo} removeTodo={removeTodo} />);
  })
  return (
    <div>
      <TodoForm receiveTodo={receiveTodo}/>
      <ul>
        {todoList}
      </ul>
    </div>
  );
};

export default TodoList;
