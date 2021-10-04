Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :todo_lists, only: [:index, :show] do
        resources :todo_items, only: [:index, :show]
      end
    end
  end


  resources :todo_lists do
    resources :todo_items do
      member do
        patch :complete
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "todo_lists#index"
end
