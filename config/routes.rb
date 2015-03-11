Rails.application.routes.draw do

  root 'articles#index'

  resources :events, only: [:index, :new, :create, :show]
  resources :concepts, only: [:index, :new, :create, :show]
  resources :opinions, only: [:index, :new, :create, :show]

  resources :users, only: [:create]
  get 'users/register', to: 'users#new'

  resources :articles, only: [:index, :new, :create, :show] do
    #resources :briefs, only: [:new, :create, :edit, :update]
    resources :comments, only: [:create]
  end

  resources :briefs, only: [:new, :create, :edit, :update]

  post '/login', to: 'sessions#create'
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  get '/results', to: 'searches#index'
  resources :searches, only: [:create]

end
