Rails.application.routes.draw do
  root 'pages#home'

  get 'backoffice', to: 'backoffice/sessions#new'
  post 'backoffice', to: 'backoffice/sessions#create'

  scope '/backoffice' do
    get 'backoffices', to: 'backoffice/backoffices#home'
  end
end
