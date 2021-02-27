Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/:slug', to: 'api/v1/links#show'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :links
    end
  end
end
