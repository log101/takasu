Rails.application.routes.draw do
  get 'search/', to: 'search#index'
  get 'profile/show'

  get 'trades/new_trade_item', to: 'trades#add_trade_item'
  get 'trades/remove_trade_item', to: 'trades#remove_trade_item'
  get 'trades/confirm_sender', to: 'trades#confirm_sender'
  get 'trades/unconfirm_sender', to: 'trades#unconfirm_sender'
  get 'trades/:id', to: 'trades#show'

  resources :mangas, except: [:index, :show]
  resources :trades, except: [:show]

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/users/:id', to: 'profile#show', as: 'user'
  root 'home#index'
end
