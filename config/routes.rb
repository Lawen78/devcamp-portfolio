Rails.application.routes.draw do
  #resources è una parola riservata che incapsula tutte le routes che l'applicazione usa rispetto alla risorsa blog
  resources :blogs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
