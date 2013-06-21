# All routes entered here will automatically be pulled in Foreman
Rails.application.routes.draw do

  namespace :api, :defaults => {:format => 'json'} do
    constraints(:id => /[^\/]+/) do
      resources :hosts,             :except => [:new, :edit] do
        resources :puppetclasses,   :only => :index do
          resources :types,         :only => [:index, :show] do
            #get 'resources/*x' => 'resources#show', :format => false
            #put 'resources/*x' => 'resources#update', :format => false
            #delete 'resources/*x' => 'resources#delete', :format => false
            resources :resources,   :id => /.+/, :except => [:new]
          end
        end
      end
      resources :puppetclasses do
        member do
          get 'search'
        end
      end
    end
  end
end
