import React from 'react';
import ReactDOM from 'react-dom';
import { provider } from 'react-redux';
import configureStore  from './store/store';
import { fetchAllPokemons } from './util/api_util.js';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions.js';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';

document.addEventListener('DOMContentLoaded', ()=>{
  const rootEl = document.getElementById('root');
  const store = configureStore();
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  window.selectAllPokemon = selectAllPokemon;
  window.requestAllPokemon = requestAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  ReactDOM.render(<Root store={store}/>, rootEl);
});
