import React from 'react';
import PokemonIndexItem from './pokemon_index_item';
import { Link, Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';
import PokemonFormContainer from './pokemon_form_container';

class PokemonIndex extends React.Component {
  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    const pokemon = this.props.pokemon.map(poke => (
      <PokemonIndexItem key={poke.id} pokemon={poke}/>
    ));
    return (
      <div className='pokemon-main'>
        <Link to='/create'>Add a Pokemon!</Link>
      <ul id='pokemon-list'>
        {pokemon}
      </ul>
      <Route path='/create' component={PokemonFormContainer}/>
      <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer}/>
      </div>
    );
  }
}

export default PokemonIndex;
