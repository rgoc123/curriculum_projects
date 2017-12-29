import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';

const pokemonReducer =(state = {} , action ) => {
  let newState;
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign({},action.pokemon, state);
    case RECEIVE_POKEMON:
      return Object.assign(
        {},state,
        {[action.pokemonWithItems.pokemon.id]:
          action.pokemonWithItems.pokemon});
    default:
      return state;
  }
};

export default pokemonReducer;
