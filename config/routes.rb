Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orgs, only: [:index], param: :name do
    resources :repositories, only: [:index]
  end
end
