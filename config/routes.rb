# frozen_string_literal: true

Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :memes
  get '/memes/hashtag/:name', to: 'memes#hashtags'
  get '/policy', to: redirect('https://termsfeed.com/privacy-policy/87c4adefa87fede697ab0208f845fcd9')
end
