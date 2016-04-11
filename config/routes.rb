Rails.application.routes.draw do
  devise_for :users
  resources :sections do
  resources :students
end
  resources :students, only: [] do
    post '/up-point' => 'points#up_point', as: :up_point
     post '/down-point' => 'points#down_point', as: :down_point
   end
  resources :users

  root 'welcome#index'



end
