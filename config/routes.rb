Rails.application.routes.draw do
  root 'pages#home'

  get 'backoffice', to: 'backoffice/sessions#new'
  post 'backoffice', to: 'backoffice/sessions#create'

  resources :posts

  scope '/backoffice' do
    get 'backoffices', to: 'backoffice/backoffices#home'
    resources :posts, controller: 'backoffice/posts', as: 'backoffice_posts'
    resources :articles, controller: 'backoffice/articles', as: 'backoffice_articles'
    resources :admins, controller: 'backoffice/admins', as: 'backoffice_admins'
  end
end
