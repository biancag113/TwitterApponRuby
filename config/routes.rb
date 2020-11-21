Rails.application.routes.draw do
  resources :tweets
  get '/meta', to: 'meta#about'

end
