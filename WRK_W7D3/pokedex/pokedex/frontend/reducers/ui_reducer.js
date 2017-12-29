import {RECEIVE_POKEMON} from '../actions/pokemon_actions';

const _defaultState = { pokeDisplay: '', errors: {}, loading: {}};

const uiReducer = (state = _defaultState, action) => {
  switch (action.type) {
    case RECEIVE_POKEMON:
      return Object.assign({},state,
        {['pokeDisplay']: action.pokemonWithItems.pokemon.id});
    default:
      return state;
  }
};

export default uiReducer;
