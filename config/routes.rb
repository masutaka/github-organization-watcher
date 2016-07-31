Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :orgs, only: [:index], param: :name do
    resources :repos, only: [:index]
  end

  scope '/repos/:owner/:repo', constraints: { repo: /[A-Za-z0-9_.-]+/ } do
    resource :subscription, only: [:update]
  end
end
