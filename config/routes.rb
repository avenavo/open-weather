Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :sessions, only: %i[create destroy]
      resource :registrations, only: %i[create destroy]
      resources :users_cities, only: %i[create destroy show index]
    end
  end
end
