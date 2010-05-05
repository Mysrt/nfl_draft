ActionController::Routing::Routes.draw do |map|
  map.resources :players

  map.resources :teams

  map.resources :picks

  map.resources :picks

  map.resources :picks
  map.resources :players
  map.resources :teams
  
  map.root :controller => "picks", :action => "index"
end
