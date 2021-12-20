Rails.application.routes.draw do
  resources :memos
  devise_for :users
  resources :todos
  resources :users, only: [:index]
 
  get "/nums", to: "calcs#new"
  post "/nums", to: "calcs#exec"
  post "/nums2", to: "calcs#exec2"
  post "/nums3", to: "calcs#exec3"
  post "/nums4", to: "calcs#exec4"

end
