Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :workouts, only: :index, defaults: { format: :json }
      resources :exercises, only: [:show, :create], defaults: { format: :json }
    end
  end
end
