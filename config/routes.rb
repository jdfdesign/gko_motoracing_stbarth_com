GkoMotoracingCom::Application.routes.draw do
  get 'motorcycle_lists/:motorcycle_list_id', 
    :to => 'motorcycles#index'

  match 'motorcycle_lists/:motorcycle_list_id/:permalink', 
    :to => "motorcycles#show"
    
  namespace :admin do
    resources :sites do
      resources :motorcycle_lists do
        resources :motorcycles
      end
    end
  end
end
