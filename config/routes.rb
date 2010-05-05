ActionController::Routing::Routes.draw do |map|
  map.resources :picks

  map.resources :picks
  map.resources :players
  map.resources :teams
  
  map.root :controller => "orders", :action => "index"
end
