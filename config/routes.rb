Rails.application.routes.draw do
  root 'welcome#home'
  resources :novels
end
