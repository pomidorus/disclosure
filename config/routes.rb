Rails.application.routes.draw do
  # get 'position/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resource :declaring, only: [:new, :create]

  resources :city_council, path: '', only: [:show]
  resources :position, path: 'posada', only: [:show]

  get '/add-disclosure', to: 'declarings#new'

  get '/general-income/family', to: 'general_income#family'
  get '/general-income/personal', to: 'general_income#personal'

  get '/public-asset-disclosure/learn-more', to: 'pages#disclosure_learn'
  get '/control-disclosure-information', to: 'pages#control_disclosure'

  root 'main#index'
end
