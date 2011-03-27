Butterfly::Application.routes.draw do

  get ":username", :to => "users#show"

  root :to => "users#index"

end