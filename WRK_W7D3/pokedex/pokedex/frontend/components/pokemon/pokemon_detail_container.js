import { connect } from 'react-redux';
import PokemonDetail from './pokemon_detail';
import { requestSinglePokemon } from '../../actions/pokemon_actions';

const mapStateToProps = (state, ownProps)=>{
  return {
    pokemonId: ownProps.match.params.pokemonId,
    pokemon: state.entities.pokemon[ownProps.match.params.pokemonId],
    items: state.entities.items
  };
};

const mapDispatchToProps = (dispatch, ownProps) => {
  return {
    requestSinglePokemon: id => dispatch(requestSinglePokemon(id)),
  };
};

export default connect(mapStateToProps,mapDispatchToProps)(PokemonDetail);
