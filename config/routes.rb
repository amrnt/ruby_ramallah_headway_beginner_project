RubyDemo::Application.routes.draw do
  resources :posts do
    resources :comments
    # get "comments/index"
    # get "comments/show"
    # get "comments/new"
    # get "comments/edit"
    # post "comments/create"
    # put "comments/update"
    # delete "comments/destroy"
    member do
     get :title
   end
  end
  root :to => 'posts#index'
end
