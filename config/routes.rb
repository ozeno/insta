Rails.application.routes.draw do
  devise_for :users
  get 'users/:id' => 'users#show', as: :profile
  resources :pics do
    member do
      put 'like' => 'pics#upvote'
      put 'dislike' => 'pics#downvote'
    end
  end

  root 'pics#index'
end
