import React from 'react';
import {withRouter} from 'react-router-dom';

const TYPES = [
  'fire',
  'electric',
  'normal',
  'ghost',
  'psychic',
  'water',
  'bug',
  'dragon',
  'grass',
  'fighting',
  'ice',
  'flying',
  'poison',
  'ground',
  'rock',
  'steel'
];

class PokemonForm extends React.Component {
  constructor(props){
    super(props);
    this.state = {
      name:'', image_url:'',
      attack:'', defense:'', poke_type:'fire', moves: []
    };
    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit(e){
    e.preventDefault();
    this.props.createPokemon(this.state).then(pokemonWithItems => (
      this.props.history.push(`pokemon/${pokemonWithItems.pokemon.id}`)
    ));
  }

  handleChange(type){
    if(type==='move'){
      return (e) => {
        let newMoves = [e.target.value];
        this.setState({moves: newMoves});
      };
    }
    return e => (
      this.setState({[type]: e.target.value})
    );
  }

  render(){
    const types = TYPES.map((type,idx) =>
      {
        return (<option key={idx} value={type}>{type}</option>);
      }
    );
    const errors = this.props.errors.map((error,i) => (
      <li key={i}>{error}</li>
    ));

    return(
      <div>
      <form className='pokemon-form' onSubmit={this.handleSubmit}>
        <label>Pokemon name
          <input type='text' onChange={this.handleChange('name')} value={this.state.name}/>
        </label>

        <label>Image Url
          <input type='text' onChange={this.handleChange('image_url')} value={this.state.image_url}/>
        </label>

        <label>Attack
          <input type='number' min='0' onChange={this.handleChange('attack')} value={this.state.attack}/>
        </label>

        <label>Defense
          <input type='number' min='0' onChange={this.handleChange('defense')} value={this.state.defense}/>
        </label>

        <label>Type
          <select onChange={this.handleChange('poke_type')}>
            {types}
          </select>
        </label>

        <label>Move
          <input type='text' onChange={this.handleChange('move').bind(this)} value={this.state.moves.join('')}/>
        </label>

        <input type='submit' value='Add Pokemon!'/>
      </form>
        <ul>
          {errors}
        </ul>
      </div>
    );
  }
}

export default withRouter(PokemonForm);
