Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :shopping_list_items, only: %i[index create]
    end
  end
end
