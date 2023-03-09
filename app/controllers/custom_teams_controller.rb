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

    def show_teams
        @teams = CustomTeam.joins(:user).select("custom_teams.id", "custom_teams.team_name", "custom_teams.user_id", "users.email").all
        render json: @teams
    end

    def show_players
        @players = CustomTeamPlayer.joins(player: :club).select("custom_team_players.custom_team_id", "custom_team_players.player_id", "players.player_name", "clubs.club_name", "custom_team_players.position", "players.dob").where(custom_team_id: params[:custom_team_id])
        render json: @players
    end

    def show_teams_from_user
        @teams = CustomTeam.joins(:user).select("custom_teams.id", "custom_teams.team_name", "users.email").where(user_id: params[:id])
        render json: @teams
    end

    def update_team
        @team = CustomTeam.find(params[:custom_team_id])
        @team.update(team_name: params[:custom_team_name])
        @team.save
        render json: @team
    end

    def update_team_players
        # CustomTeamPlayer.joins(player: :club).select("custom_team_players.custom_team_id", "custom_team_players.player_id", "players.player_name", "clubs.club_name", "custom_team_players.position", "players.dob").where(custom_team_id: params[:custom_team_id]).destroy_all
        CustomTeamPlayer.where(custom_team_id: params[:players][0][:custom_team_id]).destroy_all
        params[:players].each do |player|
            CustomTeamPlayer.create(custom_team_id: player[:custom_team_id], player_id: player[:player_id], position: player[:position])
        end
    end

    def delete_team
        CustomTeamPlayer.where(custom_team_id: params[:custom_team_id]).destroy_all
        CustomTeam.find(params[:custom_team_id]).destroy
    end
end
