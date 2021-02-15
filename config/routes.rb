Rails.application.routes.draw do
  resource :users, only: [:create]

  get '/sign-in', to: 'users#sign_in'
  get '/auto-sign-in', to: 'users#auto_sign_in'
end
