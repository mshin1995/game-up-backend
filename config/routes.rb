Rails.application.routes.draw do
  resources :lists, only: [:update, :destroy, :create, :indexx]
  resources :users
  get '/lists/:user_id', to: 'lists#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
