Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my', controllers: {
      sessions:'users/sessions', registrations:'users/registrations', confirmations:'users/confirmations',
      mailer:'users/mailer', passwords:'users/passwords', shared:'users/shared', unlocks:'users/unlocks', users:'users/AdminActions'
  }

  resources :users
  resources :courses


  get 'welcome/index'
  root 'welcome#index'
  get 'myprofile' => 'users#myProfile'
  get '/admin/userlist' => 'admin#adminList'
  get '/admin' => 'admin#adminDash'
  get 'users/:id' => 'users#show', :as => 'show_user'
  get 'teacherportal' => 'teacher#teacherPortal'
  get 'admin/edit/:id' => 'users#adminEdit', :as => 'admin_edit'
  patch 'admin/:id/togApp' => 'users#toggleApproved', :as => 'togApp'
  patch 'admin/:id/togSA' => 'users#toggleSuperAdmin', :as => 'togSA'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
