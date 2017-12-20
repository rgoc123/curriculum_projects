export const fetchAllPokemons = () => {
  return $.ajax({
    url: '/api/pokemon',
    method: 'GET'
  });
};
