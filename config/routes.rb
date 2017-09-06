Rails.application.routes.draw do
  resources :portfolios, except: [:show]
  get 'portfolio/:id', to: 'portfolios#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: :contact, controller: 'pages'

  #resources è una parola riservata che incapsula tutte le routes che l'applicazione usa rispetto alla risorsa blog
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  #root 'blogs#hello_html'

  root to: 'pages#home'
end
