Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tunings, only: %i[index show]
  resources :instruments, only: %i[index show]
end
