Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :posts

  resources :forum_topics

  resources :forums

  resources :topics

  devise_for :users

  root 'topics#index'

  resources :messages
  resources :conversations

  get 'users/settings', to: 'users#settings', as: :user
  patch 'users/settings', to: 'users#update', as: :update_user_settings

  get 'users/:id/', to: 'users#profile', as: :user_profile

  get 'topic_upvote/:id', to: 'topics#upvote', as: :upvote
  get 'topic_downvote/:id', to: 'topics#downvote', as: :downvote

  get 'post_upvote/:id', to: 'posts#upvote', as: :post_upvote
  get 'post_downvote/:id', to: 'posts#downvote', as: :post_downvote

  post 'upvote/', to: 'topics#upvote', as: :modal_upvote
  post 'downvote/', to: 'topics#downvote', as: :modal_downvote

  get 'threads/:forum_topic_id', to: 'posts#index', as: :thread

  get 'show_forum/:forum_id', to: 'forum_topics#index', as: :show_forum

  get 'manage_users', to: 'admin#manage_users', as: :manage_users

  delete 'delete_post/:post_id', to: 'admin#delete_post', as: :delete_post

  get 'list_forums', to: 'forums#index', as: :list_forums

  delete 'delete_topic/:topic_id', to: 'admin#delete_topic', as: :delete_topic

  delete 'delete_thread/:forum_topic_id', to: 'admin#delete_thread', as: :delete_thread
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
