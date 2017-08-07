Rails.application.routes.draw do
  root 'welcome#home'
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
