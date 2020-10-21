Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resource :sessions, only: %i[create destroy]
    end
  end
end
