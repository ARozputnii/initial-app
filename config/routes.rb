Rails.application.routes.draw do
  get 'pages/home'
  root 'pages#home'

  get 'backoffice', to: 'backoffice/sessions#new'
  post 'backoffice', to: 'backoffice/sessions#create'


  scope '/backoffice' do
    get 'backoffices', to: 'backoffice/backoffices#home'
    resources :posts, controller: 'backoffice/posts', as: 'backoffice_posts' do
      resources :comments, controller: 'backoffice/comments', as: 'backoffice_comments'
    end
    resources :admins, controller: 'backoffice/admins', as: 'backoffice_admins'
  end
end
