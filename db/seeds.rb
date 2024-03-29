require 'faraday'
require 'json'

# clear all tables before seed
[Dog].each do |table|
  ActiveRecord::Base.connection.execute("TRUNCATE #{table.table_name} RESTART IDENTITY CASCADE")
end

url = 'https://api.thedogapi.com/v1/breeds/'

conn = Faraday.new(
  url,
  params: {
    param: '1'
  },
  headers: {
    'Content-Type': 'application/json',
    'x-api-key': ENV['THE_DOG_API_KEY']
  }
)

res = conn.get()
# p JSON.parse(res.body).first['weight']['imperial']
JSON.parse(res.body).each do |dog|
  dog_seed = Dog.create!(
    breed: dog['name'],
    weight_imperial: dog['weight']['imperial'],
    weight_metric: dog['weight']['metric'],
    height_imperial: dog['height']['imperial'],
    height_metric: dog['height']['metric'],
    bred_for: dog['bred_for'],
    breed_group: dog['breed_group'],
    life_span: dog['life_span'],
    temperament: dog['temperament']&.split(','),
    reference_image_id: dog['reference_image_id']
  )
  p dog_seed.breed if dog_seed.persisted?
end
