RailsApp::Application.routes.draw do
  resources :supports


  root :to => 'homes#index'
  resources :demands,
    :only => [:new, :create]
  resources :services,
    :only => [:index, :edit, :update]
  resources :machines
  resources :questions
  match 'questions/:id/answers',
    :controller => 'questions',
    :action => 'answers',
    :via => 'get',
    :as => 'answers_question'
  resources :answers,
    :only => [:new, :create]
  get "details/services"
  devise_for :users
  match '*path', :to=>'application#error_404'
end
