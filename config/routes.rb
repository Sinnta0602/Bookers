Rails.application.routes.draw do

  resources :books
  root to: 'books#new'
  # <%= link_to "Show", book_path(@book)
  # get "/books/" =>"books#edit"
  # root to: 'books#edit'
end