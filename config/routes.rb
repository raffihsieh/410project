TestApp::Application.routes.draw do
  get "test/home"
  get "test/home1"
  get "home/index"

  match "/search" => "test#search"

  root :to => "test#home"
end
