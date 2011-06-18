ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'players', :action => 'index'
  map.resource :session
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'players', :action => 'create'
  map.signup '/signup', :controller => 'players', :action => 'new'

  map.namespace :api do |api|
    api.connect '/players/search/:name', :controller => 'players', :action => 'search'
    api.connect '/players/ranking/:item', :controller => 'players', :action => 'ranking'
    api.connect '/players/ranking34/:item', :controller => 'players', :action => 'ranking34'
    api.connect '/players/detail/:name', :controller => 'players', :action => 'detail'
    api.connect '/kifus/search/:player_name/:begin_date/:end_date', :controller => 'kifus', :action => 'search'
    api.resources :players, :collection => {:with_login => :get,:authenticate => :get}
    api.connect '/rate_change_histories/search/:name', :controller => 'rate_change_histories', :action => 'search'
    api.resources :kifus
    api.resources :servers, :collection => {:with_name => :get}
    api.resources :rate_change_histories
  end
  map.resources :players

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
