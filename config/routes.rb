Rails.application.routes.draw do
  namespace :user do
    get "dashboard/index"
  end
  namespace :admin do
    get "dashboard/index"
  end
  devise_for :users

  authenticated :user, ->(u) { u.admin? } do
    root to: "admin/dashboard#index", as: :admin_root
  end

  authenticated :user, ->(u) { u.user? } do
    root to: "user/dashboard#index", as: :user_root
  end

  unauthenticated do
    root to: "home#index"
  end
end
