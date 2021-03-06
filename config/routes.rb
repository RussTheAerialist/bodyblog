ActionController::Routing::Routes.draw do |map|
  map.resources :insanity_fit_test_results

  map.resources :photo_types

  map.resources :body_photos, :member => { :calendar => :get,
                                           :calendar_highlight => :get,
                                           :thumbnail => :get }

  map.resources :blogs

  map.resources :users


  map.resource :user_session
  map.resource :account, :controller => "users"

  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  map.root :controller => "calendar"
  map.charts_index 'progress', :controller=> "charts"
  map.charts 'progress/:action.:format', :controller=> "charts"
  map.feeds 'feeds.:format', :controller=>"feeds", :action=>"index"
  map.archive ':year/:month', :controller=>"calendar", :action=>"show"
  map.year ':year', :controller=>"calendar", :action=>"year"
  map.archive_formatted ':year/:month.:format',
              :controller=>"calendar", :action=>"show"

  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
