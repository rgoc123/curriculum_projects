import React from 'react';
import { Link } from 'react-router-dom';

const PokemonIndexItem = ({pokemon}) => {
  return (
    <li id='pokemon'>
      <Link to={`/pokemon/${pokemon.id}`}>{pokemon.name}</Link>
      <img src={`${pokemon.image_url}`}/>
    </li>
  );
};

export default PokemonIndexItem;
