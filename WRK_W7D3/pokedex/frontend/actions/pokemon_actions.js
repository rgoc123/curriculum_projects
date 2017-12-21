import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';

export const receiveAllPokemon = (pokemons) =>{
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemons
  };
};

export const receivePokemon = (data) =>{
  return {
    type: RECEIVE_POKEMON,
    data
  };
};

export const requestAllPokemon = () => (dispatch) => {
  APIUtil.fetchAllPokemons().then(pokemons => dispatch(receiveAllPokemon(pokemons)));
};

export const requestSinglePokemon = (id) => (dispatch) => {
  APIUtil.fetchPokemon(id).then(pokemon => dispatch(receivePokemon(pokemon)));
};
