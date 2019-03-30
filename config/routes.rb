Rails.application.routes.draw do
  devise_for :users, controllers: {
      sessions:'users/sessions', registrations:'users/registrations', confirmations:'users/confirmations',
      mailer:'users/mailer', passwords:'users/passwords', shared:'users/shared', unlocks:'users/unlocks', users:'users/AdminActions'
  }

  get 'welcome/index'
  root 'welcome#index'
  get 'myprofile' => 'users#myProfile'
  get '/admin/userlist' => 'admin#adminList'
  get '/admin' => 'admin#adminDash'
  get 'users/:id' => 'users#show', :as => 'show_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
