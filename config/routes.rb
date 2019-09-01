Rails.application.routes.draw do
  get 'dashboard/index'
  get 'follow/:user_id', to: 'dashboard#follow', as: 'follow'
  get 'unfollow/:user_id', to: 'dashboard#unfollow', as: 'unfollow'
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end

    unauthenticated do
      root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
