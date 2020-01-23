Rails.application.routes.draw do

  # 記事/キーワード機能
  namespace :writers do
    get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
    get 'articles/keywords', to: 'articles#keywords', as: 'keywords'
    patch 'articles/:id/apply', to: 'articles#apply', as: 'apply_article'
    get 'articles/:id/headings/edit', to: 'articles#edit_headings', as: 'edit_headings'
    patch 'articles/:id/headings', to: 'articles#update_headings', as: 'headings'
    patch 'articles/:id/headings/apply', to: 'articles#apply_headings', as: 'apply_headings'
    resources :articles, except: [:destroy, :new, :edit]
  end

  namespace :admins do
    get 'articles/:id/edit', to: 'articles#edit', as: 'edit_article'
    patch 'articles/:id/approve', to: 'articles#approve', as: 'approve_article'
    get 'articles/:id/headings/edit', to: 'articles#edit_headings', as: 'edit_headings'
    patch 'articles/:id/headings', to: 'articles#update_headings', as: 'headings'
    patch 'articles/:id/headings/approve', to: 'articles#approve_headings', as: 'approve_headings'
    resources :articles, except: [:create, :new, :edit]
  end

  # 認証機能
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

