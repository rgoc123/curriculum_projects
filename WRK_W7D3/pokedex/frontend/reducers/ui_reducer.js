import { RECEIVE_POKEMON } from '../actions/pokemon_actions';

const uiReducer = (state={},action) => {
  switch (action.type) {
    case RECEIVE_POKEMON:
      return Object.assign({},state,{pokeDisplay: action.data.pokemon.id});
    default:
      return state;
  }
};


export default uiReducer;
