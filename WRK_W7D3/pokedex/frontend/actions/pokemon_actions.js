import * as APIUtil from '../util/api_util';
export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';

export const receiveAllPokemon = (pokemons) =>{
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemons
  };
};

export const requestAllPokemon = () => (dispatch) => {
  APIUtil.fetchAllPokemons().then(pokemons => dispatch(receiveAllPokemon(pokemons)));
};

//dispatch(requestAllPokemon());
//dispatch( function (dispatch){
// APIUtil.fetchAllPokemons().then(pokemons => dispatch(receiveAllPokemon(pokemons)));
//} )
