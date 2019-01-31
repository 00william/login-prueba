Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # URL raiz
  root 'sessions#new'

  # Ruta controlador Users para el registro
  get 'signup'  => 'users#new'

  # Rutas controlador Sessions
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  # Rutas RESTful para users
  resources :users
end
