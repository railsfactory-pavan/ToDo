Rails.application.routes.draw do
  devise_for :users

  root :to => "to_do_lists#index"
  resources :to_do_lists

  # get '/api/v1/to_do_lists', to: 'api/v1/to_do_lists#index'
  # post '/api/v1/to_do_lists', to: 'api/v1/to_do_lists#create'
  # get '/api/v1/to_do_lists/:id', to: 'api/v1/to_do_lists#show'
  # patch '/api/v1/to_do_lists/:id', to: 'api/v1/to_do_lists#update'
  # put '/api/v1/to_do_lists/:id', to: 'api/v1/to_do_lists#update'
  # delete '/api/v1/to_do_lists/:id', to: 'api/v1/to_do_lists#destroy'

  namespace :api do
    namespace :v1, defaults: { format: :json } do

      resources :to_do_lists, only: [:index, :create, :show, :update, :destroy]
    end
  end
end
