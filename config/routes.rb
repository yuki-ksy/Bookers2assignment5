Rails.application.routes.draw do
  devise_for :users
  root to: 'home#top'
  get 'home/about'
  resources :books
  resources :users
  get 'search' => 'searches#search'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
