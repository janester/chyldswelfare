Chyldswelfare::Application.routes.draw do
  root :to => 'home#index'
  resources :users do
    member do
      get "chart"
    end
  end
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
  resources :donations
  resources :applications do
    member do
      post "vote"
    end
  end

end
