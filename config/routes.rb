Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :memes
  get '/memes/hashtag/:name', to: 'memes#hashtags'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
