Rails.application.routes.draw do
  root 'application#welcome', defaults: { format: :json }

  get 'categories' => 'categories#index', defaults: { format: :json }
  get 'categories/video' => 'categories#video', defaults: { format: :json }
  get 'categories/:first' => 'categories#show', defaults: { format: :json }
  get 'categories/:first/:second' => 'categories#show', defaults: { format: :json }

  get 'articles/:id' => 'articles#show', defaults: { format: :json }
end
