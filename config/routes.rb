Rails.application.routes.draw do
  root 'photos#index'
  get '/search', to: 'photos#show'
end
