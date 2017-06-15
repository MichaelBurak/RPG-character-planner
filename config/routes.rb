Rails.application.routes.draw do

  root 'welcome#home'
  resources :characters do
    resources :planners

  end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
