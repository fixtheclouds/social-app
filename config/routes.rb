Rails.application.routes.draw do
  mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql" if Rails.env.development?
  post "/graphql", to: "graphql#execute"

  resource :users, only: [:create]

  get '/sign-in', to: 'users#sign_in'
  get '/auto-sign-in', to: 'users#auto_sign_in'
end
