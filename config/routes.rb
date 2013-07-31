SessionsTemplate::Application.routes.draw do
  resources :users, :only => [:new, :create, :show]
  resource :session, :only => [:new, :create, :destroy]

  root :to => "gists#index"

  resources :gists do
    resource :favorite, :only => [:create, :destroy]
  end

  resources :favorites, :only => [:index]
end
