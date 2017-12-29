import * as APIUtil from '../util/api_util';

export const RECEIVE_ALL_POKEMON = 'RECEIVE_ALL_POKEMON';
export const RECEIVE_POKEMON = 'RECEIVE_POKEMON';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';

export const receiveAllPokemon = pokemon => {
  return {
    type: RECEIVE_ALL_POKEMON,
    pokemon
  };
};

export const receiveSinglePokemon = pokemonWithItems => {
  return {
    type: RECEIVE_POKEMON,
    pokemonWithItems
  };
};

export const receiveErrors = errors => {
  return {
    type: RECEIVE_ERRORS,
    errors
  };
};

export const requestAllPokemon = () => dispatch => {
  return APIUtil.fetchAllPokemon().then(
    pokemon => dispatch(receiveAllPokemon(pokemon)));
};

export const requestSinglePokemon = id => dispatch => {
  return APIUtil.fetchPokemon(id).then(
    pokemonWithItems => dispatch(receiveSinglePokemon(pokemonWithItems))
  );
};

export const createPokemon = pokemon => dispatch => (
	APIUtil.createPokemon(pokemon).then((poke => {
		dispatch(receiveSinglePokemon(poke));
		return poke;
	}),
    errors => dispatch(receiveErrors(errors.responseJSON))
  )
);
