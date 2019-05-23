Rails.application.routes.draw do
  resources :events do
    resources :tickets, shallow: true
  end
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => 'events#index'

  get '/login',   to: 'sessions#new', as: :login_form
  post '/login',   to: 'sessions#create', as: :log_in
  get '/log_out' => 'sessions#destroy', as: :log_out

  get '/sign_in' => 'registrations#new', as: :registrations
  post '/sign_in' => 'registrations#create', as: :sign_in

end
