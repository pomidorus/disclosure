Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  resource :declaring, only: [:new, :create]

  resources :city_council, path: 'rada', only: [:show]
  resources :position, path: 'posada', only: [:show]

  get '/add-disclosure', to: 'declarings#new'

  get '/general-income/family', to: 'general_income#family'
  get '/general-income/personal', to: 'general_income#personal'

  get '/public-asset-disclosure/learn-more', to: 'pages#disclosure_learn'
  get '/control-disclosure-information/learn-more', to: 'pages#control_disclosure'

  get '/family-general-income', to: 'main#family_general_income'
  get '/personal-general-income', to: 'main#personal_general_income'

  root 'main#index'
end
