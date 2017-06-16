Rails.application.routes.draw do

  root 'welcome#home'
  resources :characters do
    resources :planners, only: %i[create show]

  end

  get 'characters/:id(.:format)/experience', to: 'characters#experience', as: 'character_experience'
  resources :planners do
    resources :events
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end