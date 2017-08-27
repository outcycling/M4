Rails.application.routes.draw do
  resources :readings
  resources :pictures
  devise_for :users, controllers: {
        sessions: 'users/sessions'
      }
  get 'pages/home'
    
    

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    
    root 'pages#home'
    
end
