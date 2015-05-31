Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    # Use member since want :id, not :question_id, in routes
    # http://stackoverflow.com/questions/5182734/what-does-a-member-and-collection-route-mean
    # Good examples in original routes file (as comments)
   member do
      post 'upvote'
      post 'downvote'
      get :autocomplete
    end
    resources :answers, only: [:create, :edit, :update, :destroy] do
      member do
        post 'upvote'
        post 'downvote'
        get :autocomplete
      end
    end
  end
end
