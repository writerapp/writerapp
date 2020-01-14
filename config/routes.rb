Rails.application.routes.draw do
  namespace :admins do
    get 'articles/index'
    get 'articles/show'
    get 'articles/edit_headings'
    get 'articles/edit'
  end
  namespace :writers do
    get 'articles/keywords'
    get 'articles/index'
    get 'articles/show'
    get 'articles/edit_headings'
    get 'articles/edit'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :writers, controllers: { sessions: 'writers/sessions'}, skip: [:registrations]
  devise_scope :writer do
  	get 'writers/sign_up', to:'writers/registrations#new', as: 'new_writer_registration'
  	get 'writers/edit', to:'writers/registrations#edit', as: 'edit_writer_registration'
    patch 'writers', to:'writers/registrations#update', as: 'writer_registration'
    put 'writers', to:'writers/registrations#update', as: nil
    post 'writers', to:'writers/registrations#create', as: nil
  	post 'writers/sign_up/confirm', to: 'writers/registrations#confirm', as: 'confirm_writer_registration'
  	post 'writers/sign_up', to: 'writers/registrations#back', as: 'back_writer_registration'
  end

  root to: 'writers/writers#show'


  devise_for :admins, controllers: {sessions: 'admins/sessions'}, skip: [:registrations]
  namespace :admins do
  	get '', to: 'admins#top'
  end
end

