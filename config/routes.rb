GkoMotoracingCom::Application.routes.draw do
  get 'motorcycle_lists/:motorcycle_list_id', 
    :to => 'motorcycles#index'

  match 'motorcycle_lists/:motorcycle_list_id/:permalink', 
    :to => "motorcycles#show"
    
  get 'jetski_lists/:jetski_list_id', 
        :to => 'jetskis#index'

  match 'jetski_lists/:jetski_list_id/:permalink', 
        :to => "jetskis#show"   
         
  namespace :admin do
    resources :sites do
      resources :motorcycle_lists do
        resources :motorcycles do
          collection do
            get :selected
          end
        end
      end
      resources :jetski_lists do
        resources :jetskis do
          collection do
            get :selected
          end
        end
      end
    end
  end
end
