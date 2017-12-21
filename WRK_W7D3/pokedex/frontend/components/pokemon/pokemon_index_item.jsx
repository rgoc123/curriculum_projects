import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ( {pokemon} ) =>  {

  return (
    <section className="pokedex">
      <Link to={`/pokemon/${pokemon.id}`}>
        <li>{pokemon.name}</li>
        <img src={pokemon.image_url}/>
      </Link>
    </section>
  );
};

export default PokemonIndexItem;
