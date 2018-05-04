Rails.application.routes.draw do
  resources :portfolios
 
  get 'About-My-Site', to: 'pages#about'
  get 'Contact', to: 'pages#contact'

  resources :blogs

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
end
