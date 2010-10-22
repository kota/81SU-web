ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'players', :action => 'index'
  map.resource :session
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'players', :action => 'create'
  map.signup '/signup', :controller => 'players', :action => 'new'

  map.namespace :api do |api|
    api.connect '/players/ranking/:item', :controller => 'players', :action => 'ranking'
    api.connect '/kifus/search/:player_name/:begin_date/:end_date', :controller => 'kifus', :action => 'search'
    api.resources :players, :collection => {:with_login => :get}
    api.resources :kifus
  end
  map.resources :players

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
