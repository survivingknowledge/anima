Rails.application.routes.draw do
  root 'welcome#home'
  resources :novels, param: :slug
end
