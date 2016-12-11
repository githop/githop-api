Rails.application.routes.draw do

  scope(:path => '/api') do 
    resources :paragraphs
    resources :headers
    resources :images
    resources :articles
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
