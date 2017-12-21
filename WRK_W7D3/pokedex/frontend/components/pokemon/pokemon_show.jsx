import React from 'react';

const PokemonShow = ({pokemon}) => {
  return (
    <div>
      <li>{pokemon.name}</li><img src={pokemon.image_url}/>
    </div>
  );
};

export default PokemonShow;
