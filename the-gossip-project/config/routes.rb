Rails.application.routes.draw do
  root 'pages#home'
  get 'team', to: 'pages#team'
  get 'contact', to: 'pages#contact'
  get 'potins/:id', to: 'pages#show', as: 'potins_id'
  get 'welcome/:first_name', to: 'pages#welcome'
  get 'potins/:id/user', to: 'pages#show_user', as: 'user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
