Notes::Application.routes.draw do
  devise_for :users

  root :to => "notes#index"
  resources :notes
end
