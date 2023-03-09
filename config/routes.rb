Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/players'
  get 'pages/user_logged_in'
  get 'players/player_search'
  get 'players/club_search'
  post 'custom_teams/new_team'
  post 'custom_teams/save_players'
  get 'custom_teams/show_teams'
  post 'custom_teams/show_players'
  post 'custom_teams/show_teams_from_user'
  patch 'custom_teams/update_team'
  post 'custom_teams/update_team_players'
  delete 'custom_teams/delete_team'
  devise_for :users
  resources :players
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
