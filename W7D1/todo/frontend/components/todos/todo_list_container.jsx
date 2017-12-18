import { connect } from 'react-redux';
import TodoList from './todo_list';
import { allTodos } from '../../reducers/selectors';
import {receiveTodos, receiveTodo, removeTodo} from '../../actions/todo_actions.js';

const mapStateToProps = (state) => {
  return {
    todos: allTodos(state.todos)
  };
};

const mapDispatchToProps = (dispatch) => {
  return {
    receiveTodo: (todo) => dispatch(receiveTodo(todo)),
    removeTodo: (id) => dispatch(removeTodo(id))
  };
};

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(TodoList);
