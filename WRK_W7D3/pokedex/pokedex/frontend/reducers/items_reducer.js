import {RECEIVE_POKEMON} from '../actions/pokemon_actions';

const itemsReducer = (state = {}, action) => {
  Object.freeze(state);
  let newState = {};
  switch (action.type) {
    case RECEIVE_POKEMON:
    action.pokemonWithItems.items.forEach(item => {
      newState[item.id] = item;
    });
    return newState;
    default:
      return state;
  }
};

export default itemsReducer;
