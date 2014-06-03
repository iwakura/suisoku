Rails.application.routes.draw do
  resources :guesses, only: [:new, :create, :index]
  root to: 'guesses#new'

  get '/', to: 'sessions#new', constraints: ->(req) { req.session[:user_id].blank? }
  get 'sign_up', to: 'sign_up#new'
  post 'sign_up', to: 'sign_up#create'

  resource :session, only: [:new, :create, :destroy]

end
