Bloog::Application.routes.draw do
  resource :posts

  root to: "blog#index"
end
