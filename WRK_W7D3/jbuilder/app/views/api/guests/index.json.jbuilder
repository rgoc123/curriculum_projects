json.array! @guests.each do |guest|
    json.partial! 'api/guests/guest', guest: guest
end
