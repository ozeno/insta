Rails.application.routes.draw do
  devise_for :users
  resources :pics do
    member do
      put 'like' => 'pics#upvote'
      put 'dislike' => 'pics#downvote'
    end
  end

  root 'pics#index'
end
