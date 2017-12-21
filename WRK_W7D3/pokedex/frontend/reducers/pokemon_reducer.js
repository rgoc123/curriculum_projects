import { RECEIVE_ALL_POKEMON, RECEIVE_POKEMON } from '../actions/pokemon_actions';

export const pokemonReducer = (state={},action) => {
  debugger
  switch (action.type) {
    case RECEIVE_ALL_POKEMON:
      return Object.assign({},action.pokemons,state);
    case RECEIVE_POKEMON:
      return Object.assign({},state,{[action.data.pokemon.id]: action.data.pokemon});
    default:
      return state;
  }
};

export default pokemonReducer;
