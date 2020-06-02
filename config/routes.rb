Rails.application.routes.draw do
  root 'subs#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get 'sub/index'
  # get 'sub/edit'
  # get 'sub/show'
  # get 'sub/new'
  # post 'sub/create'
  resources :subs do
    resources :topics do

    # '/subs/:sub_id/topics'
    # '/subs/1/topics'

    # /subs/:sub_id/topics/:id
    # /subs/2/topics/1
    end
  end

  # http verb 'url pattern', to : 'controller#action'
    # :id placeholder for id 
    # get '/people', to: 'people#index'
    # "/subs/3"
end
