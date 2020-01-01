Rails.application.routes.draw do
  devise_for :writers, controllers: {registrations: 'writers/registrations'}
  devise_scope :writer do
  	get 'writers/sign_up/confirm', to: 'writers/registrations#confirm', as: 'confirm_writer_registration'
  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
