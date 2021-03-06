Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'my', controllers: {
      sessions:'users/sessions', registrations:'users/registrations', confirmations:'users/confirmations',
      mailer:'users/mailer', passwords:'users/passwords', shared:'users/shared', unlocks:'users/unlocks', users:'users/AdminActions'
  }

  resources :users

  resources :courses do
    resources :projects
  end

  resources :users do
    resources :enrollment
  end

  resources :projects do
    resources :teams
    resources :ratings
  end

  resources :teams do
      resources :team_memberships
      resources :ratings
  end

  resources :ratings do
    resources :users
  end


  resources :team_memberships do
    resources :ratings
  end



  resources :universities
  resources :semesters
  resources :teacher
  # resources :enrollment
  # resources :ratings, :except => [:new]



  get 'welcome/index'
  root 'welcome#index'
  get 'myprofile' => 'users#myProfile'
  get '/admin/userlist' => 'admin#adminList'
  get '/admin' => 'admin#adminDash'
  get 'users/:id' => 'users#show', :as => 'show_user'
  get 'teacherportal' => 'courses#teacherPortal'
  get 'enrollme/:user_id' => 'enrollment#new'
  get 'myclasses' => 'courses#myclasses'
  get 'admin/edit/:id' => 'users#adminEdit', :as => 'admin_edit'
  get 'admin/resetpassword/:id' => 'users#passwordReset', :as => 'admin_password_reset'
  get 'admin/enrollment' => 'enrollment#adminNew'
  # get 'ratings/:team_id/:user_id/new' => 'ratings#new', :as => 'new_rating'
  patch 'admin/:id/togApp' => 'users#toggleApproved', :as => 'togApp'
  patch 'admin/:id/togSA' => 'users#toggleSuperAdmin', :as => 'togSA'
  patch 'admin/:id/togIns' => 'users#toggleInstructor', :as => 'togIns'
  patch 'admin/:id/togOrgAd' => 'users#toggleOrgAdmin', :as => 'togOA'
  patch 'admin/:id/togStudent' => 'users#toggleStudent', :as => 'togStu'
  post 'banStudent/:cid/:sid' => 'enrollment#toggleBan', :as => 'banStudent'
  post 'unenroll/:cid/:sid' => 'enrollment#unEnroll', :as => 'removeEnrollment'
  post 'team/:team_id/team_memberships' => 'team_memberships#joinGroup', :as => 'team_joinGroup'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
