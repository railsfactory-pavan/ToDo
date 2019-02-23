Rails.application.routes.draw do
  devise_for :users
  
  root :to => "to_do_lists#index"
  resources :to_do_lists

  namespace :api do
    namespace :v1 do
      resources :to_do_lists
    end
  end
end
