# dog-health-app
RoR and React app to calculate dog's ideal weight
- This is the API client - front end repo is here: https://github.com/lambley/dog-health-frontend

## Initial setup instructions
- project structure:
```
dog-health-app
└api-client
|   └───controllers
|       └───api
|           └───v1
|               | dogs_controller.rb
└───...
└front-end
└───...
└───src
|   └───Pages
|   └───Components
|       | MainSearch.tsx
|   └───Dogs
|       | DogList.tsx
|       | Dog.tsx
└───...
```
### Backend
- `rails new api-client --api` to create app with api gems like `cors` inbuilt
- amend cors policy in `config/initializers/cors.rb` to accept any cross-origin traffic:
```
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
```
- generate dog model and controller - controller only needs index (but I've added show and create for future use)
- ensure `dogs_controller#index` render a json response by adding:
```
@dogs = Dog.all
render json: @dogs
```
- update routes like so:
```
  namespace :api do
    namespace :v1 do
      resources :dogs
    end
  end
```
- seed database from [The Dog API](https://thedogapi.com/) 

### Frontend
- create app using `npx create-react-app front-end --template typescript`
- set up port in .env file: `PORT=4000`
- Install dependencies like `bootstrap`, `axios`, `react-router-dom`

## Testing setup
Backend - testing the API
- add testing gems:
```
group :development, :test do
  gem 'rspec-rails'
end
group :test do
    gem 'factory_bot_rails'
    gem 'faker'
end
```
- install `rspec` using `rails generate rspec:install` - generates a spec folder with `rails_helper.rb` and `spec_helper.rb` files
- setup `FactoryBot` in `spec/factrories.rb` to generate fake dog records like so:
```
FactoryBot.define do
  factory :dog do
    name: { some faker code }
    etc.
  end
end
```

## Next steps
- after finding the breed, select breed to see a form where user can add their dog's weight
- after ideal dog's weight found, if too heavy: display tips for helping dog lose weight; if too low: display tips for gaining weight
- add tab to search by "breed group" e.g. Toy and find dog there


