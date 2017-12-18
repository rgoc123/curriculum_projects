import {RECEIVE_TODOS, RECEIVE_TODO, receiveTodos, receiveTodo} from '../actions/todo_actions.js' ;
import {REMOVE_TODO, removeTodo} from '../actions/todo_actions.js' ;
import merge from 'lodash/merge';


const initialState = {
  1: {
    id: 1,
    title: 'wash car',
    body: 'with soap',
    done: false
  },
  2: {
    id: 2,
    title: 'wash dog',
    body: 'with shampoo',
    done: true
  },
};

const todosReducer = (state = initialState, action) => {
  let newState;
  debugger
  switch (action.type) {
    case RECEIVE_TODOS:
      newState = {};
      action.todos.forEach((todo) => {
        newState[todo.id] = todo;
      });
      return newState;
    case RECEIVE_TODO:
      return Object.assign({}, state, {[action.todo.id]: action.todo});
    case REMOVE_TODO:
      newState = {};
      Object.keys(state).forEach((el) => {
        if (action.id !== parseInt(el)) {
          newState[el] = state[el];
        }
      });
      return newState;
    default:
      return state;
  }
};

export default todosReducer;
