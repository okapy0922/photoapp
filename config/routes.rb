Rails.application.routes.draw do
  devise_for :users
  resources :photos, only: [:index, :new, :create, :edit, :update, :destroy]do
  collection do
  end
end

  if Rails.env.development?
   mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  root 'top#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
