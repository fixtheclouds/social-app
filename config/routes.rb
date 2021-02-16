Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  resource :users, only: [:create]

  get '/sign-in', to: 'users#sign_in'
  get '/auto-sign-in', to: 'users#auto_sign_in'
end
