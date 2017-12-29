json.pokemon do
  json.extract! @pokemon, :id,:name,:attack, :defense, :moves, :poke_type, :item_ids
  json.image_url asset_path(@pokemon.image_url)
end

json.items do
  json.array! @pokemon.items do |item|
    json.partial! 'api/pokemon/item', item: item
  end
end
