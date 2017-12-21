import React from 'react';

class PokemonDetails extends React.Component {
  componentWillReceiveProps(newProps){
    if(newProps.pokemonId !== this.props.pokemonId){
      this.props.requestSinglePokemon(newProps.pokemonId);
    }
  }

  componentDidMount(){

    this.props.requestSinglePokemon(this.props.pokemonId);
  }

  render(){

    if(this.props.pokemon && this.props.pokemon.moves){
      //
      // let moves = this.props.pokemon.moves ;
      // if (!moves){
      //   debugger
      //   moves = moves.join(", ");
      // }

      return (
        <div className="div-detail">
          <li>Name: {this.props.pokemon.name}</li>
          <img className="detail" src={this.props.pokemon.image_url}/>
          <li>Type: {this.props.pokemon.type}</li>
          <li>Attack: {this.props.pokemon.attack}</li>
          <li>Defense: {this.props.pokemon.defense}</li>
          <li>Moves: {this.props.pokemon.moves.join(', ')}</li>
        </div>
      );
    } else {
      return (
        <div>Loading...</div>
      );
    }
  }
}

export default PokemonDetails;
