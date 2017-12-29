import React from 'react';
import ItemDetailContainer from '../items/item_detail_container';
import { Route, Link } from 'react-router-dom';

class PokemonDetail extends React.Component {
  componentWillReceiveProps(newProps){
    if(this.props.pokemonId !== newProps.pokemonId){
      this.props.requestSinglePokemon(newProps.pokemonId);
    }
  }

  componentDidMount(){
    this.props.requestSinglePokemon(this.props.pokemonId);
  }

  render(){
    if(this.props.pokemon && this.props.pokemon.moves){
      let moves = this.props.pokemon.moves.join(', ');

      let items;
      if(Object.values(this.props.items)){
        items = Object.values(this.props.items).map(item => {
          return (
            <Link key={item.id}
              to={`/pokemon/${this.props.pokemon.id}/item/${item.id}`}>
          <img src={`${item.image_url}`}/>
        </Link>);
        });
      }

      return(
        <div id='pokemon-details'>
          <img src={`${this.props.pokemon.image_url}`}/>
          <ul>
            <li>Name: {this.props.pokemon.name}</li>
            <li>Attack: {this.props.pokemon.attack}</li>
            <li>Defense: {this.props.pokemon.defense}</li>
            <li>Type: {this.props.pokemon.poke_type}</li>
            <li>Moves: {moves}</li>
            <li id='items-details'>
              {items}
            </li>
            <Route path='/pokemon/:pokemonId/item/:itemId'
            component={ItemDetailContainer} items={this.props.items}/>
          </ul>
        </div>
      );
    } else {
      return (
      <div id='pokemon-details'>
      </div>
      );
    }
  }
}

export default PokemonDetail;
