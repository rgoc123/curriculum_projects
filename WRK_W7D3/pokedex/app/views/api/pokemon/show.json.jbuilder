json.pokemon do
  json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :image_url, :poke_type
end
json.items do
  json.array!(@pokemon.items) do |item|
    json.extract! item, :id, :pokemon_id, :price, :happiness, :image_url
  end
end
