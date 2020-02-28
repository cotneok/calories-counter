Rails.application.routes.draw do
  resources :meals
  devise_for :users
  resources :users
  get 'search', to: "meals#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
end
