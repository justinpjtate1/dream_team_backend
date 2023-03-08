class CustomTeamsController < ApplicationController
    skip_before_action :verify_authenticity_token, raise: false
    before_action :authenticate_devise_api_token!
    # before_action :player_params, only: [:save_players]

    def new_team
        CustomTeam.create(team_name:params[:team_name], user_id:params[:user_id])
    end

    def save_players
        # CustomTeamPlayer.create([{custom_team_id:params[:custom_team_id], player_id:params[:player_id], position:params[:user_id]}, {custom_team_id:params[:custom_team_id], player_id:params[:player_id], position:params[:user_id]}])
        # CustomTeamPlayer.create(custom_team_id:params[:custom_team_id], player_id:params[:player_id], position:params[:user_id])
        params[:players].each do |player|
            CustomTeamPlayer.create(custom_team_id: player[:custom_team_id], player_id: player[:player_id], position: player[:position])
        end
    end

    # private
    #     def player_params 
    #         params.require(:player).permit(:custom_team_id, :player_id, :position)
    #     end
end
