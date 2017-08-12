Rails.application.routes.draw do
  root 'welcome#home'

  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'
  get '/sign-up', to: 'users#new', as: 'new_user'
  post '/sign-up', to: 'users#create'

  #goal here is /r/<novel code>/<chapter number>
  resources :novels, param: :slug, path: 'r' do
    #has to be above /:chapter to work correctly
    get '/new', to: 'chapters#new', as: 'new_chapter'

    get '/:chapters', to: 'chapters#show', as: 'chapter'
    get '/:chapters/edit', to: 'chapters#edit', as: 'edit_chapter'
    patch '/:chapters', to: 'chapters#update'
    put '/:chapters', to: 'chapters#update'
    delete '/:chapters', to: 'chapters#destroy'
    post '/', to: 'chapters#create', as: 'create_chapter'
  end
end
