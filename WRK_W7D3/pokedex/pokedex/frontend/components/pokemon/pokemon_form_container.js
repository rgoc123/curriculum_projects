import { connect } from 'react-redux';
import PokemonForm from './pokemon_form';
import { createPokemon } from '../../actions/pokemon_actions';

const mapStateToProps = state => {
  return {
    errors: state.entities.errors
  };
};
const mapDispatchToProps = dispatch => {
  return {
    createPokemon: pokemon => dispatch(createPokemon(pokemon))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(PokemonForm);
