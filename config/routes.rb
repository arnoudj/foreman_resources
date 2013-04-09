# All routes entered here will automatically be pulled in Foreman
Rails.application.routes.draw do

  namespace :api, :defaults => {:format => 'json'} do
    constraints(:id => /[^\/]+/) do
      resources :hosts,            :except => [:new, :edit] do
        resources :puppetclasses,  :only => :index do
          resources :types,        :only => [:index, :show] do
            resources :resources,  :except => [:new]
          end
        end
      end
    end
  end
end
