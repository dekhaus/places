200.times do |i|
  Place.seed do |p|
    p.id = i+1
    p.latitude    = Faker::Address.latitude
    p.longitude   = Faker::Address.longitude
    p.country     = Faker::Address.country
    p.zip         = Faker::Address.zip
    p.address     = Faker::Address.street_address
  end
end
