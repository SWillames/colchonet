Rails.application.routes.draw do
  LOCALES = /en|pt\-BR/

  scope ":locale", locale: LOCALES do
   
   resources :rooms	
   resources :users
   
   get ':locale' => 'home#index'#, locale: LOCALES
   
   resource :user_sessions, only: [:create, :new, :destroy], locale: LOCALES 
   
  end

  get 'confirmation' => 'confirmations#show', locale: LOCALES

  root 'home#index', locale: LOCALES   


end
