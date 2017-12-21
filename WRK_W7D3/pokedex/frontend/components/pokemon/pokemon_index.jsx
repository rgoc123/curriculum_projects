import React from 'react';
import PokemonIndexItem from './pokemon_index_item.jsx';
import { HashRouter, Route } from 'react-router-dom';
import PokemonDetailContainer from './pokemon_detail_container';

class PokemonIndex extends React.Component {
  componentDidMount(){
    this.props.requestAllPokemon();
  }

  render(){
    const pokemons = this.props.pokemon.map((pokemon)=> {
      return <PokemonIndexItem key={pokemon.id} pokemon={pokemon}/>;
    });
    return(
      <div>
        <ul>
          {pokemons}
        </ul>
        <Route path='/pokemon/:pokemonId' component={PokemonDetailContainer} />
      </div>
    );
  }
}


export default PokemonIndex;
