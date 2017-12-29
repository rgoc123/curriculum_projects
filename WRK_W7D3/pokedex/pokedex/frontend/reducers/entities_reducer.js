import { combineReducers } from 'redux';
import PokemonReducer from './pokemon_reducer';
import ItemsReducer from './items_reducer';
import ErrorsReducer from './errors_reducer';

const entitiesReducer = combineReducers({
  pokemon: PokemonReducer,
  items: ItemsReducer,
  errors: ErrorsReducer
});

export default entitiesReducer;
