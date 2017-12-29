import { RECEIVE_ERRORS } from '../actions/pokemon_actions';

const errorsReducer = (state = [], action) => {
  switch (action.type) {
    case RECEIVE_ERRORS:
      return action.errors;
    default:
      return [];
  }
};

export default errorsReducer;
