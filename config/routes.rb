Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root controller: 'welcome', action: :index

  get '/auth/github', as: :github_login

  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  get '/:username', to: 'profiles#show'
  get '/:username/repos', to: 'repos#index'
  get '/:username/followers', to: 'followers#index'
  get '/:username/following', to: 'following#index'
  get '/:username/starred', to: 'starred#index'
end
