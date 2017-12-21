import React from 'react';
import ReactDOM from 'react-dom';
import { provider } from 'react-redux';
import configureStore  from './store/store';
import { fetchAllPokemons } from './util/api_util.js';
import { receiveAllPokemon, requestAllPokemon } from './actions/pokemon_actions.js';
import selectAllPokemon from './reducers/selectors';
import Root from './components/root';
import { HashRouter, Route} from 'react-router-dom';

document.addEventListener('DOMContentLoaded', ()=>{
  const rootEl = document.getElementById('root');
  const store = configureStore();
  ReactDOM.render(<Root store={store}/>, rootEl);
});
