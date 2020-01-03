Rails.application.routes.draw do

  devise_for :writers, controllers: {registrations: 'writers/registrations'}
  devise_scope :writer do
  	post 'writers/sign_up/confirm', to: 'writers/registrations#confirm', as: 'confirm_writer_registration'
  	post 'writers/sign_up', to: 'writers/registrations#back', as: 'back_writer_registration'
  end

  root to: 'writers/writers#show'


  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
