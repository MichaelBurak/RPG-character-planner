Rails.application.routes.draw do

  root 'welcome#home'

  resources :characters do
    resources :planners, only: %i[create show]
  end

  get 'characters/:id(.:format)/experience', to: 'characters#experience', as: 'character_experience'
  get 'characters/:id(.:format)/attribute_selection', to: 'characters#attribute_selection', as: 'character_attributes'
  get 'characters/:id(.:format)/expand', to: 'characters#expand'
  patch 'characters/:id(.:format)/level_up', to: 'characters#level_up', as: 'character_level_update'

  resources :planners, only: %i[] do
    resources :events, except: [:index] do
      resources :treasures, only: %i[new create edit update destroy]
    end
  end

  get 'events/highest_xp', to: 'events#highest_xp', as: 'highest_xp_events'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
end
