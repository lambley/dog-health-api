Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dogs, only: %i[index show create]
    end
  end
end
