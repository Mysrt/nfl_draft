ActionController::Routing::Routes.draw do |map|
  map.signup 'signup', :controller => 'users', :action => 'new'
  map.logout 'logout', :controller => 'sessions', :action => 'destroy'
  map.login 'login', :controller => 'sessions', :action => 'new'
  
  map.draft_player '/draft_player/:id', :controller => 'picks', :action => 'draft_player'
  map.results '/results/', :controller => 'picks', :action => 'results'
  map.undrafted '/undrafted', :controller => 'players', :action => 'undrafted'
  map.resources :sessions, :users, :players, :teams, :picks
  
  map.root :controller => "picks", :action => "home"
end
