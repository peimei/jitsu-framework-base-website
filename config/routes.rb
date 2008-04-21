ActionController::Routing::Routes.draw do |map|
  map.resources :users, :sessions
  
  map.with_options :controller => "users" do |page|
    page.register "/register", :action => "new"
    page.activate "/activate/:activation_code", :action => "activate"
  end

  map.with_options :controller => "sessions" do |page|
    page.login "/login", :action => "new"
    page.logout "/logout", :action => "destroy"
  end
  

  map.with_options :controller => "pages" do |page|
    page.index '/', :controller => 'pages'
    page.about '/about', :controller => 'pages', :action => 'about'
    page.welcome '/welcome', :controller => 'pages', :action => 'welcome'
  end
  
  map.root :controller => 'pages'
  

end
