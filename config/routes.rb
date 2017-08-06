Rails.application.routes.draw do
  root 'welcome#home'
  #goal here is /r/<novel code>/<chapter number>
  resources :novels, param: :slug, path: 'r' do
    get '/:chapter', to: 'chapters#show', as: 'chapter'
    get '/:chapter/new', to: 'chapters#new', as: 'new_chapter'
    get '/:chapter/edit', to: 'chapters#edit', as: 'edit_chapter'
    patch '/:chapter', to: 'chapters#update'
    put '/:chapter', to: 'chapters#update'
    delete '/:chapter', to: 'chapters#destroy'
    post '/:chapter', to: 'chapters#create'
  end
end
