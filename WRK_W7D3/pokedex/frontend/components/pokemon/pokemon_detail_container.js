import { connect } from 'react-redux';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

import PokemonDetail from './pokemon_detail';

const mapStateToProps = (state, ownProps) => {
  return {
    pokemonId: ownProps.match.params.pokemonId,
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId]
  };
};

const mapDispatchToProps = dispatch => ({
  requestSinglePokemon: (pokemon_id) => dispatch(requestSinglePokemon(pokemon_id))
});


export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);
