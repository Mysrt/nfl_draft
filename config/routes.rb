ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  
  map.draft_player '/draft_player/:id', :controller => 'picks', :action => 'draft_player'
  
  map.resources :sessions
  map.resources :users
  map.resources :players
  map.resources :teams
  map.resources :picks

  
  map.root :controller => "picks", :action => "home"
end
