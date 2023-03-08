class CustomTeamsController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    before_action :authenticate_devise_api_token!

    def new_team
        @newteam = CustomTeam.create(team_name:params[:team_name], user_id:params[:user_id])
        render json: @newteam
    end

    def save_players
        params[:players].each do |player|
            CustomTeamPlayer.create(custom_team_id: player[:custom_team_id], player_id: player[:player_id], position: player[:position])
        end
    end
end
