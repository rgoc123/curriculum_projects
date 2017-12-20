json.extract! @guest, :name, :age, :favorite_color

json.gifts @guest.gifts.each do |gift|
  json.partial! 'api/gifts/gift', gift: gift
end
